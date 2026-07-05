---
title: COLPM1
---
||R/W||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW||OS  
|W|53267|$D013|COLPM1|Color of Player and Missile 1|0|[PCOLR1](../PCOLR1/README.md)|all  
|R|53267|$D013|TRIG3|Joystick Trigger 3|n/a|[STRIG3](../STRIG3/README.md)|all  
  
Missiles have the same color as corresponding Players (e.g. P0=M0, P1=M1, ...) except when joined together as 5th player by setting Bit 4 of [PRIOR](../PRIOR/README.md)/[GPRIOR](../GPRIOR/README.md). Then they have the color of register 3 [COLOR3](../COLOR3/README.md)/[COLPF3](../COLPF3/README.md).  
  
TRIG3: only on 400 and 800 machines, else a copy of [STRIG1](../STRIG1/README.md).  
0 when trigger pressed, 1 when trigger released  
  
---
see also: [Color topics](../Color_topics/README.md), [Controller topics](../Controller_topics/README.md)  
  
previous: 53266, $D012, [COLPM0](../COLPM0/README.md), Color of Player and Missile 0  
  
next: 53268, $D014, [COLPM2](../COLPM2/README.md), Color of Player and Missile 2 (W), [PAL](../PAL/README.md) (R)  
