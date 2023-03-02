----------------------------------------------------------------------
-- Converts a single sprite image into a basic text-based ASCII file.
-- 
-- Outputs the following:
-- 1) A text file of the raw ASCII art using incremental letters for 
--    each pixel.
-- 2) A json file of each letter and it's corresponding color (rgb).
----------------------------------------------------------------------
-- By joshalexjacobs (https://github.com/Joshalexjacobs)
----------------------------------------------------------------------

-- https://github.com/rxi/json.lua
local json = dofile("_modules/json.lua")

sprite = app.activeSprite

startingLetter = 'A'

local function formatDecimal(x)
  return tonumber(string.format("%.2f", x))
end

if sprite then 
  unique_colors = {}

  pixels = {}

  for i, cel in ipairs(sprite.cels) do
    for it in cel.image:pixels() do
      local pixelValue = it() -- get pixel

      it(pixelValue) -- set pixel

      if pixelValue ~= 0 then
        -- add unique color to the list if there is one
        if unique_colors[tostring(pixelValue)] == nil then
          redComponent = app.pixelColor.rgbaR(pixelValue)

          greenComponent = app.pixelColor.rgbaG(pixelValue)

          blueComponent = app.pixelColor.rgbaB(pixelValue)

          alphaComponent = app.pixelColor.rgbaA(pixelValue)

          unique_colors[tostring(pixelValue)] = {letter = startingLetter, color = {r = redComponent, g = greenComponent, b = blueComponent, a = alphaComponent}}

          startingLetter = string.char(startingLetter:byte() + 1)
        end
      end

      if pixels[it.y + 1] == nil then
        pixels[it.y + 1] = {}
      end

      pixels[it.y + 1][it.x + 1] = {pixelValue = pixelValue, x = it.x, y = it.y}
    end
  end

  -- write colors to file
  local path,title = sprite.filename:match("^(.+[/\\])(.-).([^.]*)$")

  local fileName = path .. title

  file, err = io.open(fileName .. ".json", "w")

  if file == nil then
    print("error " .. err)
  else 
    io.output(file)

    -- create a new colors table without pixelValue
    parsed_colors = {}

    for k,v in pairs(unique_colors) do
      parsed_colors[v.letter] = {
        r = v.color.r,
        g = v.color.g,
        b = v.color.b,
        a = v.color.a
      }

      -- Love2D: convert colors to float (0 - 1)
      -- parsed_colors[v.letter] = {
      --   r = formatDecimal(v.color.r / 255),
      --   g = formatDecimal(v.color.g / 255),
      --   b = formatDecimal(v.color.b / 255),
      --   a = formatDecimal(v.color.a / 255)
      -- }
    end

    colors = json.encode(parsed_colors)

    io.write(colors)

    io.close(file)
  end

  -- write pixels to file
  file, err = io.open(fileName .. ".txt", "w")

  if file == nil then
    print("error " .. err)
  else 
    io.output(file)

    for y = 1, #pixels, 1 do
      for x = 1, #pixels[y] do
        if pixels[y][x].pixelValue == 0 then
          io.write(" ")  
        else 
          io.write(unique_colors[tostring(pixels[y][x].pixelValue)].letter)
        end
      end

      io.write("\n")
    end

    io.close(file)

    print("Conversion complete!")

    print("A .json and .text file can be found at: " .. path)
  end
end