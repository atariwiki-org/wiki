# Happy-Computer DOS II+/D

|Autor          |Stefan Dorndorf|
|---------------|---------------|
|Current Version| V4.5M         |

Happy-Computer DOS, short Happy-DOS is a DOS 2.0S compatible disk operating system in a single file (37 disk blocks), with a built-in RAM disk.

Published in issue 3/1986 of German magazine Happy Computer as "Listing of the Month".

Copyright (C) 1986 by [Markt \& Technik Verlag AG](http://www.mut.de/).

## ATR-Image

- [HAPPYDOS.atr](attachments/HAPPYDOS.atr), thanks to [Thomas Meyer](https://www.tmeyer.de/atari/happydos/index.html)

````
This documentation should be accompanied by the file HAPPYDOS.ATR
with the files DOS.SYS and HAPPYDOS.BAS (original BASIC loader
from the magazine) on it.

Info from the article accompanying the listing:
  The author bought OS/A+-DOS and disassembled and documented it.
He found out that some parts were programmed quite circumstantial.
When he knew OS/A+-DOS in and out he also removed some bugs in it,
but after a while it became tedious to patch the DOS. In 1983 he
began writing his own DOS. In June 1984 the basic functionality
was there, but it took another year to tune the details. The "/D"
stands for the double density support.

NOTE: Happy-DOS is not related to the Happy drive enhancer and
does not contain any functions supporting it.


DOS COMMAND SUMMARY

/n
    Select drive "n"
    NOTE: You probably need to POKE 1802 with the number of
          drives (see below).
DIR [filespec]
    Display directory
    Ex. DIR or DIR *.BAS
REN oldname,newname
    Rename file(s)
    Ex. REN TEST.BAS,PROGRAM.BAS or
        REN *.BAS,*.BAK
DEL filename
    Delete file
    Ex. DEL TEST.BAS
LOC filename
    Lock file
    Ex. LOC TEST.BAS
UNL filename
    Unlock file
    Ex. UNL TEST.BAS
LOA filename
    Load program into memory
    Ex. LOA HELP.COM
SAV filename,sadr,eadr
    Save memory to file
    Ex. SAV SCREEN.DAT,9C00,9FFF
RUN adr
    Run program in memory
    Ex. RUN E474
    If LOA has been used before, just entering RUN starts the
    program at that address.
COP [device]filename[,device[filename]]
    Copy file(s)
    Ex. COP HELP.COM or
        COP HELP.COM,S      Copy to screen
        COP HELP.COM,D2
        COP PRG,D2:PRG2/A   Copy with append
CAR [basiccmd]
    Run cartridge
    Ex. CAR RUN"M  - run BASIC program from RAM disk
FO# [/diskname]
    Format drive with single density
FD# [/diskname]
    Format drive with double density
CL# [/diskname]
    Clear disk directory
    Ex. CL/GAMES
    Use of "@" as the diskname will NOT create a directory and a
    completely empty disk.
IN#
    Writes DOS.SYS to the disk
    Also works from DOS with
      OPEN #1,8,0,"D:DOS.SYS":CLOSE #1
JOB command
    Writes a Happy-DOS command to disk that is automatically executed
    on boot.
    Ex. JOB AUTORUN.SYS             - will run AUTORUN.SYS
        JOB CAR RUN "D;STARTUP.BAS  - will run STARTUP.BAS in BASIC
        JOB/                        - removes previously set job
>hadr
    Display memory dump
    Ex. >0600
    Just entering ">" displays the next 8 bytes.
>hadr hbyte hbyte hbyte...
    Edit memory
    Ex. >0600 FF 00 FF 00
    Use ">" to display and cursor keys to edit the line.
>R
    Display 6502 registers

Instead of ":" one can also use ";".
    Ex. LOAD"D;PROGRAM
Add
 /V   for verify
 /A   for append
 /n   for n-th matching file
"-" can be used as "*.*" or "*.*/"

Examples:
 LOAD "D;PRO-"      -> LOAD "D:PRO*.*"
 LIST "D2;PROG/VA"
 LOAD "D;*BAS/2"    -> Loads 2nd BASIC program on disk
 LOAD "D;-3"        -> Loads 3rd program from disk


XIO COMMANDS

Load sectors from disk
  POSITION s,n:XIO 31,#1,lo,hi,"D;x"
   * s is number of first sector
   * n is the number of sectors to be read
   * lo,hi are address of buffer
   * x is the operation (R=read, W=write, S=status)

  Example
    POSITION 361,4:XIO 31,#1,ASCI(CHR$(40000)),INT(40000/256),"D2;R"

Clear disk directory
  XIO 34,#1,0,0,"D;/diskname"

Format disk with double density
  XIO 255,#1,0,0,"D;/diskname"

Load binary program and run
  XIO 39,#1,f,0,"D;filename"
    Program will be run if f<>0

Save memory to disk
  POSITION a,255:POINT #1,l,x
    "255" is used to differentiate from normal POSITION command.
   * a is address of the buffer
   * l is the length
   * x is the operation (4=load, 8=write)
    The cursor position will be set to 0,0 automatically.
    In the case of error 136 (end of file) this retrieves number of
    read bytes:
      POSITION 0,0:NOTE #1,1,x

Append Note:
  Happy-DOS uses a different format than DOS 2.0 when using append and
  does not need to read in the complete file when closing. Due to this,
  Happy-DOS cannot append data to a DOS 2.0 file. If you need to, use
  COP to copy the DOS 2.0 file to a Happy-DOS diskette.

AUTORUN.SYS Note:
  Happy-DOS loads AUTORUN.SYS files, but DOSINI may not be changed. If
  the program is to be restarted after a Reset, set Bit #2 in BOOT? and
  the vector to the program in CASINI.
  Autostart can be bypassed by pressing ESC right after power on.

Use Shift-Break to immediately interrupt a disk operation.

Settings for Happy-DOS:
  Addr.   Name    Default   Description
   1801   SECCOD     2      Number of sector buffers
   1802   DRVCOD     1      Number of drive buffers
   1803   TIMCOD     2      Timeout (in seconds)
   1804   BUFCOD            Addr. of buffers
   1806   DOSCOD     0      Flag for DOS.SYS
   1807   STSCOD     4      DOS.SYS start sector
   1809   TRYCOD     3      Number of retries
   1810   ADRCOD   $880     DOS.SYS start address
   1812   VBLCOD     1      Flag for fast key repeat

Adr. 1812 is useful for owners of Atari 400 and 800.

Adr. 1802 MUST be set to the number of drives.


RAM DISK

The RAM disk is drive M: and can hold one unnamed file.

Memory table
   $2000 - $4F00   Basic program
   $5000 - $7F00   RAM disk
   $8000 - $A000   Graphics memory in GR.8

If the BASIC program reaches into the RAM disk memory, it will result
in error 147.


Different error messages from DOS 2.0:
 ERROR 163 (Write protected)
   Cannot write on protected disk.
 ERROR 166 (Invalid POINT)
   Value in POINT is wrong or file is open for write.
 ERROR 171 (Bad Load File)
   A file addressed with XIO 39 is not in COM format.
 ERROR 172 (Not a Happy-DOS file)
   Error when appending data to a program file in DOS 2.0 format.
   Error when using JOB on a non-Happy-DOS disk.
````
