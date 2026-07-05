---
title: SETVBV
---
||ADR||HEXADR||NAME||Description||OS  
|58460|$E45C|SETVBV|Set system timers and interrupt vectors|both  
  
Sets an interrupt vector or system timer vector.  
  
## Usage:  
  
Assembler  
```
LDX MSB
LDY LSB
LDA (value see table below)
JSR $E45C
```
Action!  
```
PROC SETVBV=*$E45C(BYTE VECTOR,MSB,LSB)
RETURN
```
  
  
||Register||Value  
|X|MSB  
|Y|LSB  
|A|vector to be changed, see below  
  
||Value||Vector  
|0|[VIMIRQ](../VIMIRQ/README.md)  
|1|[TIMCOUNT1](../TIMCOUNT1/README.md)  
|2|[TIMCOUNT2](../TIMCOUNT2/README.md)  
|3|[TIMCOUNT3](../TIMCOUNT3/README.md)  
|4|[TIMCOUNT4](../TIMCOUNT4/README.md)  
|5|[TIMCOUNT5](../TIMCOUNT5/README.md)  
|6|[VVBLKI](../VVBLKI/README.md)  
|7|[VVBLKD](../VVBLKD/README.md)  
  
  
---
see also: [VBI_Vertical_Blank_Interrupt](../VBI_Vertical_Blank_Interrupt/README.md)  
