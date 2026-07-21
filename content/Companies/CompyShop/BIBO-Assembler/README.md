# CompyShop BIBO Assembler (2)


Copyright (C) 1986 E. Reuss & Compy-Shop

## Disks

- [biboass.atr](attachments/biboass.atr)
- [biboasm1.atr](attachments/biboasm1.atr)
- [biboasm2.atr](attachments/biboasm2.atr)
- [biboasm3.atr](attachments/biboasm3.atr)
- [biboass_build003.atr](attachments/biboass_build003.atr)

## Source

- [bibo_src.zip](attachments/bibo_src.zip)

## Handbook
- [BiboAssembler Handbuch (german)](attachments/biboass.pdf)
- [BiboAssembler Handbuch (german, HTML)](http://www.hintermueller.de/biboassembler)


The BiboAssembler is a fast and compact Assembler for the Atari 8-Bit. The Assembler is available as File- and as Module-Version (Cartridge). The File-Version includes also a small Machine-Language Monitor.

This Assembler was written by Erwin Reuß and Peter Bee of CompyShop in 1986. Many CompyShop Products (Speedy 1050, BiboMon, CompyShop Grafic Demos etc) are written with this tool.

The ATARI Bit Byter User Club is holding all copyright to this fine tool. There is a plan on re-sourcing the Assembler (task in progress by Martin Metz) and publishing the Assembler Source under the GNU Public License as Open Source Software.

We have also the plan to publish an english translated version of the Bibo Assembler Handbook. But this will take time. For now we have a short description of the available commands.

## Short Description

### Loding and starting

BiboAssembler can be load as a binary file from any DOS System. Make sure that BASIC is off and all Cartridges are removed. BiboAssembler works well with Ramdisk Drivers and Harddisk.

### The Editor

The BiboAssembler Editor is a line Editor with Line-Number, similar to Atari Basic. It can be used like the Atari Basic Editor. Inverse Characters cannot be used except when eclosed in double-quotes. The ASCII Character with Value Zero (the heart in the ATASCI Font) cannot be used. If you need to specify this Char you have to write
```
! Auto Numbering

BiboAssembler supports automatic Line Numbering. Pressing the TAB-Key in the beginning of a new line will insert the next line number. The steps for line numbering can be changed with the command

{{{INC steps, first linenumber}}}

Example:
{{{INC 10, 1000}}}

The command "NUM" will switch on automatic line numbering.

{{{NUM steps, first linenumber}}}

Example:
{{{NUM 10, 1000}}}

Automatic Line Numbering can be switch off with the BREAK-Key.

! deleting Lines

Lines in the Editor can be deleted with the command "DEL"

Syntax: {{{DEL first line, last line}}}

Example: {{{DEL 1000,1100}}}

will delete lines 1000 to 1100 (without asking).

! erasing the Editor Buffers

The command "NEW" will reset the full editor and will rease all sourcecode in the Editor Buffers.

! Line Format


||	 A	 ||		||	B	||		|| C  ||		||  D	||		||	E		  ||
|  00010  |&nbsp;|LABEL  |&nbsp;| LDA|&nbsp;|$4567 |&nbsp;|Comment	  |


* A Line Number- 0 to 64000.
* B Label - 1 to 128 Characters First Char must be a Letter (exceptions are local label). The Label must follow direct or with one blank after the line number
* C Opcode - three chars, either normal 65(C)02 Opcode or Pseudo-Opcode. Must be sepertaed from Linenumber by two blanks or one blank from Label.
* D Parameter - Address, Value or Filename. Must be direct or with one blank after the Opcode
* E Comment - Must be two blanks away from Opcode or one blank from Parameter

A line can be 128 Chars max. Comments can start anywhere with "*" or ";". One hyphen "-" will be expanded to a delimiter line.

Example

{{{1000 -}}}

will get 
{{{
1000 ---------------------------
```

### List

The Command List will list the source code

Syntax: {{{LIS first line, last line}}}

Example: {{{LIS 1000,2000}}}

Abbrev: L.

Listing can be stopped with CNTRL+1 and can be stopped with the BREAK-Key. Also valid:

```
{{{LIS START}}} will list from Label "START" down.

! Searching and Replacing

The Command "FIN" will search Strings in the Source Code.

Syntax: {{{FIN string}}}

Example: {{{FIN LDA}}} will list all occurrences of LDA in the sourcecode.

The Command "REP" can be used to replace STrings in the code.

Syntax: {{{REP "string1"string2"}}}

Example: {{{REP "LDA"LDX"}}} will replace all occurances of "LDA" with "LDX" in the Sourcecode.

! Copy and Moving Sourcelines

(TBD)

-----

Martin Metz | 25.01.2009 at 01:04 PM 
biboass_build002.atr freshly build from source and installed on XDOS 2.42N. Runs without issues on XDOS 2.42N Has the new pseudo opcode .HS included (SynAss compatible). Build 002 fixes a bug in the "." command of the monitor that is present in build 001 only.
```

## Manual
- [BIBO Assembler manual](attachments/BIBO_Assembler.pdf) ; size: 296 KB ; BIBO-ASSEMBLER HANDBUCH

## Accessories
- [Print Char Routine with ATARI OS](../../../Print_Char_Routine_with_ATARI_OS/README.md)
- [Print inline assembled text](../../../Print_inline_assembled_text/README.md)
- [Print Decimal, Hex and Binary routines](../../../Print_Decimal_Hex_and_Binary/README.md) (INTOUT.INC)
- [Read Decimal, Hex and Binary values](../../../Read_Decimal_Hex_and_Binary/README.md) (GETNUM.INC)
- [Print to Screen without OS](../../../Print_to_Screen_without_OS/README.md)
- [Fast text output on Graphics 0 Screen without OS](../../../Languages/Assembler/Examples/Fast_text_output_on_Graphics_0_Screen_without_OS/README.md)
- [Memopad Demo](../../../Memopad_Demo/README.md)
- [Floating Point Routines](../../../OS/Floating_Point_ROM/Floating_point_Routines/README.md)
- [Integer Math for 6502](../../../Languages/Assembler/Examples/Integer_Math/README.md)
- [Plot and Draw Routines](../../../Plot_and_Draw_Routines/README.md)
- [Block-Fill and Block-Move](../../../Block-Fill_and_Block-Move/README.md)
- [Load Koala Pictures](../../../Languages/Assembler/Examples/Load_Koala_Pictures/README.md)
- [How to read a Key from Keyboard with ATARI ROM Routines](../../../How_to_read_a_Key_from_Keyboard_with_ATARI_ROM_Routines/README.md)
- [16bit increment and decrement](../../../Languages/Assembler/Examples/16bit_increment_and_decrement/README.md)
- [Atari CIO Routines](../../../Atari_CIO_Routines/README.md)
- [List Directory Example](../../../Languages/Assembler/Examples/List_Directory_Example/README.md)
- [Disable BREAK Key (for BASIC USR call)](../../../Disable_BREAK_key/README.md)
- [Simple XOR encoding (for BASIC USR Call)](../../../Simple_XOR_encoding/README.md)
- [Bitwise AND, OR, XOR and NOT for BASIC (USR Call)](../../../Bitwise_AND_OR_XOR_and_NOT/README.md)
- [High Density Interface](../../../HDISource/README.md) - High Density Interface (PC FLoppy Interface with Speedy like OS)
- [SIO2USB Clock Utility](../../../SIO2USB_Clock_Utility/README.md)
- [Simple Disk Formatter](../../../Simple_Disk_Formatter/README.md)
- [SIO Sector Read for Atari BASIC](../../../SIO_Sector_Read_for_Atari_Basic/README.md)
- [Atari ST Mouse Driver for ACTION!](../../../Languages/Action/Examples/Atari_ST_Mouse_Driver_for_ACTION/README.md)
- [ST Mouse Driver for BASIC](../../../Languages/BASIC/Atari_BASIC/Examples/ST_Mouse_Driver_for_Basic/README.md)
- [Sweet 16 for Bibo Assembler](../../../Sweet_16/Sweet16Bibo/README.md) Sweet 16 - a virtual 16bit machine for the 8bit ATARI
- [Simple Blitter Routine](../../../Languages/BASIC/Turbo-BASIC_XL/Examples/Simple_Blitter/README.md)

