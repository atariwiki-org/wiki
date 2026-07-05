---
title: HPOSM0
---
%%tabbedSection  
%%tab-english  
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS  
|Write| 53252 |$D004|HPOSM0|horizontal position of missile 0|both  
|Read| 53252 |$D004|P0PF|player 0 collision with playfield|both  
  
### Write: Horizontal position of missile 0  
Values from 0 to 255, missile is visible between 48 to 208 depending on playfield width (see [SDMCTL](../SDMCTL/README.md)) and width of missile (see [SIZEM](../SIZEM/README.md)/M0).  
### Read: Player 0 collision with playfield  
  
||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0  
|Playfield| | | |  |3| 2| 1| 0  
Playfield corresponds to [COLOR0](../COLOR0/README.md), ..., [COLOR3](../COLOR3/README.md) color register  
/%  
%%tab-deutsch  
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS  
|Write| 53252 |$D004|HPOSM0|Horizontale Position Missile 0|both  
|Read| 53252 |$D004|P0PF|Kollision Player 0 mit Playfield|both  
  
### Write: Horizontale Position von Missile 0  
Werte von 0 bis 255 möglich, Missile sichtbar zwischen 48?? bis 208?? abhängig von der Spielfeldbreite (siehe [SDMCTL](../SDMCTL/README.md)) und Breite des Missiles (siehe [SIZEM](../SIZEM/README.md)/M0).  
  
### Read: Kollision Player 0 mit Playfield  
  
||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0  
|Playfield| | | |  |3| 2| 1| 0  
Playfield entspricht dem Farbregister [COLOR0](../COLOR0/README.md), ..., [COLOR3](../COLOR3/README.md)  
/%  
/%  
---
see also:[Player Missile Topics](../Pm_topics/README.md)  
  
previous: [HPOSP3](../HPOSP3/README.md), [M3PF](../HPOSP3/README.md)  
  
next: [HPOSM1](../HPOSM1/README.md), [P1PF](../HPOSM1/README.md)  
