---
title: AUDCTL
---
||Read/Write||ADR||HEXADR||NAME||Description||OS  
|Read|53768|$D208|ALLPOT|Audio control|all  
|Write|53768|$D208|AUDCTL|Pot Port State|all  
  
# AUDCTL (Write)  
AUDCTL is the option byte which affects all sound channels. This bit assignment is:  
||Bit||Description  
|7|	0=17 bit poly counter 1=9 bit polynomial noise  
|6|	0=clock channel 1 with 64kHz1=Clock channel one with 1.79 MHz (NTSC) or 1.77MHz (PAL)  
|5|	0=clock channel 3 with 64kHz1=Clock channel three with 1.79 MHz (NTSC) or 1.77MHz (PAL)  
|4|	0=clock channel 2 with 64kHz1=Join channels two and one (16 bit, with 2/4=MSB, 1/2=LSB)  
|3|	0=clock channel 4 with 64kHz1=Join channels four and three (16 bit, with 2/4=MSB, 1/2=LSB)  
|2|	1=Insert high pass filter into channel one, clocked by channel two  
|1|	1=Insert high pass filter into channel three, clocked by channel four  
|0|	0=main clock base 64 KHz1=16 KHz main clock base  
  
# ALLPOT (Read)  
Shows if the readings of the pots are (already) valid.  
||Bit||Paddle||Shadow||Register  
|0|Paddle 0| [PADDL0](../PADDL0/README.md)| [POT0](../POT0/README.md)  
|1|Paddle 1| [PADDL1](../PADDL1/README.md)| [POT1](../POT1/README.md)  
|2|Paddle 2| [PADDL2](../PADDL2/README.md)| [POT2](../POT2/README.md)  
|3|Paddle 3| [PADDL3](../PADDL3/README.md)| [POT3](../POT3/README.md)  
|4|Paddle 4| [PADDL4](../PADDL4/README.md)| [POT4](../POT4/README.md)  
|5|Paddle 5| [PADDL5](../PADDL5/README.md)| [POT5](../POT5/README.md)  
|6|Paddle 6| [PADDL6](../PADDL6/README.md)| [POT6](../POT6/README.md)  
|7|Paddle 7| [PADDL7](../PADDL7/README.md)| [POT7](../POT7/README.md)  
If a bit equals zero (0), then the register value for that pot (e.g. Bit 0 = [POT0](../POT0/README.md)) is valid; if the Bit is one (1), then the value is not (yet) valid, because the reading/scan is not finished yet or there is no paddle connected.  
  
---
see also: [Controller topics](../Controller_topics/README.md), [POTGO](../POTGO/README.md), [ALLPOT](../ALLPOT/README.md), [SKCTL](../SKCTL/README.md)  
  
previous: [AUDC4](../AUDC4/README.md),[POT7](../POT7/README.md)  
  
next: [STIMER](../KBCODE/README.md),[KBCODE](../KBCODE/README.md)  
