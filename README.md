# Aseprite ASCII Script
An Aseprite script that converts a single sprite into ASCII.

*Currently only works with 1 layer so you'll need to merge down before running the script.*

## How To

Clone this repo and place `ASCII.lua` and the `_modules` directory into your Aseprite scripts folder.

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