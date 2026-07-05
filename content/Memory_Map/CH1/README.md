---
title: CH1
---
||Adr||Hex||Name||Description||OS  
|754|$02F2|CH1|prior key pressed|all  
  
Prior keyboard character code (most recently read and accepted). This is the previous value passed from [CH](../CH/README.md) (764/$2FC). If the value of the new key code equals the value in CH1, then the code is accepted only if a suitable key debounce delay has taken place since the prior value was accepted.  
  
see also: [Keyboard topics](../Keyboard_topics/README.md), [CH](../CH/README.md)  
