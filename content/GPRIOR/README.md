---
title: GPRIOR
---
||ADR||HEXADR||NAME||Description||shadow of||OS  
|623| $026F|GPRIOR|Priority Selection Register| [PRIOR](../PRIOR/README.md) |all  
  
## Priority Settings  
||Bit||Value||Description  
|0|1|P0-P1-P2-P3 PF0-PF1-PF2-PF3 BAK  
|1|2|P0-P1 PF0-PF1-PF2-PF3 P2-P3 BAK  
|2|4|PF0-PF1-PF2-PF3 P0-P1-P2-P3 BAK  
|3|8|PF0-PF1 P0-P1-P2-P3 PF2-PF3 BAK  
|4|16|Four Missiles add up to be 5th player  
|5|32|Overlapping Players have 3rd color  
|6|64|GTIA Mode see next table  
|7|128|GTIA Mode see next table  
P0-P3 Players [PCOLR0](../PCOLR0/README.md).../[COLPM0](../COLPM0/README.md)...  
PF0-PF3 Playfield colors [COLOR0](../COLOR0/README.md).../[COLPF0](../COLPF0/README.md)...  
BAK background or border color [COLOR4](../COLOR4/README.md)/[COLBAK](../COLBAK/README.md)  
  
A logical OR is done to the colors of players 0/1 and 2/3 when they overlap. Only the 0/1, 2/3 combinations are allowed; you will not get a third color when players 1 and 3 overlap, the priorities set with bits 0…3 are applied.  
  
If put together into a 5th player (set Bit 4 to '1') the missiles get the color of register 3 [COLOR3](../COLOR3/README.md). They still move independently, e.g. set their horizontal positions with [HPOSM0](../HPOSM0/README.md) - [HPOSM3](../HPOSM3/README.md)  
  
## GTIA Modes  
This register can be used to select one of GTIA GRAPHICS modes 9, 10 and 11.  
||GTIA Mode*||Bit 6||Bit 7||Description  
|9|0|1|16 different luminances of the same hue (color)  
|10|1|0|9 different colors  
|11|1|1|16 different hues (colors) of the same luminance  
* the same as GRAPHICS x in BASIC  
---
  
see also: [Player Missile Topics](../Pm_topics/README.md)  
  
previous: [FINE](../FINE/README.md)  
  
next: [PADDL0](../PADDL0/README.md)  
