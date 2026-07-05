---
title: PCOLR3
---
||ADR||HEXADR||NAME||DESCRIPTION||SHADOW OF||OS  
|707|$02C3|PCOLR3|Color of Player and Missile 3|[COLPM3](../COLPM3/README.md) |all  
  
Missiles have the same color as corresponding Players (e.g. P0=M0, P1=M1) except when joined together as 5th player by setting Bit 4 of [PRIOR](../PRIOR/README.md)/[GPRIOR](../GPRIOR/README.md). Then they have the color of register 3 [COLOR3](../COLOR3/README.md)/[COLPF3](../COLPF3/README.md).  
  
---
see also: [Color topics](../Color_topics/README.md), [Pm_topics](../Pm_topics/README.md)  
  
previous: 706, $02C2, [PCOLR2](../PCOLR2/README.md), Player/Missile 2 Color Register  
  
next: 708, $02C4, [COLOR0](../COLOR0/README.md), Color Register 0  
