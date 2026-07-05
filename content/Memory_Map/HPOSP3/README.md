---
title: HPOSP3
---
%%tabbedSection  
%%tab-english  
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS  
|Write| 53251 |$D003|HPOSP3|horizontal position of player 3|both  
|Read| 53251 |$D003|M3PF|missile 3 collision with playfield|both  
  
### Write: Horizontal position of player 3  
Values from 0 to 255, player is visible between 48 to 208 depending on playfield width (see [SDMCTL](../SDMCTL/README.md)) and width of player (see [SIZEP3](../SIZEP3/README.md)).  
### Read: Missile 3 collision with playfield  
  
||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0  
|Playfield| | | |  |3| 2| 1| 0  
Playfield corresponds to [COLOR0](../COLOR0/README.md), ..., [COLOR3](../COLOR3/README.md) color register  
/%  
%%tab-deutsch  
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS  
|Write| 53251 |$D003|HPOSP3|Horizontale Position Player 3|both  
|Read| 53251 |$D003|M3PF|Kollision Missile 3 mit Playfield|both  
  
### Write: Horizontale Position von Player 3  
Werte von 0 bis 255 möglich, Player sichtbar zwischen 48 bis 208 abhängig von der Spielfeldbreite (siehe [SDMCTL](../SDMCTL/README.md)) und Breite des Players (siehe [SIZEP3](../SIZEP3/README.md)).  
  
### Read: Kollision Missile 3 mit Playfield  
  
||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0  
|Playfield| | | |  |3| 2| 1| 0  
Playfield entspricht dem Farbregister [COLOR0](../COLOR0/README.md), ..., [COLOR3](../COLOR3/README.md)  
/%  
/%  
---
see also:[Player Missile Topics](../Pm_topics/README.md)  
  
previous: [HPOSP2](../HPOSP2/README.md), [M2PF](../HPOSP2/README.md)  
  
next: [HPOSM0](../HPOSM0/README.md), [P0PF](../HPOSM0/README.md)  
