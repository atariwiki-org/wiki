---
title: TINDEX
---
||DEC||HEX||NAME||OS  
|659|$293|TINDEX|all  
  
Contains the current split-screen text window GRAPHICS mode. It is the split-screen equivalent to [DINDEX](../DINDEX/README.md) (location 87; $57) and is always equal to zero when location [SWPFLG](../SWPFLG/README.md) 123 ($7B) equals zero. Initialized to zero (which represents GR.0). You can alter the display list to change the text window into any GRAPHICS mode desired. If you do so, remember to change [TINDEX](../TINDEX/README.md) to reflect that alteration.  
  
see also:  
  
previous: [TXTCOL](../TXTCOL/README.md)  
  
next: [TXTMSC](../TXTMSC/README.md)  
