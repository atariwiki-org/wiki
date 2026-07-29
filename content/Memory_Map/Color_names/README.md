# Color Names

## Chroma

|Hue Value dec|Hue hex|Color from ... to |Name
|-------------|-------|------------------|----
|0 |$0|black to white|Black
|1 |$1|brown to gold|Rust
|2 |$2|orange to yellow|Red-orange
|3 |$3|terracotta to pink|Dark Orange
|4 |$4|dark red to magenta|Red
|5 |$5|violet to light blue |Dark lavender
|6 |$6|indigo to white |Cobalt blue
|7 |$7|sky blue |Ultramarine blue
|8 |$8|royal blue to baby blue|Medium Blue
|9 |$9|ultramarin to light blue |Dark Blue
|10 |$A|turquois |Blue-grey
|11 |$B|dark blue to aquamarin |Olive Green
|12 |$C|sea green to turquois|Medium green
|13 |$D|wood green to light green |Dark Green
|14 |$E|olive |Orange-green
|15 |$F|khaki to yellow|Orange

## Luminance

|Luminance Value|Description| Visualization
|---------------|-----------|---------------
|0 $0| dark | $\\color{#000000}███$
|2 $2|      | $\\color{#202020}███$
|4 $4|      | $\\color{#404040}███$
|6 $6|      | $\\color{#606060}███$
|8 $8|      | $\\color{#808080}███$
|10 $A|     | $\\color{#a0a0a0}███$
|12 $C|     | $\\color{#c0c0c0}███$
|14 $E|light| $\\color{#e0e0e0}███$

## Compute a color value

### Decimal

Color = Hue \* 16 + Luminance

### Hexadecimal

Color = $HL

### Binary

|Bit|7|6|5|4|3|2|1|
|---|-|-|-|-|-|-|-|
|Color Value |H|H|H|H|L|L|L|L

## Color Table

| |$00|$02|$04|$06|$08|$0A|$0C|$0E
|-|---|---|---|---|---|---|---|---
|$00| $\\color{#000000}███$|$\\color{#202020}███$|$\\color{#404040}███$|$\\color{#606060}███$|$\\color{#808080}███$|$\\color{#A0A0A0}███$|$\\color{#C0C0C0}███$|$\\color{#E0E0E0}███$
|$10| $\\color{#444400}███$|$\\color{#646410}███$|$\\color{#848424}███$|$\\color{#A0A034}███$|$\\color{#B8B840}███$|$\\color{#D0D050}███$|$\\color{#E8E85C}███$|$\\color{#FCFC68}███$
|$20| $\\color{#702800}███$|$\\color{#844414}███$|$\\color{#985C28}███$|$\\color{#AC783C}███$|$\\color{#BC8C4C}███$|$\\color{#CCA05C}███$|$\\color{#DCB468}███$|$\\color{#E8CC7C}███$
|$30| $\\color{#841800}███$|$\\color{#983418}███$|$\\color{#AC5030}███$|$\\color{#C06848}███$|$\\color{#D0805C}███$|$\\color{#E09470}███$|$\\color{#ECA880}███$|$\\color{#FCBC94}███$
|$40| $\\color{#880000}███$|$\\color{#9C2020}███$|$\\color{#B03C3C}███$|$\\color{#C05858}███$|$\\color{#D07070}███$|$\\color{#E08888}███$|$\\color{#ECA0A0}███$|$\\color{#FCB4B4}███$
|$50| $\\color{#78005C}███$|$\\color{#8C2074}███$|$\\color{#A03C88}███$|$\\color{#B0589C}███$|$\\color{#C070B0}███$|$\\color{#D084C0}███$|$\\color{#DC9CD0}███$|$\\color{#ECB0E0}███$
|$60| $\\color{#480078}███$|$\\color{#602090}███$|$\\color{#783CA4}███$|$\\color{#8C58B8}███$|$\\color{#A070CC}███$|$\\color{#B484DC}███$|$\\color{#C49CEC}███$|$\\color{#D4B0FC}███$
|$70| $\\color{#140084}███$|$\\color{#302098}███$|$\\color{#4C3CAC}███$|$\\color{#6858C0}███$|$\\color{#7C70D0}███$|$\\color{#9488E0}███$|$\\color{#A8A0EC}███$|$\\color{#BCB4FC}███$
|$80| $\\color{#000088}███$|$\\color{#1C209C}███$|$\\color{#3840B0}███$|$\\color{#505CC0}███$|$\\color{#6874D0}███$|$\\color{#7C8CE0}███$|$\\color{#90A4EC}███$|$\\color{#A4B8FC}███$
|$90| $\\color{#00187C}███$|$\\color{#1C3890}███$|$\\color{#3854A8}███$|$\\color{#5070BC}███$|$\\color{#6888CC}███$|$\\color{#7C9CDC}███$|$\\color{#90B4EC}███$|$\\color{#A4C8FC}███$
|$A0| $\\color{#002C5C}███$|$\\color{#1C4C78}███$|$\\color{#386890}███$|$\\color{#5084AC}███$|$\\color{#689CC0}███$|$\\color{#7CB4D4}███$|$\\color{#90CCE8}███$|$\\color{#A4E0FC}███$
|$B0| $\\color{#00402C}███$|$\\color{#1C5C48}███$|$\\color{#387C64}███$|$\\color{#509C80}███$|$\\color{#68B494}███$|$\\color{#7CD0AC}███$|$\\color{#90E4C0}███$|$\\color{#A4FCD4}███$
|$C0| $\\color{#003C00}███$|$\\color{#205C20}███$|$\\color{#407C40}███$|$\\color{#5C9C5C}███$|$\\color{#74B474}███$|$\\color{#8CD08C}███$|$\\color{#A4E4A4}███$|$\\color{#B8FCB8}███$
|$D0| $\\color{#143800}███$|$\\color{#345C1C}███$|$\\color{#507C38}███$|$\\color{#6C9850}███$|$\\color{#84B468}███$|$\\color{#9CCC7C}███$|$\\color{#B4E490}███$|$\\color{#C8FCA4}███$
|$E0| $\\color{#2C3000}███$|$\\color{#4C501C}███$|$\\color{#687034}███$|$\\color{#848C4C}███$|$\\color{#9CA864}███$|$\\color{#B4C078}███$|$\\color{#CCD488}███$|$\\color{#E0EC9C}███$
|$F0| $\\color{#442800}███$|$\\color{#644818}███$|$\\color{#846830}███$|$\\color{#A08444}███$|$\\color{#B89C58}███$|$\\color{#D0B46C}███$|$\\color{#E8CC7C}███$|$\\color{#FCE08C}███$

See also: [Color topics](../Memory_Map/#Color_topics)
