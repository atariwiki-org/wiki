---
title: POTGO
---
||Read/Write||ADR||HEXADR||NAME||Description||OS  
|Write|53771|$D20B|POTGO|Start Pot reading sequence|all  
  
Start the POT scan sequence. You must read your POT values first and then start the scan sequence, since POTGO resets the POT registers to zero. Written by the stage two VBLANK sequence.  
  
---
see also: [Controller topics](../Controller_topics/README.md), [POT0](../POT0/README.md)-[POT7](../POT7/README.md), [ALLPOT](../ALLPOT/README.md), [PADDL0](../PADDL0/README.md)-[PADDL7](../PADDL7/README.md)  
  
previous: [RANDOM](../SKREST/README.md),[SKREST](../SKREST/README.md)  
  
next: [SEROUT](../SEROUT/README.md),[SERIN](../SEROUT/README.md)  
