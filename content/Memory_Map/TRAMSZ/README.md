---
title: TRAMSZ
---
||ADR||HEXADR||NAME||Description||OS  
|6|$0006|TRAMSZ|Temporary Register for RAM size|both  
  
  
Temporary Register for RAM size; used during powerup sequence to test RAM availability. This value is then moved to [RAMTOP](../RAMTOP/README.md), location 106 ($6A). Reads one when the BASIC or the A (left) cartridge is plugged in.  
  
see also: [RAMTOP](../RAMTOP/README.md), [MEMTOP](../MEMTOP/README.md)  
