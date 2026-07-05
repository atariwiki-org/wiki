---
title: PCOLR2
---
||ADR||HEXADR||NAME||DESCRIPTION||SHADOW OF||OS  
|706|$02C2|PCOLR2|Color of Player and Missile 2|[COLPM2](../COLPM2/README.md) |all  
  
Missiles have the same color as corresponding Players (e.g. P0=M0, P1=M1) except when joined together as 5th player by setting Bit 4 of [PRIOR](../PRIOR/README.md)/[GPRIOR](../GPRIOR/README.md). Then they have the color of register 3 [COLOR3](../COLOR3/README.md)/[COLPF3](../COLPF3/README.md).  
  
---
see also: [Color topics](../Color_topics/README.md), [Pm_topics](../Pm_topics/README.md)  
  
previous: 705, $02C1, [PCOLR1](../PCOLR1/README.md), Player/Missile 1 Color Register  
  
next: 707, $02C3, [PCOLR3](../PCOLR3/README.md), Player/Missile 3 Color Register  
