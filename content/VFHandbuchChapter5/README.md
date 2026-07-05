---
title: VFHandbuchChapter5
---
# Input / Output in Volks-FORTH  
  
  
## Input / output commands in VolksFORTH  
  
All input and output words (__KEY__ __EXPECT__ __EMIT__ __TYPE__ etc.) are vectorized in the people-FORTH, ie when called, the code field address of the associated command is taken from a table and executed. It is included in the system table wine named DISPLAY, which provides for the output to the screen terminal.  
  
This method of vectorization offers significant benefits:  
  
- Nit-vectorization of the input can e.g. switch with one stroke of the keyboard on the input of a modem.  
- The output can vectorization with a new table, the total expenditure to another device (eg a printer) will be conducted without having to change the output commands themselves.  
- In a word (__DISPLAY__, __PRINT__) can all be changed spending habits. Is there such a (((print a list display))) will be issued a screen on a printer, and then falls back to the screen. So you need a new word, such PRINTERLIST to define.  
  
A new table is created with the word __OUTPUT: __. The definition can output with (((view:)) look). __OUTPUT: __ Expected to issue a list of words, with must, be completed.  
  
Beipsiel:  
```
Output:> PRINTER
   pemit pcr ptype pdel PPAG pat pat? ;
```
  
For a new table named __> PRINTER__ is created. With a later call to PRINTER__ __> is the address of this table in the Uservariable __OUTPUT__  
written. From now leads __EMIT__ from a __PEMIT__, a __PTYPE__ __TYPE__ etc.  
  
The order of words after __OUTPUT: __  
userEMIT userCR userType userdel Userpage userAT userAT?  
must necessarily be met. Accordingly, the input-vectorization is handled.  
  
### Input / output terminal on  
  
The state-FORTH has a number of constants which serve to improve readability:  
  
- [C / row ](../_characters-per-row/README.md)  
- [C / col ](../_characters-per-column/README.md)  
- [C / dis ](../_characters-per-display/README.md)  
- [C / l ](../_characters-per-line/README.md)  
- [L / s ](../_lines-per-screen/README.md)  
- [Bl](../Bl/README.md)  
- [# Esc ](../_number-escape/README.md)  
- [# Cr ](../_number-carriage-return/README.md)  
- [# Lf ](../_number-linefeed/README.md)  
- [# Bel ](../_number-bell/README.md)  
- [# Bs ](../_number-backspace/README.md)  
- [Standardized / o ](../_standard_input-output/README.md)  
- [Inputkol](../Inputkol/README.md)  
- [Outputkol](../Outputkol/README.md)  
- [Area](../Area/README.md)  
- [Areakol](../Areakol/README.md)  
- [] Terminal  
- [Window](../Window/README.md)  
- [Full](../Full/README.md)  
- [Curat? ](../_Cursor-at-question/README.md)  
- [Cur! ](../_Cursor-store/README.md)  
- [Setpage](../Setpage/README.md)  
- [@ Video ](../_video-fetch/README.md)  
- [Savevideo](../Savevideo/README.md)  
- [Restorevideo](../Restorevideo/README.md)  
- [Catt](../Catt/README.md)  
- [List](../List/README.md)  
- [(Page ](../_paren-page/README.md)  
- [Page](../Page/README.md)  
- [(Del ](../_paren-delete/README.md)  
- [Del](../Del/README.md)  
- [(Cr ](../_paren-carriage-return/README.md)  
- [Cr](../Cr/README.md)  
- [? Cr ](../_question-carriage-return/README.md)  
- [(At ](../_paren-us/README.md)  
- [(At? ](../_Paren-at-question/README.md)  
- [At](../At/README.md)  
- [At? ](../_At-question/README.md)  
- [Col](../Col/README.md)  
- [Row](../Row/README.md)  
- [] Curoff  
- [Curon](../Curon/README.md)  
- [Curshape](../Curshape/README.md)  
- [Printer](../Printer/README.md)  
- [Print](../Print/README.md)  
- [+ ](../_Print_plus-print/README.md)  
- [Ls! ](../_List-store/README.md)  
  
### Input / output of numbers  
  
The input of numbers is made in the interpretive mode via the keyboard, and basic input words are defined with __number__ __numbers__ and related words. For the issue of numbers again is the lack of typing of FORTH observed - for a specific data format (integer, unsigned, double) is appropriate in each case the operator to select.  
  
- [. ](../_Dot/README.md)  
- [U. ](../_unsigned-dot/README.md)  
- [D ](../_double-dot/README.md)  
- [. R ](../_dot-right-justified/README.md)  
- [U.r ](../_unsigned-dot-right-justified/README.md)  
- [D.r ](../_double-dot-right-justified/README.md)  
  
### Input / output via a port  
  
MS-DOS''''  
- [Pc @ ](../_port-char-fetch/README.md)  
- [PC! ](../_Port-char-store/README.md)  
  
### Enter characters  
  
In FORTH you will always designate a storage area, incorporated into the characters and strings. To do this you usually use a small, 80-character memory area called __PAD__. This note pad - so the German translation of pad used - no fixed memory area and is both the FORTH system and the programmers.  
  
Then I liked you with the text input buffer __TIB__ another important Speicherberelch imagine that ensures the reasonable use of the connected devices. Because the text input via the keyboard vorsichgeht relatively slow, the characters are collected here only in a free space, the buffer __TIB__, and then processed.  
  
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
