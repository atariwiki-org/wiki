---
title: SDLSTL
---
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS||SHADOW OF  
|read/write |560,561 |$230,$231|SDLSTL, SDLSTH|Start Address of the Display List|both|[DLISTL](../DLISTL/README.md), [DLISTH](../DLISTL/README.md)  
  
Attention: the display list must not cross a 1K-boundary unless you use a JMP instruction to cross the boundary (see [Display List Instruction table](../display_list_instruction_table/README.md))  
  
---
  
see also: [Display List Topics](../Displaylist_topics/README.md), [DLISTL](../DLISTL/README.md), [DLISTH](../DLISTL/README.md)  
