# Combine 2 files into 1

To create one 16 KiB ROM out of two 8 KiB ROMs, use the following method:

__Windows:__
Go to the CMD shell and then go to the directory where the 2 files are, which should be combined, then type:

copy /b file1.rom+file2.rom allinone16k.rom

and the resulting ROM file can be found in the same directory. Done. :-) ; thanks to JAC! from AtariAge

__Mac:__
Start the application Terminal, then type cd and press Enter. Drag the folder in which the 2 files are directly behind the blank. Check with typing ls -a, whether the 2 files can be seen. Then type:

cat file1.rom file2.rom > allinone16k.rom

The resulting ROM file can be found in the same directory. Done. :-)
