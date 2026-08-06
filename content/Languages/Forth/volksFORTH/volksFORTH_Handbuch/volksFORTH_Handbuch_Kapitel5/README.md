# Kapitel 4: Ein-/Ausgabe in volksFORTH

## Ein-/Ausgabebefehle in volksFORTH

Alle Eingabe- und Ausgabeworte (**KEY** **EXPECT** **EMIT** **TYPE** etc.) sind im volksFORTH vektorisiert, d.h. bei ihrem Aufruf wird die Codefeldadresse des zugehörigen Befehls aus einer Tabelle entnommen und ausgeführt. So ist im System wine Tabelle mit Namen DISPLAY enthalten, die für die Ausgabe auf dem Bildschirmterminal sorgt.

Dieses Verfahren der Vektorisierung bietet entscheidende Vorteile:

- Mit der Input-Vektorisierung kann man z.B. mit einem Schlag die Eingabe von der Tastatur auf ein Modem umschalten.
  \*Durch die Output-Vektorisierung konnen mit einer neuen Tabelle alle Ausgaben auf ein anderes Gerät (z.B. einen Drucker) geleitet werden, ohne die Ausgabebefehle selbst ändern zu müssen.
- Mit einem Wort (**DISPLAY**, **PRINT**) kann das gesamte Ausgabeverhalten geändert werden. Gibt man z.B, ein: `print 1 list display` wird Screen 1 auf einen Drucker ausgegeben und anschließend wieder auf den Bildschirm zurückgeschaltet. Man braucht also kein neues Wort, etwa "PRINTERLIST", zu definieren.

Eine neue Tabelle wird mit dem Wort **OUTPUT:** erzeugt. Die Definition können Sie mit {{{view output:}}} nachsehen. **OUTPUT:** erwartet eine Liste von Ausgabeworten, die mit ; abgeschlossen werden muss.

Beispiel:

```
Output: >PRINTER
   pemit  pcr  ptype  pdel  ppage  pat  pat? ;
```

Damit wird eine neue Tabelle mit dem Namen **\>PRINTER** angelegt. Beim späteren Aufruf von **\>PRINTER** wird die Adresse dieser Tabelle in die Uservariable **OUTPUT**
geschrieben. Ab sofort führt **EMIT** ein **PEMIT** aus, **TYPE** ein **PTYPE** usw.

Die Reihenfolge der Worte nach **OUTPUT:**
userEMIT userCR userTYPE userDEL userPAGE userAT userAT?
muss unbedingt eingehalten werden. Entsprechend wird die Input-Vektorisierung gehandhabt.

## Ein-/Ausgaben über Terminal

Das volksFORTH verfügt über eine Reihe von Konstanten, die der besseren Lesbarkeit dienen:

- [c/row](../../volksFORTH_Language/Words/characters-per-row/README.md)
- [c/col](../../volksFORTH_Language/Words/characters-per-column/README.md)
- [c/dis](../../volksFORTH_Language/Words/characters-per-display/README.md)
- [c/l](../../volksFORTH_Language/Words/characters-per-line/README.md)
- [l/s](../../volksFORTH_Language/Words/lines-per-screen/README.md)
- [bl](../../volksFORTH_Language/Words/bl/README.md)
- [#esc](../../volksFORTH_Language/Words/number-escape/README.md)
- [#cr](../../volksFORTH_Language/Words/number-carriage-return/README.md)
- [#lf](../../volksFORTH_Language/Words/number-linefeed/README.md)
- [#bel](../../volksFORTH_Language/Words/number-bell/README.md)
- [#bs](../../volksFORTH_Language/Words/number-backspace/README.md)
- [standardi/o](../../volksFORTH_Language/Words/standard-input-output/README.md)
- [inputkol](../../volksFORTH_Language/Words/inputkol/README.md)
- [outputkol](../../volksFORTH_Language/Words/outputkol/README.md)
- [area](../../volksFORTH_Language/Words/area/README.md)
- [areakol](../../volksFORTH_Language/Words/areakol/README.md)
- [terminal](../../volksFORTH_Language/Words/terminal/README.md)
- [window](../../volksFORTH_Language/Words/window/README.md)
- [full](../../volksFORTH_Language/Words/full/README.md)
- [curat?](../../volksFORTH_Language/Words/cursor-at-question/README.md)
- [cur!](../../volksFORTH_Language/Words/cursor-store/README.md)
- [setpage](../../volksFORTH_Language/Words/setpage/README.md)
- [video@](../../volksFORTH_Language/Words/video-fetch/README.md)
- [savevideo](../../volksFORTH_Language/Words/savevideo/README.md)
- [restorevideo](../../volksFORTH_Language/Words/restorevideo/README.md)
- [catt](../../volksFORTH_Language/Words/catt/README.md)
- [list](../../volksFORTH_Language/Words/list/README.md)
- [(page](../../volksFORTH_Language/Words/paren-page/README.md)
- [page](../../volksFORTH_Language/Words/page/README.md)
- [(del](../../volksFORTH_Language/Words/paren-delete/README.md)
- [del](../../volksFORTH_Language/Words/del/README.md)
- [(cr](../../volksFORTH_Language/Words/paren-carriage-return/README.md)
- [cr](../../volksFORTH_Language/Words/cr/README.md)
- [?cr](../../volksFORTH_Language/Words/question-carriage-return/README.md)
- [(at](../../volksFORTH_Language/Words/paren-at/README.md)
- [(at?](../../volksFORTH_Language/Words/paren-at-question/README.md)
- [at](../../volksFORTH_Language/Words/at/README.md)
- [at?](../../volksFORTH_Language/Words/at-question/README.md)
- [col](../../volksFORTH_Language/Words/col/README.md)
- [row](../../volksFORTH_Language/Words/row/README.md)
- [curoff](../../volksFORTH_Language/Words/curoff/README.md)
- [curon](../../volksFORTH_Language/Words/curon/README.md)
- [curshape](../../volksFORTH_Language/Words/curshape/README.md)
- [printer](../../volksFORTH_Language/Words/printer/README.md)
- [print](../../volksFORTH_Language/Words/print/README.md)
- [+print](../../volksFORTH_Language/Words/plus-print/README.md)
- [lst!](../../volksFORTH_Language/Words/list-store/README.md)

## Ein-/Ausgabe von Zahlen

Die Eingabe von Zahlen erfolgt im interpretativen Modus über die Tastatur, wobei grundlegende Eingabeworte mit **number** **numbers** und den verwandten Worten definiert werden. Bei der Ausgabe von Zahlen ist wieder die fehlende Typisierung von FORTH zu beachten — für ein bestimmtes Datenformat (integer, unsigned, double) ist jeweils der geeignete Operator auszuwählen.

- [.](../../volksFORTH_Language/Words/dot/README.md)
- [u.](../../volksFORTH_Language/Words/unsigned-dot/README.md)
- [d.](../../volksFORTH_Language/Words/double-dot/README.md)
- [.r](../../volksFORTH_Language/Words/dot-right-justified/README.md)
- [u.r](../../volksFORTH_Language/Words/unsigned-dot-right-justified/README.md)
- [d.r](../../volksFORTH_Language/Words/double-dot-right-justified/README.md)

## Ein-/Ausgabe über einen Port

''MS-DOS''

- [pc@](../../volksFORTH_Language/Words/port-char-fetch/README.md)
- [pc!](../../volksFORTH_Language/Words/port-char-store/README.md)

## Eingabe von Zeichen

In FORTH wird man immer einen Speicherbereich benennen, in dem Zeichen und Zeichenketten verarbeitet werden. Hierfür verwendet man meistens einen kleinen, 80 Zeichen langen Speicherbereich namens **PAD**. Dieser Notizblock — so die deutsche Übersetzung von pad — belegt keinen festen Speicherbereich und steht sowohl dem FORTH-System als auch dem Programmierer zur Verfügung.

Dann mochte ich Ihnen mit dem Texteingabe-Puffer **TIB** einen weiteren wichtigen Speicherbereich vorstellen, der den vernünftigen Umgang mit den angeschlossenen Geräten sicherstellt. Weil die Texteingabe über die Tastatur relativ langsam vorsichgeht, werden die Zeichen hier erst in einem freien Speicherbereich, dem Pufferspeicher **TIB**, gesammelt und dann abgearbeitet.

- [tib](../../volksFORTH_Language/Words/tib/README.md)
- [#tib](../../volksFORTH_Language/Words/number-tib/README.md)
- [\>tob](../../volksFORTH_Language/Words/to-tib/README.md)
- [\>in](../../volksFORTH_Language/Words/to-in/README.md)
- [pad](../../volksFORTH_Language/Words/pad/README.md)
- [input](../../volksFORTH_Language/Words/input/README.md)
- [keyboard](../../volksFORTH_Language/Words/keyboard/README.md)
- [empty-keys](../../volksFORTH_Language/Words/empty-keys/README.md)
- [(key?](../../volksFORTH_Language/Words/paren-key-question/README.md)
- [key?](../../volksFORTH_Language/Words/key-question/README.md)
- [(key](../../volksFORTH_Language/Words/paren-key/README.md)
- [key](../../volksFORTH_Language/Words/key/README.md)
- [(decode](../../volksFORTH_Language/Words/paren-decode/README.md)
- [(expect](../../volksFORTH_Language/Words/paren-expect/README.md)
- [expect](../../volksFORTH_Language/Words/expect/README.md)
- [span](../../volksFORTH_Language/Words/span/README.md)
- [\>expect](../../volksFORTH_Language/Words/to-expect/README.md)
- [nullstring?](../../volksFORTH_Language/Words/null-string-question/README.md)
- [stop?](../../volksFORTH_Language/Words/stop-question/README.md)
- [source](../../volksFORTH_Language/Words/source/README.md)
- [word](../../volksFORTH_Language/Words/word/README.md)
- [parse](../../volksFORTH_Language/Words/parse/README.md)
- [name](../../volksFORTH_Language/Words/name/README.md)
- [find](../../volksFORTH_Language/Words/find/README.md)
- [execute](../../volksFORTH_Language/Words/execute/README.md)
- [perform](../../volksFORTH_Language/Words/perform/README.md)
- [query](../../volksFORTH_Language/Words/query/README.md)
- [interpret](../../volksFORTH_Language/Words/interpret/README.md)
- [output](../../volksFORTH_Language/Words/output/README.md)
- [display](../../volksFORTH_Language/Words/display/README.md)
- [(emit](../../volksFORTH_Language/Words/paren-emit/README.md)
- [emit](../../volksFORTH_Language/Words/emit/README.md)
- [charout](../../volksFORTH_Language/Words/charout/README.md)
- [tipp](../../volksFORTH_Language/Words/tipp/README.md)
- [(type](../../volksFORTH_Language/Words/paren-type/README.md)
- [type](../../volksFORTH_Language/Words/Type/README.md)
- [ltype](../../volksFORTH_Language/Words/long-type/README.md)
- [space](../../volksFORTH_Language/Words/space/README.md)
- [spaces](../../volksFORTH_Language/Words/spaces/README.md)
