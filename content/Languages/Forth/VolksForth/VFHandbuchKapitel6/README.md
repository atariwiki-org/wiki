# Zeichenketten (Strings) in volksFORTH  
  
Hier befinden sich grundlegende Routinen zur Stringverarbeitung. Vor allem wurden auch Worte aufgenommen, die den Umgang mit den von manchen Betriebssystemen geforderten 0-terminated Strings ermöglichen. FORTH hat hier gegenüber C den Nachteil, daß FORTH-Strings standardmäßig mit einem Count-Byte beginnen, das die Länge des Strings enthält. Ein abschließendes Zeichen (z.B. ein Null-Byte) ist daher unnötig. Wenn das Betriebssystem aber in C geschrieben wurde (Atari TOS, MS-DOS), müssen Strings entsprechend umgewandelt werden.  
  
Standardmäßig arbeitet FORTH mit counted Strings, die lediglich durch eine Adresse gekennzeichnet werden. Das Byte an dieser Adresse enthält die Angabe, wie lang die Zeichenkette ist. Auf dieses "count byte" folgt dann die Zeichenkette selbst. Dadurch ist die Läunge eines Standard-Strings in FORTH auf 255 Zeichen begrenzt. Die kürzeste Zeichenkette ist ein String der Länge NULL, für dessen Überprüfung der Befehl __NULLSTRING?__ zur Verfügung steht.  
  
![](attachments/forth-string.png)  
  
So sieht der String FORTH an der Adresse addr im Speicher unter FORTH aus.  
  
- [."](../Words/dot-string/README.md)  
- ["](../Words/string/README.md)  
- [,"](../Words/compile-string/README.md)  
- [nullstring?](../Words/nullstring-question/README.md)  
- ["lit](../Words/quote-literal/README.md)  
- [.(](../Words/dot-comment/README.md)  
- [(](../Words/comment/README.md)  
- [)](../Words/end-comment/README.md) - dies ist kein Forth Wort, sondern ein Stoppzeichen  
  
## String-Manipulationen  
  
Hier im Glossar bezeichnet der Stackkommentar ( string -- ) die Adresse eines counted Strings, dagegen ( addr len -- ) die Charakterisierung durch die Anfangsadresse der Zeichenkette und ihre Länge.  
  
Keine Stringvariable? - Benutze:  
```
: String:  Create dup , 0 c, allot DOES> 1+ count ;
```
  
- [caps](../Words/caps/README.md)  
- [capital](../Words/capital/README.md)  
- [upper](../Words/upper/README.md)  
- [capitalitze](../Words/capitalitze/README.md)  
- [/string](../Words/cut-string/README.md)  
- [-trailing](../Words/minus-trailing/README.md)  
- [scan](../Words/scan/README.md)  
- [skip](../Words/skip/README.md)  
- [?"](../Words/question-quote/README.md)  
- [bounds](../Words/bounds/README.md)  
- [type](../Words/type/README.md)  
- [>type](../Words/to-type/README.md)  
- [place](../Words/place/README.md)  
- [attach](../Words/attach/README.md)  
- [append](../Words/append/README.md)  
- [detract](../Words/detract/README.md)  
- [match](../Words/match/README.md)  
- [search](../Words/search/README.md)  
  
## Im Dictionary  
  
- [(find](../Words/paren-find/README.md)  
- [find](../Words/find/README.md)  
  
## 0-terminated Strings  
  
Es gibt noch eine weitere Darstellungsform für Strings, die beispielsweise für MS-DOS geeignet ist. Diese Strings werden zwar ebenfalls durch eine Adresse gekennzeichnet; diese Adresse enthält aber kein count byte. Stattdessen werden diese Zeichenketten mit einem Nullbyte abgeschlossen.  
  
![](attachments/zero-term-string.png)  
  
- [asciz](../Words/asciz/README.md)  
- [>asciz](../Words/to-asciz/README.md)  
- [counted](../Words/counted/README.md)  
  
## Konvertierungen: Strings -- Zahlen  
  
### String in Zahlen wandeln  
  
- [digit?](../Words/digit-question/README.md)  
- [accumulate](../Words/accumulate/README.md)  
- [convert](../Words/convert/README.md)  
- [number?](../Words/number-question/README.md)  
- [number](../Words/number/README.md)  
- [dpl](../Words/dpl/README.md)  
  
Ein Beispiel der Umwandlung von Zeichen in Zahlen:  
  
In FORTH wird die Eingabe von Zahlen oft mit der allgemeinen Texteingabe und über die Befehle zur Umwandlung von Strings in Zahlen realisiert. In der Literatur wird dazu oft diese Lösung mit __QUERY__ angeboten:  
  
```
: in#  ( string -- d tf  n tf  addr ff )
   query bl word  number? ;
```
  
Diese Lösung ist ungünstig, da __QUERY__ den __TIB__ löscht. Zugleich stellt die Definition von __NUMBER?__ eine unglückliche Stelle im volksFORTH dar. Es gibt im Laxen & Perry-F83 ein Wort mit demselben Namen, das ganz anders (besser!) mit den Parametern umgeht. Hier folgt die Definition des F83-NUMBER?, das auf dem volksFORTH __NUMBER?__ aufbaut:  
  
```
: F83-NUMBER?  ( string -- d f )
  number?  ?dup IF 0< IF extend THEN true exit THEN
  drop 0 0 false ;
```
  
Damit stellt das Wort __INPUT#__ eine wenig aufwendige Zahleneingabemöglichkeit für 16/32Bit-Zahlen dar:  
  
```
\ input#
: input#  ( string -- d f )
  pad c/l  1- >expect     \ get 63 char maximal
  pad F83-number? ;       \ convert string->number
```
  
So kann der Anwender das übergebene Flag auswerten und die doppelt genaue Zahl entsprechend seinen Vorstellungen einsetzen, im einfachsten Fall mit DROP zu einer einfachgenauen Zahl machen.  
  
### Zahlen in Strings wandeln  
  
- [#](../Words/number/README.md)  
- [#s](../Words/number-s/README.md)  
- [hold](../Words/hold/README.md)  
- [sign](../Words/sign/README.md)  
- [#>](../Words/number-greater/README.md)  
