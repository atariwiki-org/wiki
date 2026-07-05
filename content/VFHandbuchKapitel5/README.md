---
title: VFHandbuchKapitel5
---
# Ein- / Ausgabe im volksFORTH  
  
  
## Ein- / Ausgabebefehle im volksFORTH  
  
Alle Eingabe- und Ausgabeworte (__KEY__ __EXPECT__ __EMIT__ __TYPE__ etc.) sind im volksFORTH vektorisiert, d.h. bei ihrem Aufruf wird die Codefeldadresse des zugehörigen Befehls aus einer Tabelle entnommen und ausgeführt. So ist im System wine Tabelle mit Namen DISPLAY enthalten, die für die Ausgabe auf dem Bildschirmterminal sorgt.  
  
Dieses Verfahren der Vektorisierung bietet entscheidende Vorteile:  
  
- Nit der Input-Vektorisierung kann man z.B. mit einem Schlag die Eingabe von der Tastatur auf ein Modem umschalten.  
*Durch die Output-Vektorisierung konnen mit einer neuen Tabelle alle Ausgaben auf ein anderes Gerät (z.B. einen Drucker) geleitet werden, ohne die Ausgabebefehle selbst ändern zu müssen.  
- Mit einem Wort (__DISPLAY__, __PRINT__) kann das gesamte Ausgabeverhalten geändert werden. Gibt man z.B, ein: {{{ print 1 list display }}} wird Screen 1 auf einen Drucker ausgegeben und anschließend wieder auf den Bildschirm zurückgeschaltet. Man braucht also kein neues Wort, etwa PRINTERLIST, zu definieren.  
  
Eine neue Tabelle wird mit dem Wort __OUTPUT:__ erzeugt. Die Definition konnen Sie mit {{{view output:}}} nachsehen. __OUTPUT:__ erwartet eine Liste von Ausgabeworten, die mit ; abgeschlossen werden muß.  
  
Beipsiel:  
```
Output: >PRINTER
   pemit  pcr  ptype  pdel  ppage  pat  pat? ;
```
  
Damit wird eine neue Tabelle mit dem Namen __>PRINTER__ angelegt. Beim späteren Aufruf von __>PRINTER__ wird die Adresse dieser Tabelle in die Uservariable __OUTPUT__  
geschrieben. Ab sofort führt __EMIT__ ein __PEMIT__ aus, __TYPE__ ein __PTYPE__ usw.  
  
Die Reihenfolge der Worte nach __OUTPUT:__  
userEMIT userCR userTYPE userDEL userPAGE userAT userAT?  
muß unbedingt eingehalten werden. Entsprechend wird die Input-Vektorisierung gehandhabt.  
  
## Ein- / Ausgaben über Terminal  
  
Das volksFORTH verfügt über eine Reihe von Konstanten, die der besseren Lesbarkeit dienen:  
  
