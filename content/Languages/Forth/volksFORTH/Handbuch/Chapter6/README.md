# Zeichenketten (Strings) in volksFORTH  
  
Hier befinden sich grundlegende Routinen zur Stringverarbeitung. Vor allem wurden auch Worte aufgenommen, die den Umgang mit den von manchen Betriebssystemen geforderten 0-terminated Strings ermöglichen. FORTH hat hier gegenüber C den Nachteil, daß FORTH-Strings standardmäßig mit einem Count-Byte beginnen, das die Länge des Strings enthält. Ein abschließendes Zeichen (z.B. ein Null-Byte) ist daher unnötig. Wenn das Betriebssystem aber in C geschrieben wurde (Atari TOS, MS-DOS), müssen Strings entsprechend umgewandelt werden.  
  
Standardmäßig arbeitet FORTH mit counted Strings, die lediglich durch eine Adresse gekennzeichnet werden. Das Byte an dieser Adresse enthält die Angabe, wie lang die Zeichenkette ist. Auf dieses "count byte" folgt dann die Zeichenkette selbst. Dadurch ist die Läunge eines Standard-Strings in FORTH auf 255 Zeichen begrenzt. Die kürzeste Zeichenkette ist ein String der Länge NULL, für dessen Überprüfung der Befehl __NULLSTRING?__ zur Verfügung steht.  
  
![](attachments/forth-string.png)  
  
So sieht der String FORTH an der Adresse addr im Speicher unter FORTH aus.  
  
- [."](../../Language/Words/dot-string/README.md)  
- ["](../../Language/Words/string/README.md)  
- [,"](../../Language/Words/compile-string/README.md)  
- [nullstring?](../../Language/Words/null-string-question/README.md)  
- ["lit](../../Language/Words/quote-literal/README.md)  
- [.(](../../Language/Words/dot-comment/README.md)  
- [(](../../Language/Words/comment/README.md)  
- [)](../../Language/Words/end-comment/README.md) - dies ist kein Forth Wort, sondern ein Stoppzeichen  
  
## String-Manipulationen  
  
Hier im Glossar bezeichnet der Stackkommentar ( string -- ) die Adresse eines counted Strings, dagegen ( addr len -- ) die Charakterisierung durch die Anfangsadresse der Zeichenkette und ihre Länge.  
  
Keine Stringvariable? - Benutze:  
```
: String:  Create dup , 0 c, allot DOES> 1+ count ;
```
  
- [caps](../../Language/Words/caps/README.md)  
- [capital](../../Language/Words/capital/README.md)  
- [upper](../../Language/Words/upper/README.md)  
- [capitalitze](../../Language/Words/capitalitze/README.md)  
- [/string](../../Language/Words/cut-string/README.md)  
- [-trailing](../../Language/Words/minus-trailing/README.md)  
- [scan](../../Language/Words/scan/README.md)  
- [skip](../../Language/Words/skip/README.md)  
- [?"](../../Language/Words/question-quote/README.md)  
- [bounds](../../Language/Words/bounds/README.md)  
- [type](../../Language/Words/type/README.md)  
- [>type](../../Language/Words/to-type/README.md)  
- [place](../../Language/Words/place/README.md)  
- [attach](../../Language/Words/attach/README.md)  
- [append](../../Language/Words/append/README.md)  
- [detract](../../Language/Words/detract/README.md)  
- [match](../../Language/Words/match/README.md)  
- [search](../../Language/Words/search/README.md)  
  
## Im Dictionary  
  
- [(find](../../Language/Words/paren-find/README.md)  
- [find](../../Language/Words/find/README.md)  
  
## 0-terminated Strings  
  
Es gibt noch eine weitere Darstellungsform für Strings, die beispielsweise für MS-DOS geeignet ist. Diese Strings werden zwar ebenfalls durch eine Adresse gekennzeichnet; diese Adresse enthält aber kein count byte. Stattdessen werden diese Zeichenketten mit einem Nullbyte abgeschlossen.  
  
![](attachments/zero-term-string.png)  
  
- [asciz](../../Language/Words/asciz/README.md)  
- [>asciz](../../Language/Words/to-asciz/README.md)  
- [counted](../../Language/Words/counted/README.md)  
  
## Konvertierungen: Strings -- Zahlen  
  
### String in Zahlen wandeln  
  
- [digit?](../../Language/Words/digit-question/README.md)  
- [accumulate](../../Language/Words/accumulate/README.md)  
- [convert](../../Language/Words/convert/README.md)  
- [number?](../../Language/Words/number-question/README.md)  
- [number](../../Language/Words/number/README.md)  
- [dpl](../../Language/Words/dpl/README.md)  
  
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
  
- [#](../../Language/Words/number/README.md)  
- [#s](../../Language/Words/number-s/README.md)  
- [hold](../../Language/Words/hold/README.md)  
- [sign](../../Language/Words/sign/README.md)  
- [#>](../../Language/Words/number-greater/README.md)  
