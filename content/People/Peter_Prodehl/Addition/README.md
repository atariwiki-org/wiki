# Addition

- Beitrag noch in Bearbeitung -

Es gibt prinzipiell 2 Möglichkeiten, um Zahlen zu addieren:

Der Befehl inc var1 erhöht den Wert in Variable var1 um 1

Der Befehl adc addiert zum Akkumulator einen festen Wert oder einen Wert in einer Speicherstelle: Vor jeder Addition mit dem Befehl adc sollte man das Carry mit clc löschen!

```
        clc
        lda var1
        adc #10
        sta var1

        clc
        lda var1
        adc var2
        sta var1
```

Bei einer 16-Bit Addition muss man etwas mehr tun... Hier definiert man ein Low-Byte (var1) und eine High-Byte (var1+1) und addiert dann folgend:

```
        clc
        lda var1
        adc var2
        sta var1
        lda var1+1
        adc #0
        sta var1+1
```

Immer wenn der Wert bei der Addition den Overflow trifft, wird Carry gesetzt und wenn man adc #0 macht, addiert man ja immer zu einem Wert (hier das High-Byte) dann 0+1(Carry) also 1 dazu. Es geht auch einfacher:

```
       clc
       lda var1
       adc var2
       bcc weiter
       inc var1+1
 weiter    
           sta var1
```
