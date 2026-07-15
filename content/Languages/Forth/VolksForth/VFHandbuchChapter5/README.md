# Chapter 5: Input / Output in volksFORTH  
  
  
## Input / output commands in volksFORTH  
  
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
  
- [C / row ](../Word/characters-per-row/README.md)  
- [C / col ](../Word/characters-per-column/README.md)  
- [C / dis ](../Word/characters-per-display/README.md)  
- [C / l ](../Word/characters-per-line/README.md)  
- [L / s ](../Word/lines-per-screen/README.md)  
- [Bl](../Words/Bl/README.md)  
- [# Esc ](../Word/number-escape/README.md)  
- [# Cr ](../Word/number-carriage-return/README.md)  
- [# Lf ](../Word/number-linefeed/README.md)  
- [# Bel ](../Word/number-bell/README.md)  
- [# Bs ](../Word/number-backspace/README.md)  
- [Standardized / o ](../Word/standard_input-output/README.md)  
- [Inputkol](../Words/Inputkol/README.md)  
- [Outputkol](../Words/Outputkol/README.md)  
- [Area](../Words/Area/README.md)  
- [Areakol](../Words/Areakol/README.md)  
- [] Terminal  
- [Window](../Words/Window/README.md)  
- [Full](../Words/Full/README.md)  
- [Curat? ](../Word/Cursor-at-question/README.md)  
- [Cur! ](../Word/Cursor-store/README.md)  
- [Setpage](../Words/Setpage/README.md)  
- [@ Video ](../Word/video-fetch/README.md)  
- [Savevideo](../Words/Savevideo/README.md)  
- [Restorevideo](../Words/Restorevideo/README.md)  
- [Catt](../Words/Catt/README.md)  
- [List](../Words/List/README.md)  
- [(Page ](../Word/paren-page/README.md)  
- [Page](../Words/Page/README.md)  
- [(Del ](../Word/paren-delete/README.md)  
- [Del](../Words/Del/README.md)  
- [(Cr ](../Word/paren-carriage-return/README.md)  
- [Cr](../Words/Cr/README.md)  
- [? Cr ](../Word/question-carriage-return/README.md)  
- [(At ](../Word/paren-us/README.md)  
- [(At? ](../Word/Paren-at-question/README.md)  
- [At](../Words/At/README.md)  
- [At? ](../Word/At-question/README.md)  
- [Col](../Words/Col/README.md)  
- [Row](../Words/Row/README.md)  
- [] Curoff  
- [Curon](../Words/Curon/README.md)  
- [Curshape](../Words/Curshape/README.md)  
- [Printer](../Words/Printer/README.md)  
- [Print](../Words/Print/README.md)  
- [+ ](../Word/Print_plus-print/README.md)  
- [Ls! ](../Word/List-store/README.md)  
  
### Input / output of numbers  
  
The input of numbers is made in the interpretive mode via the keyboard, and basic input words are defined with __number__ __numbers__ and related words. For the issue of numbers again is the lack of typing of FORTH observed - for a specific data format (integer, unsigned, double) is appropriate in each case the operator to select.  
  
- [. ](../Word/Dot/README.md)  
- [U. ](../Word/unsigned-dot/README.md)  
- [D ](../Word/double-dot/README.md)  
- [. R ](../Word/dot-right-justified/README.md)  
- [U.r ](../Word/unsigned-dot-right-justified/README.md)  
- [D.r ](../Word/double-dot-right-justified/README.md)  
  
### Input / output via a port  
  
MS-DOS''''  
- [Pc @ ](../Word/port-char-fetch/README.md)  
- [PC! ](../Word/Port-char-store/README.md)  
  
### Enter characters  
  
In FORTH you will always designate a storage area, incorporated into the characters and strings. To do this you usually use a small, 80-character memory area called __PAD__. This note pad - so the German translation of pad used - no fixed memory area and is both the FORTH system and the programmers.  
  
Then I liked you with the text input buffer __TIB__ another important Speicherberelch imagine that ensures the reasonable use of the connected devices. Because the text input via the keyboard vorsichgeht relatively slow, the characters are collected here only in a free space, the buffer __TIB__, and then processed.  
  
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
- [nullstring?](../Words/nullstring-question?/README.md)  
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
