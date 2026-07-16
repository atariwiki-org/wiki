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

- [c/row](../../Language/Words/characters-per-row/README.md)
- [c/col](../../Language/Words/characters-per-column/README.md)
- [c/dis](../../Language/Words/characters-per-display/README.md)
- [c/l](../../Language/Words/characters-per-line/README.md)
- [l/s](../../Language/Words/lines-per-screen/README.md)
- [bl](../../Language/Words/bl/README.md)
- [#esc](../../Language/Words/number-escape/README.md)
- [#cr](../../Language/Words/number-carriage-return/README.md)
- [#lf](../../Language/Words/number-linefeed/README.md)
- [#bel](../../Language/Words/number-bell/README.md)
- [#bs](../../Language/Words/number-backspace/README.md)
- [standardi/o](../../Language/Words/standard-input-output/README.md)
- [inputkol](../../Language/Words/inputkol/README.md)
- [outputkol](../../Language/Words/outputkol/README.md)
- [area](../../Language/Words/area/README.md)
- [areakol](../../Language/Words/areakol/README.md)
- [terminal](../../Language/Words/terminal/README.md)
- [window](../../Language/Words/window/README.md)
- [full](../../Language/Words/full/README.md)
- [curat?](../../Language/Words/cursor-at-question/README.md)
- [cur!](../../Language/Words/cursor-store/README.md)
- [setpage](../../Language/Words/setpage/README.md)
- [video@](../../Language/Words/video-fetch/README.md)
- [savevideo](../../Language/Words/savevideo/README.md)
- [restorevideo](../../Language/Words/restorevideo/README.md)
- [catt](../../Language/Words/catt/README.md)
- [list](../../Language/Words/list/README.md)
- [(page](../../Language/Words/paren-page/README.md)
- [page](../../Language/Words/page/README.md)
- [(del](../../Language/Words/paren-delete/README.md)
- [del](../../Language/Words/del/README.md)
- [(cr](../../Language/Words/paren-carriage-return/README.md)
- [cr](../../Language/Words/cr/README.md)
- [?cr](../../Language/Words/question-carriage-return/README.md)
- [(at](../../Language/Words/paren-at/README.md)
- [(at?](../../Language/Words/paren-at-question/README.md)
- [at](../../Language/Words/at/README.md)
- [at?](../../Language/Words/at-question/README.md)
- [col](../../Language/Words/col/README.md)
- [row](../../Language/Words/row/README.md)
- [curoff](../../Language/Words/curoff/README.md)
- [curon](../../Language/Words/curon/README.md)
- [curshape](../../Language/Words/curshape/README.md)
- [printer](../../Language/Words/printer/README.md)
- [print](../../Language/Words/print/README.md)
- [+print](../../Language/Words/plus-print/README.md)
- [lst!](../../Language/Words/list-store/README.md)

## Ein-/Ausgabe von Zahlen

Die Eingabe von Zahlen erfolgt im interpretativen Modus über die Tastatur, wobei grundlegende Eingabeworte mit __number__ __numbers__ und den verwandten Worten definiert werden. Bei der Ausgabe von Zahlen ist wieder die fehlende Typisierung von FORTH zu beachten — für ein bestimmtes Datenformat (integer, unsigned, double) ist jeweils der geeignete Operator auszuwählen.

- [.](../../Language/Words/dot/README.md)
- [u.](../../Language/Words/unsigned-dot/README.md)
- [d.](../../Language/Words/double-dot/README.md)
- [.r](../../Language/Words/dot-right-justified/README.md)
- [u.r](../../Language/Words/unsigned-dot-right-justified/README.md)
- [d.r](../../Language/Words/double-dot-right-justified/README.md)

## Ein-/Ausgabe über einen Port

''MS-DOS''
- [pc@](../../Language/Words/port-char-fetch/README.md)
- [pc!](../../Language/Words/port-char-store/README.md)

## Eingabe von Zeichen

In FORTH wird man immer einen Speicherbereich benennen, in dem Zeichen und Zeichenketten verarbeitet werden. Hierfür verwendet man meistens einen kleinen, 80 Zeichen langen Speicherbereich namens __PAD__. Dieser Notizblock — so die deutsche Übersetzung von pad — belegt keinen festen Speicherbereich und steht sowohl dem FORTH-System als auch dem Programmierer zur Verfügung.

Dann mochte ich Ihnen mit dem Texteingabe-Puffer __TIB__ einen weiteren wichtigen Speicherbereich vorstellen, der den vernünftigen Umgang mit den angeschlossenen Geräten sicherstellt. Weil die Texteingabe über die Tastatur relativ langsam vorsichgeht, werden die Zeichen hier erst in einem freien Speicherbereich, dem Pufferspeicher __TIB__, gesammelt und dann abgearbeitet.

- [tib](../../Language/Words/tib/README.md)
- [#tib](../../Language/Words/number-tib/README.md)
- [>tob](../../Language/Words/to-tib/README.md)
- [>in](../../Language/Words/to-in/README.md)
- [pad](../../Language/Words/pad/README.md)
- [input](../../Language/Words/input/README.md)
- [keyboard](../../Language/Words/keyboard/README.md)
- [empty-keys](../../Language/Words/empty-keys/README.md)
- [(key?](../../Language/Words/paren-key-question/README.md)
- [key?](../../Language/Words/key-question/README.md)
- [(key](../../Language/Words/paren-key/README.md)
- [key](../../Language/Words/key/README.md)
- [(decode](../../Language/Words/paren-decode/README.md)
- [(expect](../../Language/Words/paren-expect/README.md)
- [expect](../../Language/Words/expect/README.md)
- [span](../../Language/Words/span/README.md)
- [>expect](../../Language/Words/to-expect/README.md)
- [nullstring?](../../Language/Words/null-string-question/README.md)
- [stop?](../../Language/Words/stop-question/README.md)
- [source](../../Language/Words/source/README.md)
- [word](../../Language/Words/word/README.md)
- [parse](../../Language/Words/parse/README.md)
- [name](../../Language/Words/name/README.md)
- [find](../../Language/Words/find/README.md)
- [execute](../../Language/Words/execute/README.md)
- [perform](../../Language/Words/perform/README.md)
- [query](../../Language/Words/query/README.md)
- [interpret](../../Language/Words/interpret/README.md)
- [output](../../Language/Words/output/README.md)
- [display](../../Language/Words/display/README.md)
- [(emit](../../Language/Words/paren-emit/README.md)
- [emit](../../Language/Words/emit/README.md)
- [charout](../../Language/Words/charout/README.md)
- [tipp](../../Language/Words/tipp/README.md)
- [(type](../../Language/Words/paren-type/README.md)
- [type](../../Language/Words/type/README.md)
- [ltype](../../Language/Words/long-type/README.md)
- [space](../../Language/Words/space/README.md)
- [spaces](../../Language/Words/spaces/README.md)
