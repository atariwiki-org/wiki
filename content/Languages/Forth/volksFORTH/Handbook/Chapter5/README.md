# Chapter 5: Input / Output in volksFORTH  
 
## Input/output commands in volksFORTH  
  
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
  
- [C / row ](../../Language/Words/characters-per-row/README.md)  
- [C / col ](../../Language/Words/characters-per-column/README.md)  
- [C / dis ](../../Language/Words/characters-per-display/README.md)  
- [C / l ](../../Language/Words/characters-per-line/README.md)  
- [L / s ](../../Language/Words/lines-per-screen/README.md)  
- [Bl](../../Language/Words/Bl/README.md)  
- [# Esc ](../../Language/Words/number-escape/README.md)  
- [# Cr ](../../Language/Words/number-carriage-return/README.md)  
- [# Lf ](../../Language/Words/number-linefeed/README.md)  
- [# Bel ](../../Language/Words/number-bell/README.md)  
- [# Bs ](../../Language/Words/number-backspace/README.md)  
- [Standardized / o ](../../Language/Words/standard-input-output/README.md)  
- [Inputkol](../../Language/Words/Inputkol/README.md)  
- [Outputkol](../../Language/Words/Outputkol/README.md)  
- [Area](../../Language/Words/Area/README.md)  
- [Areakol](../../Language/Words/Areakol/README.md)  
- [] Terminal  
- [Window](../../Language/Words/Window/README.md)  
- [Full](../../Language/Words/Full/README.md)  
- [Curat? ](../../Language/Words/Cursor-at-question/README.md)  
- [Cur! ](../../Language/Words/Cursor-store/README.md)  
- [Setpage](../../Language/Words/Setpage/README.md)  
- [@ Video ](../../Language/Words/video-fetch/README.md)  
- [Savevideo](../../Language/Words/Savevideo/README.md)  
- [Restorevideo](../../Language/Words/Restorevideo/README.md)  
- [Catt](../../Language/Words/Catt/README.md)  
- [List](../../Language/Words/List/README.md)  
- [(Page ](../../Language/Words/paren-page/README.md)  
- [Page](../../Language/Words/Page/README.md)  
- [(Del ](../../Language/Words/paren-delete/README.md)  
- [Del](../../Language/Words/Del/README.md)  
- [(Cr ](../../Language/Words/paren-carriage-return/README.md)  
- [Cr](../../Language/Words/Cr/README.md)  
- [? Cr ](../../Language/Words/question-carriage-return/README.md)  
- [(At ](../../Language/Words/paren-at/README.md)  
- [(At? ](../../Language/Words/Paren-at-question/README.md)  
- [At](../../Language/Words/At/README.md)  
- [At? ](../../Language/Words/At-question/README.md)  
- [Col](../../Language/Words/Col/README.md)  
- [Row](../../Language/Words/Row/README.md)  
- [] Curoff  
- [Curon](../../Language/Words/Curon/README.md)  
- [Curshape](../../Language/Words/Curshape/README.md)  
- [Printer](../../Language/Words/Printer/README.md)  
- [Print](../../Language/Words/Print/README.md)  
- [+print](../../Language/Words/plus-print/README.md)
- [Ls! ](../../Language/Words/List-store/README.md)  
  
### Input / output of numbers  
  
The input of numbers is made in the interpretive mode via the keyboard, and basic input words are defined with __number__ __numbers__ and related words. For the issue of numbers again is the lack of typing of FORTH observed - for a specific data format (integer, unsigned, double) is appropriate in each case the operator to select.  
  
- [. ](../../Language/Words/Dot/README.md)  
- [U. ](../../Language/Words/unsigned-dot/README.md)  
- [D ](../../Language/Words/double-dot/README.md)  
- [. R ](../../Language/Words/dot-right-justified/README.md)  
- [U.r ](../../Language/Words/unsigned-dot-right-justified/README.md)  
- [D.r ](../../Language/Words/double-dot-right-justified/README.md)  
  
### Input / output via a port  
  
MS-DOS''''  
- [Pc @ ](../../Language/Words/port-char-fetch/README.md)  
- [PC! ](../../Language/Words/Port-char-store/README.md)  
  
### Enter characters  
  
In FORTH you will always designate a storage area, incorporated into the characters and strings. To do this you usually use a small, 80-character memory area called __PAD__. This note pad - so the German translation of pad used - no fixed memory area and is both the FORTH system and the programmers.  
  
Then I liked you with the text input buffer __TIB__ another important Speicherberelch imagine that ensures the reasonable use of the connected devices. Because the text input via the keyboard vorsichgeht relatively slow, the characters are collected here only in a free space, the buffer __TIB__, and then processed.  
  
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
