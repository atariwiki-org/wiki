# Divide

__/__ "divide" ( n1 n2 -- n3 )



||Forth79||Forth83||ANSI||Forth200x
|    X    |   X    |  X  |    X



%%tabbedSection
%%tab-english
Add one (1) to n1 | u1 giving the sum n2 | u2.
/%
%%tab-deutsch
n3 ist der Quotient aus der Division von n1 durch den Divisor n2. Eine Fehlerbedingung besteht, wenn der Divisor Null ist oder der Quotient außerhalb des Intervalls (-32768...32767) liegt
/%
/%

Forth83 and VolksForth use floored division. Forth79 uses symmetric division. In ANSI Forth and Forth 200x, the standard allows a system to provide either floored or symmetric division.

See [floored division](../../Floored_Arithmetic/README.md) 
