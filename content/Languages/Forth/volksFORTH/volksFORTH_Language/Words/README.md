# VolksFORTH Words

# **ABS** "abs" ( n -- u )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       | X       | X    | X

%%tabbedSection
%%tab-english
u is the absolute value of n.
/%
%%tab-deutsch
u ist der Betrag von n. Wenn n gleich -32768 ist, hat u denselben Wert wie n. Vergleiche auch Zweierkomlement.
/%
/%

# Divide

**/** "divide" ( n1 n2 -- n3 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       | X       | X    | X

%%tabbedSection
%%tab-english
Add one (1) to n1 \| u1 giving the sum n2 \| u2.
/%
%%tab-deutsch
n3 ist der Quotient aus der Division von n1 durch den Divisor n2. Eine Fehlerbedingung besteht, wenn der Divisor Null ist oder der Quotient außerhalb des Intervalls (-32768...32767) liegt
/%
/%

Forth83 and VolksForth use floored division. Forth79 uses symmetric division. In ANSI Forth and Forth 200x, the standard allows a system to provide either floored or symmetric division.

See [Floored Arithmetic](../Floored_Arithmetic/README.md)

# **/mod** "divide-mod" ( n1 n2 -- n3 n4 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       | X       | X    | X

%%tabbedSection
%%tab-english
Divide n1 by n2, giving the single-cell remainder n3 and the single-cell quotient n4. An ambiguous condition exists if n2 is zero.
/%
%%tab-deutsch
n3 ist der Rest und n4 der Quotient aus der Division von n1 durch den Divisor n2. n3 hat dasselbe Vorzeichen wie n2 oder ist Null. Eine Fehlerbedinguag besteht, wenn der Divisor Null ist oder der Quotient ausserhalb des Intervalls (-32768 .. 32767 ) liegt.
/%
/%

# **EVEN** "even" ( u1 -- u2 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
|         | X       | X    | X

%%tabbedSection
%%tab-english
u2 is the next larger even number to u1.

"even" is a noop-command without function in the 8086-VolksFORTH.
/%
%%tab-deutsch
u2 ist die nächstgrößere gerade Zahl zu u1

"even" ist im 8086-VolksFORTH ein noop-Befehl ohne Funktion.
/%
/%

# **false**  ( -- 0 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       | X       | X    | X

%%tabbedSection
%%tab-english
returns 0 as a flag for logic "false" on the stack
/%
%%tab-deutsch
hinterläßt Null als Zeichen für logisch-falsch auf dem Stack.
/%
/%

# **MAX** "maximum" ( n1 n2 -- n3 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| x       | X       | X    | X

%%tabbedSection
%%tab-english
n3 is the greater of n1 and n2. The largest possible number for n1 or n2 is 32767.
/%
%%tab-deutsch
n3 ist die Größere der beiden Werte nl und n2. Benutzt die Operation \>
Die größte Zahl für n1 oder n2 ist 32767.
/%
/%

# **MIN** "minimum" ( n1 n2 -- n3 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| x       | X       | X    | X

%%tabbedSection
%%tab-english
n3 is the lesser of n1 and n2. The smallest possible number for n1 or n2 is -32768.
/%
%%tab-deutsch
n3 ist die Kleinere der beiden Werte nl und n2. Benutzt die Operation \<
Die kleinste Zahl für n1 oder n2 ist -32768.
/%
/%

# **-** "minus" ( n1 n2 -- n3 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       | X       | X    | X

%%tabbedSection
%%tab-english
Subtract n2 from n1, giving the difference n3.
/%
%%tab-deutsch
n2 von n1 subtrahiert ergibt n3.
/%
/%

# **MOD** "modulo" ( n1 n2 -- n3 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       | X       | X    | X

%%tabbedSection
%%tab-english
Divide n1 by n2, giving the single-cell remainder n3. An ambiguous condition exists if n2 is zero.
/%
%%tab-deutsch
n3 ist der Rest der Division von n1 durch den Divisor n2. n3 hat daßelbe Vorzeichen wie n2 oder ist Null. Eine Fehlerbedingung besteht, wenn der Divisor Null ist oder der Quotient außerhalb des Intervalls (­-32768..32767) liegt.
/%
/%

# **NEGATE** "negate" ( n1 -- n2 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       | X       | X    | X

%%tabbedSection
%%tab-english
Negate n1, giving its arithmetic inverse n2.
/%
%%tab-deutsch
n2 hat den gleichen Betrag, aber das umgekehrte Vorzeichen von n1. n2 ist gleich der Differenz von Null minus n1.
/%

# **NOT** "not" ( n1 -- n2 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       |         |      | 

%%tabbedSection
%%tab-english
Reverse the boolean value of n1 by inverting every bit of n1.
/%
%%tab-deutsch
Jedes Bit von n1 wird einzeln invertiert und das ergibt n2.
/%
/%

# **1-** "one-minus" ( n1 \| u1 -- n2 \| u2 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       | X       | X    | X

%%tabbedSection
%%tab-english
Subtract one (1) from n1 \| u1 giving the difference n2 \| u2.
/%
%%tab-deutsch
das Ergebnis von u1\|n1 minus Eins. Die Operation 1 — wirkt genauso.
/%
/%

# **1+** “one-plus” ( n1 \| u1 -- n2 \| u2 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       | X       | X    | X

%%tabbedSection
%%tab-english
Add one (1) to n1 \| u1 giving the sum n2 \| u2.
/%
%%tab-deutsch
das Ergebnis (n2\|u2) von Eins plus n1\|u1. Die Operation 1 + wirkt genauso
/%
/%

# **+** "plus" ( n1 n2 -- n3 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       | X       | X    | X

%%tabbedSection
%%tab-english
Add n2 to n1, giving the sum n3.
/%
%%tab-deutsch
n1 und n2 addiert ergibt n2
/%
/%

# Words

# **3+** "three-plus" ( n1 \| u1 -- n2 \| u2 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
|         |         |      | 

%%tabbedSection
%%tab-english
Add three (3) to n1 \| u1 giving the sum n2 \| u2.
/%
%%tab-deutsch
das Ergebnis (n2\|u2) von Drei plus n1\|u1. Die Operation 3 + wirkt genauso
/%
/%

# **\*** "times" ( n1 n2 -- n3 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       | X       | X    | X

%%tabbedSection
%%tab-english
Multiply n1 by n2 giving the product n3.
/%
%%tab-deutsch
Der Wert n1 wird mit n2 multipliziert. n3 sind die niederwertigen 16 Bits des Produktes. Ein Überlauf wird nicht angezeigt.
/%
/%

# **\*/** "times-divide" ( n1 n2 n3 -- n4 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       | X       | X    | X

%%tabbedSection
%%tab-english
Multiply n1 by n2 producing the intermediate double-cell result d. Divide d by n3 giving the single-cell quotient n4. An ambiguous condition exists if n3 is zero or if the quotient n4 lies outside the range of a signed number.
/%
%%tab-deutsch
Zuerst wird n1 mit n2 multipliziert und ein 32-bit Zwischenergebnis er­zeugt. n4 ist der Quotient aus derm 32-bit Zwischenergebnis und dem Divisior n3. Das Produkt von n1 mal n2 wird als 32-bit Zwischenergebnis dargestellt, um eine größere Genauigkeit gegenüber dem sonst gleichwer­tigen Ausdruck n1 n2 \* n3 / zu erhalten. Eine Fehlerbedingung besteht, wenn der Divisor Null ist, oder der Quotient auperhalb des Intervalls (­ -32768.. 32767) liegt.
/%
/%

# **\*/mod** "times-divide-mod" ( n1 n2 n3 -- n4 n5 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       | X       | X    | X

%%tabbedSection
%%tab-english
Multiply n1 by n2 producing the intermediate double-cell result d. Divide d by n3 producing the single-cell remainder n4 and the single-cell quotient n5. An ambiguous condition exists if n3 is zero, or if the quotient n5 lies outside the range of a single-cell signed integer.
/%
%%tab-deutsch
Zuerst wird n1 mit n2 multipliziert und ein 32-bit Zwischenergebnis er­zeugt. n4 ist der Rest und n5 der Quotient aus dem 32-bit-Zwischener­gebnis und dem Divisor n3. n4 hat das gleiche Vorzeichen wie n3 oder ist Null. Das Produkt von n1 mal n2 wird als 32-bit Zwischenergebnis dargestellt, um eine größere Genauigkeit gegenüber dem sonst gleichwer­tigen Ausdruck n1 n2 \* n3 /mod zu erhalten. Eine Fehlerbedingung be­steht, falls der Divisor Null ist oder der Quotient außerhalb des Inter­valls (-32768...32767) liegt.
/%
/%

# **true**  ( -- -1 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       | X       | X    | X

%%tabbedSection
%%tab-english
returns -1 as a flag for logic "true" on the stack
/%
%%tab-deutsch
hinterläßt - 1 als Zeichen für logisch wahr auf dem Stack.
/%
/%

# **2/** "two-divide" or "two-slash" ( x1 -- x2 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
|         | X       | X    | X

%%tabbedSection
%%tab-english
x2 is the result of shifting x1 one bit toward the least-significant bit, leaving the most-significant bit unchanged.
/%
%%tab-deutsch
x1 wird um ein Bit nach rechts verschoben und das ergibt x2. Das Vor­zeichen wird berücksichtigt und bleibt unverändert. Die Operation 2 / wirkt genauso.
/%

# **2-** "two-minus" ( n1 \| u1 -- n2 \| u2 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       | X       |      | 

%%tabbedSection
%%tab-english
Subtract two (2) from n1 \| u1 giving the difference n2 \| u2.
/%
%%tab-deutsch
das Ergebnis von u1\|n1 minus Zwei. Die Operation 2 — wirkt genauso.
/%
/%

# **2+** "two-plus" ( n1 \| u1 -- n2 \| u2 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       | X       |      | 

%%tabbedSection
%%tab-english
Add two (2) to n1 \| u1 giving the sum n2 \| u2.
/%
%%tab-deutsch
das Ergebnis (n2\|u2) von Zwei plus n1\|u1. Die Operation 2 + wirkt genauso
/%
/%

# **2\*** "two-times" ( x1 -- x2 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
|         | X       | X    | X

%%tabbedSection
%%tab-english
x2 is the result of shifting x1 one bit toward the most-significant bit, filling the vacated least-significant bit with zero.
/%
%%tab-deutsch
x1 wird um ein Bit nach links geschoben und das ergibt x2. In das nie­derwertigste Bit wird eine Null geschrieben. Die Operation 2 \* wirkt ge­nauso.
/%
/%

# **u/mod** "u-divide-mod" ( u1 u2 -- u3 u4 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
| X       |         |      | 

%%tabbedSection
%%tab-english
Perform the unsigned division of number u1 by u2, leaving the remainder u3, and quotient u4. All values are unsigned.
/%
%%tab-deutsch
u3 ist der Rest und u4 der Quotient aus der Division von u1 durch den Divisor u2. Die Zahlen u sind vorzeichenlose 16-Bit Werte (unsigned integer). Eine Fehlerbedingung besteht, wenn der Divisor Null ist.
/%
/%

# **umax** "unsinged-maximum" ( u1 u2 -- u3 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
|         |         |      | 

%%tabbedSection
%%tab-english
u3 is the greater of u1 and u2. The largest possible number for u1 or u2 is 65535.
/%
%%tab-deutsch
u3 ist der Größere der beiden Werte u1 und u2. Benutzt die U\> Opera­tion. Die größte Zahl für u1 oder u2 ist 6553
5\.
/%
/%

# **UMIN** "unsigned-minimum" ( u1 u2 -- u3 )

| Forth79 | Forth83 | ANSI | Forth200x
|---------|---------|------|-----------
|         |         |      | 

%%tabbedSection
%%tab-english
u3 is the lesser of u1 and u2. The lowest possible number for u1 or u2 is 0.
/%
%%tab-deutsch
u3 ist der Kleinere der beiden Werte u1 und u2. Benutzt die U\< Opera­tion. Die kleinste Zahl fur u1 oder u2 ist Null.
/%
/%

