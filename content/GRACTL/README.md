---
title: GRACTL
---
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS  
|write |53277 |$D01D|GRACTL|controls PM and Triggers|both  
  
This is a write only register.  
  
||Bit || Function  
|7 | unused  
|6 | unused  
|5 | unused  
|4 | unused  
|3 | unused  
|2 | Latch Triggers when =1  
|1 | Turn on players when =1  
|0 | Turn on missiles when =1  
  
Bit 0 and Bit 1 control players and missiles. Players and missiles are visible only when the respective bit is set to 1. [SDMCTL](../SDMCTL/README.md) needs to be set accordingly also.  
  
"Latch Triggers" means that triggers of sticks and paddles stay in "pressed state" once pressed. To reset this, set Bit 2 to 0. This is valid for all triggers and cannot be set for single triggers only.  
  
---
  
see also: [Player Missile Topics](../Pm_topics/README.md), [Controller Topics](../Controller_topics/README.md)  
  
previous: [VDELAY](../VDELAY/README.md)  
  
next: [HITCLR](../HITCLR/README.md)  