- [c/row](../characters-per-row/README.md)  
- [c/col](../characters-per-column/README.md)  
- [c/dis](../characters-per-display/README.md)  
- [c/l](../characters-per-line/README.md)  
- [l/s](../lines-per-screen/README.md)  
- [bl](../bl/README.md)  
- [#esc](../number-escape/README.md)  
- [#cr](../number-carriage-return/README.md)  
- [#lf](../number-linefeed/README.md)  
- [#bel](../number-bell/README.md)  
- [#bs](../number-backspace/README.md)  
- [standardi/o](../standard-input-output/README.md)  
- [inputkol](../inputkol/README.md)  
- [outputkol](../outputkol/README.md)  
- [area](../area/README.md)  
- [areakol](../areakol/README.md)  
- [terminal](../terminal/README.md)  
- [window](../window/README.md)  
- [full](../full/README.md)  
- [curat?](../cursor-at-question/README.md)  
- [cur!](../cursor-store/README.md)  
- [setpage](../setpage/README.md)  
- [video@](../video-fetch/README.md)  
- [savevideo](../savevideo/README.md)  
- [restorevideo](../restorevideo/README.md)  
- [catt](../catt/README.md)  
- [list](../list/README.md)  
- [(page](../paren-page/README.md)  
- [page](../page/README.md)  
- [(del](../paren-delete/README.md)  
- [del](../del/README.md)  
- [(cr](../paren-carriage-return/README.md)  
- [cr](../cr/README.md)  
- [?cr](../question-carriage-return/README.md)  
- [(at](../paren-at/README.md)  
- [(at?](../paren-at-question/README.md)  
- [at](../at/README.md)  
- [at?](../at-question/README.md)  
- [col](../col/README.md)  
- [row](../row/README.md)  
- [curoff](../curoff/README.md)  
- [curon](../curon/README.md)  
- [curshape](../curshape/README.md)  
- [printer](../printer/README.md)  
- [print](../print/README.md)  
- [+print](../plus-print/README.md)  
- [lst!](../list-store/README.md)  
  
## Ein- / Ausgabe von Zahlen  
  
Die Eingabe von Zahlen erfolgt im interpretativen Modus über die Tastatur, wobei grundlegende Eingabeworte mit __number__ __numbers__ und den verwandten Worten definiert werden. Bei der Ausgabe von Zahlen ist wieder die fehlende Typisierung von FORTH zu beachten — für ein bestimmtes Datenformat (integer, unsigned, double) ist jeweils der geeignete Operator auszuwählen.  
  
- [.](../dot/README.md)  
- [u.](../unsigned-dot/README.md)  
- [d.](../double-dot/README.md)  
- [.r](../dot-right-justified/README.md)  
- [u.r](../unsigned-dot-right-justified/README.md)  
- [d.r](../double-dot-right-justified/README.md)  
  
## Ein- / Ausgabe über einen Port  
  
''MS-DOS''  
- [pc@](../port-char-fetch/README.md)  
- [pc!](../port-char-store/README.md)  
  
## Eingabe von Zeichen  
  
In FORTH wird man immer einen Speicherbereich benennen, in dem Zeichen und Zeichenketten verarbeitet werden. Hierfür verwendet man meistens einen kleinen, 80 Zeichen langen Speicherbereich namens __PAD__. Dieser Notizblock — so die deutsche Übersetzung von pad — belegt keinen festen Speicherbereich und steht sowohl dem FORTH-System als auch dem Programmierer zur Verfügung.  
  
Dann mochte ich Ihnen mit dem Texteingabe-Puffer __TIB__ einen weiteren wichtigen Speicherberelch vorstellen, der den vernünftigen Umgang mit den angeschlossenen Geräten sicherstellt. Weil die Texteingabe über die Tastatur relativ langsam vorsichgeht, werden die Zeichen hier erst in einem freien Speicherbereich, dem Pufferspeicher __TIB__, gesammelt und dann abgearbeitet.  
  
- [tib](../tib/README.md)  
- [#tib](../number-tib/README.md)  
- [>tob](../to-tib/README.md)  
- [>in](../to-in/README.md)  
- [pad](../pad/README.md)  
- [input](../input/README.md)  
- [keyboard](../keyboard/README.md)  
- [empty-keys](../empty-keys/README.md)  
- [(key?](../paren-key-question/README.md)  
- [key?](../key-question/README.md)  
- [(key](../paren-key/README.md)  
- [key](../key/README.md)  
- [(decode](../paren-decode/README.md)  
- [(expect](../paren-expect/README.md)  
- [expect](../expect/README.md)  
- [span](../span/README.md)  
- [>expect](../to-expect/README.md)  
- [nullstring?](../nullstring-question?/README.md)  
- [stop?](../stop-question/README.md)  
- [source](../source/README.md)  
- [word](../word/README.md)  
- [parse](../parse/README.md)  
- [name](../name/README.md)  
- [find](../find/README.md)  
- [execute](../execute/README.md)  
- [perform](../perform/README.md)  
- [query](../query/README.md)  
- [interpret](../interpret/README.md)  
- [output](../output/README.md)  
- [display](../display/README.md)  
- [(emit](../paren-emit/README.md)  
- [emit](../emit/README.md)  
- [charout](../charout/README.md)  
- [tipp](../tipp/README.md)  
- [(type](../paren-type/README.md)  
- [type](../type/README.md)  
- [ltype](../long-type/README.md)  
- [space](../space/README.md)  
- [spaces](../spaces/README.md)  
