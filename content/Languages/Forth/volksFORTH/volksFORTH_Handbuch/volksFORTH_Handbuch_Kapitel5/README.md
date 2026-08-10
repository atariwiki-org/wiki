# Kapitel 5: Ein-/Ausgabe in volksFORTH

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

- c/row ; TODO Create
- c/col ; TODO Create
- c/dis ; TODO Create
- c/l ; TODO Create
- l/s ; TODO Create
- bl ; TODO Create
- \#esc ; TODO Create
- \#cr ; TODO Create
- \#lf ; TODO Create
- \#bel ; TODO Create
- \#bs ; TODO Create
- standardi/o ; TODO Create
- inputkol ; TODO Create
- outputkol ; TODO Create
- area ; TODO Create
- areakol ; TODO Create
- terminal ; TODO Create
- window ; TODO Create
- full ; TODO Create
- curat? ; TODO Create
- cur! ; TODO Create
- setpage ; TODO Create
- video@ ; TODO Create
- savevideo ; TODO Create
- restorevideo ; TODO Create
- catt ; TODO Create
- list ; TODO Create
- (page ; TODO Create
- page ; TODO Create
- (del ; TODO Create
- del ; TODO Create
- (cr ; TODO Create
- cr ; TODO Create
- ?cr ; TODO Create
- (at ; TODO Create
- (at? ; TODO Create
- at ; TODO Create
- at? ; TODO Create
- col ; TODO Create
- row ; TODO Create
- curoff ; TODO Create
- curon ; TODO Create
- curshape ; TODO Create
- printer ; TODO Create
- print ; TODO Create
- +print ; TODO Create
- lst! ; TODO Create

## Ein-/Ausgabe von Zahlen

Die Eingabe von Zahlen erfolgt im interpretativen Modus über die Tastatur, wobei grundlegende Eingabeworte mit **number** **numbers** und den verwandten Worten definiert werden. Bei der Ausgabe von Zahlen ist wieder die fehlende Typisierung von FORTH zu beachten — für ein bestimmtes Datenformat (integer, unsigned, double) ist jeweils der geeignete Operator auszuwählen.

- . ; Words/dot ; TODO Create
- u. ; Words/unsigned-dot ; TODO Create
- d. ; Words/double-dot ; TODO Create
- .r ; Words/dot-right-justified ; TODO Create
- u.r ; Words/unsigned-dot-right-justified ; TODO Create
- d.r ; Words/double-dot-right-justified ; TODO Create

## Ein-/Ausgabe über einen Port

''MS-DOS''

- pc@ ; Words/port-char-fetch ; TODO Create
- pc! ; Words/port-char-store ; TODO Create

## Eingabe von Zeichen

In FORTH wird man immer einen Speicherbereich benennen, in dem Zeichen und Zeichenketten verarbeitet werden. Hierfür verwendet man meistens einen kleinen, 80 Zeichen langen Speicherbereich namens **PAD**. Dieser Notizblock — so die deutsche Übersetzung von pad — belegt keinen festen Speicherbereich und steht sowohl dem FORTH-System als auch dem Programmierer zur Verfügung.

Dann mochte ich Ihnen mit dem Texteingabe-Puffer **TIB** einen weiteren wichtigen Speicherbereich vorstellen, der den vernünftigen Umgang mit den angeschlossenen Geräten sicherstellt. Weil die Texteingabe über die Tastatur relativ langsam vorsichgeht, werden die Zeichen hier erst in einem freien Speicherbereich, dem Pufferspeicher **TIB**, gesammelt und dann abgearbeitet.

- tib ; TODO Create
- \#tib ; TODO Create
- \>tob ; TODO Create
- \>in ; TODO Create
- pad ; TODO Create
- input ; TODO Create
- keyboard ; TODO Create
- empty-keys ; TODO Create
- (key? ; TODO Create
- key? ; TODO Create
- (key ; TODO Create
- key ; TODO Create
- (decode ; TODO Create
- (expect ; TODO Create
- expect ; TODO Create
- span ; TODO Create
- \>expect ; TODO Create
- nullstring? ; TODO Create
- stop? ; TODO Create
- source ; TODO Create
- word ; TODO Create
- parse ; TODO Create
- name ; TODO Create
- find ; TODO Create
- execute ; TODO Create
- perform ; TODO Create
- query ; TODO Create
- interpret ; TODO Create
- output ; TODO Create
- display ; TODO Create
- (emit ; TODO Create
- emit ; TODO Create
- charout ; TODO Create
- tipp ; TODO Create
- (type ; TODO Create
- type ; TODO Create
- ltype ; TODO Create
- space ; TODO Create
- spaces ; TODO Create
