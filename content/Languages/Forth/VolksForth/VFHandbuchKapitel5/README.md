# Ein-/Ausgabe in volksFORTH  
  
## Ein-/Ausgabebefehle in volksFORTH  
  
Alle Eingabe- und Ausgabeworte (__KEY__ __EXPECT__ __EMIT__ __TYPE__ etc.) sind im volksFORTH vektorisiert, d.h. bei ihrem Aufruf wird die Codefeldadresse des zugehörigen Befehls aus einer Tabelle entnommen und ausgeführt. So ist im System wine Tabelle mit Namen DISPLAY enthalten, die für die Ausgabe auf dem Bildschirmterminal sorgt.  
  
Dieses Verfahren der Vektorisierung bietet entscheidende Vorteile:  
  
- Mit der Input-Vektorisierung kann man z.B. mit einem Schlag die Eingabe von der Tastatur auf ein Modem umschalten.  
*Durch die Output-Vektorisierung konnen mit einer neuen Tabelle alle Ausgaben auf ein anderes Gerät (z.B. einen Drucker) geleitet werden, ohne die Ausgabebefehle selbst ändern zu müssen.  
- Mit einem Wort (__DISPLAY__, __PRINT__) kann das gesamte Ausgabeverhalten geändert werden. Gibt man z.B, ein: ` print 1 list display ` wird Screen 1 auf einen Drucker ausgegeben und anschließend wieder auf den Bildschirm zurückgeschaltet. Man braucht also kein neues Wort, etwa "PRINTERLIST", zu definieren.  
  
Eine neue Tabelle wird mit dem Wort __OUTPUT:__ erzeugt. Die Definition können Sie mit {{{view output:}}} nachsehen. __OUTPUT:__ erwartet eine Liste von Ausgabeworten, die mit ; abgeschlossen werden muss.  
  
Beispiel:  
```
Output: >PRINTER
   pemit  pcr  ptype  pdel  ppage  pat  pat? ;
```
  
Damit wird eine neue Tabelle mit dem Namen __>PRINTER__ angelegt. Beim späteren Aufruf von __>PRINTER__ wird die Adresse dieser Tabelle in die Uservariable __OUTPUT__  
geschrieben. Ab sofort führt __EMIT__ ein __PEMIT__ aus, __TYPE__ ein __PTYPE__ usw.  
  
Die Reihenfolge der Worte nach __OUTPUT:__  
userEMIT userCR userTYPE userDEL userPAGE userAT userAT?  
muss unbedingt eingehalten werden. Entsprechend wird die Input-Vektorisierung gehandhabt.  
  
## Ein-/Ausgaben über Terminal  
  
Das volksFORTH verfügt über eine Reihe von Konstanten, die der besseren Lesbarkeit dienen:  
  
