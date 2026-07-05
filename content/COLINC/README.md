---
title: COLINC
---
||ADR||HEXADR||NAME||Description||shadow||OS  
|122|$007A|COLINC| |none|A  
The column increment or decrement value (plus or minus one). [ROWINC](../ROWINC/README.md) and [COLINC](../COLINC/README.md) control the direction of the line drawing routine. The values represent the signs derived from the value in [NEWROW](../NEWROW/README.md) (location 96/$60) minus the value in [ROWCRS](../ROWCRS/README.md) (location 84/$54) and the value in [NEWCOL](../NEWCOL/README.md) (locations 97,98/$61,$62) minus the value in [COLCRS](../COLCRS/README.md) (locations 85,86/$55,$56).  
