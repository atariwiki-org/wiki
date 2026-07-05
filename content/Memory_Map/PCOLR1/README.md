---
title: PCOLR1
---
||ADR||HEXADR||NAME||DESCRIPTION||SHADOW OF||OS  
|705|$02C1|PCOLR1|Color of Player and Missile 1|[COLPM1](../COLPM1/README.md) |all  
  
Missiles have the same color as corresponding Players (e.g. P0=M0, P1=M1) except when joined together as 5th player by setting Bit 4 of [PRIOR](../PRIOR/README.md)/[GPRIOR](../GPRIOR/README.md). Then they have the color of register 3 [COLOR3](../COLOR3/README.md)/[COLPF3](../COLPF3/README.md).  
  
---
see also: [Color topics](../Color_topics/README.md), [Pm_topics](../Pm_topics/README.md)  
  
previous: 704, $02C0, [PCOLR0](../PCOLR0/README.md), Player/Missile 0 Color Register  
  
next: 706, $02C2, [PCOLR2](../PCOLR2/README.md), Player/Missile 2 Color Register  
