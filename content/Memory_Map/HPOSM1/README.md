---
title: HPOSM1
---
%%tabbedSection  
%%tab-english  
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS  
|Write| 53253 |$D005|HPOSM1|horizontal position of missile 1|both  
|Read| 53253 |$D005|P1PF|player 1 collision with playfield|both  
  
### Write: Horizontal position of missile 1  
Values from 0 to 255, missile is visible between 48 to 208 depending on playfield width (see [SDMCTL](../SDMCTL/README.md)) and width of missile (see [SIZEM](../SIZEM/README.md)/M1).  
### Read: Player 1 collision with playfield  
  
||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0  
|Playfield| | | |  |3| 2| 1| 0  
Playfield corresponds to [COLOR0](../COLOR0/README.md), ..., [COLOR3](../COLOR3/README.md) color register  
/%  
%%tab-deutsch  
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS  
|Write| 53253 |$D005|HPOSM1|Horizontale Position Missile 1|both  
|Read| 53253 |$D005|P1PF|Kollision Player 1 mit Playfield|both  
  
### Write: Horizontale Position von Missile 1  
Werte von 0 bis 255 möglich, Missile sichtbar zwischen 48?? bis 208?? abhängig von der Spielfeldbreite (siehe [SDMCTL](../SDMCTL/README.md)) und Breite des Missiles (siehe [SIZEM](../SIZEM/README.md)/M1).  
  
### Read: Kollision Player 1 mit Playfield  
  
||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0  
|Playfield| | | |  |3| 2| 1| 0  
Playfield entspricht dem Farbregister [COLOR0](../COLOR0/README.md), ..., [COLOR3](../COLOR3/README.md)  
/%  
/%  
---
see also:[Player Missile Topics](../Pm_topics/README.md)  
  
previous: [HPOSM0](../HPOSM0/README.md), [P0PF](../HPOSM0/README.md)  
  
next: [HPOSM2](../HPOSM2/README.md), [P2PF](../HPOSM2/README.md)  
