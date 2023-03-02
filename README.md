# Aseprite ASCII Script
An Aseprite script that converts a sprite into ASCII.

**Currently this script only works with a single layer. In order to capture the entire sprite, you'll need to merge everything down into one layer before running the script.**

## How To

Clone this repo and place `ASCII.lua` and the `_modules` directory into your Aseprite scripts folder (the script will fail if it can't find `json.lua` in the `_modules` folder).

Next, run the script from within Aseprite via `File > Scripts > ASCII`:

![Running the script gif](https://github.com/Joshalexjacobs/aseprite-ascii-script/blob/main/run-script.gif)

Once finished, there are should be 2 additional files in the directory containing your `.ase` file.

1. A `.json` file that contains color data for each corresponding letter. The more colors you have in your sprite, the more letters should appear here.


_Note: there's currently an untested limit to how many colors a single sprite can support._

```
{
   "A":{
      "g":82,
      "r":36,
      "a":255,
      "b":59
   },
   "B":{
      "g":175,
      "r":93,
      "a":255,
      "b":141
   }
}
```

2. A `.text` file that contains the ASCII version of your sprite. Each letter displayed here corresponds with the above color key.

```
              AAAA              
             AAAAAA             
          AAAAAAAAAAAA          
         AAAAAAAAAAAAAA         
       AAAAAAAAAAAAAAAAAA       
      AAAAAAAAAAAAAAAAAAAA      
     AAAAABAAAAAAAAAABAAAAA     
    AAAAABBBAAAAAAAABBBAAAAA    
   AAAAAAABAAAAAAAAAABAAAAAAA   
  AAAAAAAAAAAAAAAAAAAAAAAAAAAA  
  AAAAAAAAAAAAAAAAAAAAAAAAAAAA  
 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
AAAAAAAAAABBBBBBBBBBBBAAAAAAAAAA
AAAAAAAAABBBBBBBBBBBBBBAAAAAAAAA
AAAAAAAAABBBBBBBBBBBBBBAAAAAAAAA
AAAAAAAAABBBBBBBBBBBBBBAAAAAAAAA
AAAAAAAAABBBBBBBBBBBBBBAAAAAAAAA
 AAAAAAAAABBBBBBBBBBBBAAAAAAAAA 
 AAAAAAAAABBBBBBBBBBBBAAAAAAAAA 
  AAAAAAAAABBBBBBBBBBAAAAAAAAA  
       AAAAAAAAAAAAAAAAAA       
              AAAA              

```
