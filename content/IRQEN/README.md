---
title: IRQEN
---
||r/w||ADR||HEXADR||NAME||Description||Shadow||OS  
|write|53774|$D20E|IRQEN|[POKMSK](../POKMSK/README.md)|Interrupt Request Enable|all  
|read|53774|$D20E|IRQST|[POKMSK](../POKMSK/README.md)|Interrupt Request Status|all  
  
## Write  
||Bit||Function  
|0|d  
|1|d  
|2|d  
|3|d  
|4|d  
|5|d  
|6|d  
|7|d  
  
Bit set to "0" (zero) turns interrupt off (disable)  
Bit set to "1" (one) turns interrupt on (enable)  
  
## Read  
||Bit||Value||Function||Vector  
|0|$01 1|Timer 1 (counted down to zero)|[VTIMR1](../VTIMR1/README.md) (528; $0210)  
|1|$02 2|Timer 2 (counted down to zero)|[VTIMR2](../VTIMR2/README.md) (530; $0212)  
|2|$04 4|Timer 4 (counted down to zero)|[VTIMR4](../VTIMR4/README.md) (532; $0214 - OS "B" and later ROMs only)  
|3|$08 8|Serial output transmission down|[VSEROC](../VSEROC/README.md) (526; $020E)  
|4|$10 16|Serial Output data needed|[VSEROR](../VSEROR/README.md) (524; $020C)  
|5|$20 32|Serial input data ready|[VESRIN](../VESRIN/README.md) (522; $020A)  
|6|$40 64|Other key pressed|[VKEYBD](../VKEYBD/README.md) (520; $0208)  
|7|$80 128|Break key pressed|[BRKKY](../BRKKY/README.md) (566; $0236 - OS "B" and later ROMs only)  
  
---
see also: [Keyboard topics](../Keyboard_topics/README.md)  
  
previous: [SERIN](../SEROUT/README.md),[SEROUT](../SEROUT/README.md)  
  
next: [SKCTL](../SKCTL/README.md),[SKSTAT](../SKCTL/README.md)  
