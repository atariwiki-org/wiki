---
title: SIZEP2
---
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS  
|Write| 53258 |$D00A|SIZEP2|Size Player 2|both  
|Read| 53258 |$D00A|M2PL|Collision Missile 2 with Player|both  
  
### Write: Width Player 2  
||decimal||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0  
|0|normal| | | | | | | 0| 0  
|1|double| | | | | | | 0| 1  
|2|normal| | | | | | | 1| 0  
|3|quadruple| | | | | | | 1| 1  
  
### Read: Collision Missile 2 with Player x  
  
||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0  
|Player x=| | | |  |3| 2| 1| 0  
---
see also:[Player Missile Topics](../Pm_topics/README.md)  
  
previous: [SIZEP1](../SIZEP1/README.md), [M1PL](../SIZEP1/README.md)  
  
next: [SIZEP3](../SIZEP3/README.md), [M2PL](../SIZEP3/README.md)  