- [c/row](../Words/characters-per-row/README.md)  
- [c/col](../Words/characters-per-column/README.md)  
- [c/dis](../Words/characters-per-display/README.md)  
- [c/l](../Words/characters-per-line/README.md)  
- [l/s](../Words/lines-per-screen/README.md)  
- [bl](../Words/bl/README.md)  
- [#esc](../Words/number-escape/README.md)  
- [#cr](../Words/number-carriage-return/README.md)  
- [#lf](../Words/number-linefeed/README.md)  
- [#bel](../Words/number-bell/README.md)  
- [#bs](../Words/number-backspace/README.md)  
- [standardi/o](../Words/standard-input-output/README.md)  
- [inputkol](../Words/inputkol/README.md)  
- [outputkol](../Words/outputkol/README.md)  
- [area](../Words/area/README.md)  
- [areakol](../Words/areakol/README.md)  
- [terminal](../Words/terminal/README.md)  
- [window](../Words/window/README.md)  
- [full](../Words/full/README.md)  
- [curat?](../Words/cursor-at-question/README.md)  
- [cur!](../Words/cursor-store/README.md)  
- [setpage](../Words/setpage/README.md)  
- [video@](../Words/video-fetch/README.md)  
- [savevideo](../Words/savevideo/README.md)  
- [restorevideo](../Words/restorevideo/README.md)  
- [catt](../Words/catt/README.md)  
- [list](../Words/list/README.md)  
- [(page](../Words/paren-page/README.md)  
- [page](../Words/page/README.md)  
- [(del](../Words/paren-delete/README.md)  
- [del](../Words/del/README.md)  
- [(cr](../Words/paren-carriage-return/README.md)  
- [cr](../Words/cr/README.md)  
- [?cr](../Words/question-carriage-return/README.md)  
- [(at](../Words/paren-at/README.md)  
- [(at?](../Words/paren-at-question/README.md)  
- [at](../Words/at/README.md)  
- [at?](../Words/at-question/README.md)  
- [col](../Words/col/README.md)  
- [row](../Words/row/README.md)  
- [curoff](../Words/curoff/README.md)  
- [curon](../Words/curon/README.md)  
- [curshape](../Words/curshape/README.md)  
- [printer](../Words/printer/README.md)  
- [print](../Words/print/README.md)  
- [+print](../Words/plus-print/README.md)  
- [lst!](../Words/list-store/README.md)  
  
## Ein-/Ausgabe von Zahlen  
  
Die Eingabe von Zahlen erfolgt im interpretativen Modus über die Tastatur, wobei grundlegende Eingabeworte mit __number__ __numbers__ und den verwandten Worten definiert werden. Bei der Ausgabe von Zahlen ist wieder die fehlende Typisierung von FORTH zu beachten — für ein bestimmtes Datenformat (integer, unsigned, double) ist jeweils der geeignete Operator auszuwählen.  
  
- [.](../Words/dot/README.md)  
- [u.](../Words/unsigned-dot/README.md)  
- [d.](../Words/double-dot/README.md)  
- [.r](../Words/dot-right-justified/README.md)  
- [u.r](../Words/unsigned-dot-right-justified/README.md)  
- [d.r](../Words/double-dot-right-justified/README.md)  
  
## Ein-/Ausgabe über einen Port  
  
''MS-DOS''  
- [pc@](../Words/port-char-fetch/README.md)  
- [pc!](../Words/port-char-store/README.md)  
  
## Eingabe von Zeichen  
  
In FORTH wird man immer einen Speicherbereich benennen, in dem Zeichen und Zeichenketten verarbeitet werden. Hierfür verwendet man meistens einen kleinen, 80 Zeichen langen Speicherbereich namens __PAD__. Dieser Notizblock — so die deutsche Übersetzung von pad — belegt keinen festen Speicherbereich und steht sowohl dem FORTH-System als auch dem Programmierer zur Verfügung.  
  
Dann mochte ich Ihnen mit dem Texteingabe-Puffer __TIB__ einen weiteren wichtigen Speicherbereich vorstellen, der den vernünftigen Umgang mit den angeschlossenen Geräten sicherstellt. Weil die Texteingabe über die Tastatur relativ langsam vorsichgeht, werden die Zeichen hier erst in einem freien Speicherbereich, dem Pufferspeicher __TIB__, gesammelt und dann abgearbeitet.  
  
- [tib](../Words/tib/README.md)  
- [#tib](../Words/number-tib/README.md)  
- [>tob](../Words/to-tib/README.md)  
- [>in](../Words/to-in/README.md)  
- [pad](../Words/pad/README.md)  
- [input](../Words/input/README.md)  
- [keyboard](../Words/keyboard/README.md)  
- [empty-keys](../Words/empty-keys/README.md)  
- [(key?](../Words/paren-key-question/README.md)  
- [key?](../Words/key-question/README.md)  
- [(key](../Words/paren-key/README.md)  
- [key](../Words/key/README.md)  
- [(decode](../Words/paren-decode/README.md)  
- [(expect](../Words/paren-expect/README.md)  
- [expect](../Words/expect/README.md)  
- [span](../Words/span/README.md)  
- [>expect](../Words/to-expect/README.md)  
- [nullstring?](../Words/nullstring-question/README.md)  
- [stop?](../Words/stop-question/README.md)  
- [source](../Words/source/README.md)  
- [word](../Words/word/README.md)  
- [parse](../Words/parse/README.md)  
- [name](../Words/name/README.md)  
- [find](../Words/find/README.md)  
- [execute](../Words/execute/README.md)  
- [perform](../Words/perform/README.md)  
- [query](../Words/query/README.md)  
- [interpret](../Words/interpret/README.md)  
- [output](../Words/output/README.md)  
- [display](../Words/display/README.md)  
- [(emit](../Words/paren-emit/README.md)  
- [emit](../Words/emit/README.md)  
- [charout](../Words/charout/README.md)  
- [tipp](../Words/tipp/README.md)  
- [(type](../Words/paren-type/README.md)  
- [type](../Words/type/README.md)  
- [ltype](../Words/long-type/README.md)  
- [space](../Words/space/README.md)  
- [spaces](../Words/spaces/README.md)  
