;       .TITLE 'COLEEN FLOATING POINT ROUTINES BY C SHAW'
;
;       MORE ACCURATE VERSION OF THE FOLLOWING SHEPARDSON ROUTINES
;
;       EXP, EXP10, LOG, LOG10, SIN, COS, ATAN, SQR AND POWER
;
;       THESE ROUTINES WERE TAKEN FROM THE CALCULATOR CARTRIDGE AND MODIFIED
;       MANY OTHER MATH FUNCTIONS SUCH AS TAN, ARCSIN AND ARCCOS ARE ALSO
;       INCLUDED IN THAT CARTRIDGE.
;
;       FORMATTED AND ADAPTED TO WUDSN & MADS SYNTAX BY PETER DELL, 2017-06-13
;       @com.wudsn.ide.asm.outputfileextension=.rom


CR      =       $9B             ;ATASCII CARRIAGE RETURN

GETREC  =       5               ;GET RECORD
PUTREC  =       9               ;PUT RECORD
ICCOM   =       $342
ICBAL   =       $344
ICBLL   =       $348
CIOV    =       $E456

;                                FLOATING POINT SUBROUTINES
;
FPREC   =       6               ;FLOATING PT PRECISION (# OF BYTES)
;                               IF CARRY USED THEN CARRY CLEAR => NO ERROR, CARRY SET => ERROR
AFP     =       $D800           ;ASCII->FLOATING POINT (FP)
;                               INBUFF+CIX -> FR0, CIX, CARRY
FASC    =       $D8E6           ;FP -> ASCII      FR0-> LBUFF  (INBUFF)
IFP     =       $D9AA           ;INTEGER -> FP
;                               0-$FFFF (LSB,MSB) IN FR0,FR0+1->FR0
FPI     =       $D9D2           ;FP -> INTEGER    FR0 -> FR0,FR0+1, CARRY
FSUB    =       $DA60           ;FR0 <- FR0 - FR1  ,CARRY
FADD    =       $DA66           ;FR0 <- FR0 + FR1  ,CARRY
FMUL    =       $DADB           ;FR0 <- FR0 * FR1  ,CARRY
FDIV    =       $DB28           ;FR0 <- FR0 / FR1  ,CARRY
FLD0R   =       $DD89           ;FLOATING LOAD REG0    FR0 <- (X,Y)
FLD1R   =       $DD98           ;    "     "   REG1    FR1 <- (X,Y)
FSTOR   =       $DDA7           ;FLOATING STORE REG0 (X,Y) <- FR0
FMOVE   =       $DDB6           ;FR1 <- FR0
PLYEVL  =       $DD40           ;FR0 <- P(Z) = SUM(I=N TO 0) (A(I)*Z**I)     CARRY
;                               INPUT: (X,Y) = A(N),A(N-1)...A(0)  -> PLYARG
;                                      ACC   = # OF COEFFICIENTS = DEGREE+1
;                                      FR0   = Z
EXP     =       $DDC0           ;FR0 <- E**FR0 = EXP10(FR0 * LOG10(E))  CARRY
EXP10   =       $DDCC           ;FR0 <- 10**FR0  CARRY
LOG     =       $DECD           ;FR0 <- LN(FR0) = LOG10(FR0)/LOG10(E)   CARRY
LOG10   =       $DED1           ;FR0 <- LOG10 (FR0)    CARRY

;                               THE FOLLOWING ARE IN BASIC CARTRIDGE:
;SIN    =       $BD81           ;FR0 <- SIN(FR0)  DEGFLG=0 =>RADS,  6=>DEG.   CARRY
;COS    =       $BD73           ;FR0 <- COS(FR0)    CARRY
;ATAN   =       $BE43           ;FR0 <- ATAN(FR0)   CARRY
;SQR    =       $BEB1           ;FR0 <- SQUAREROOT(FR0)   CARRY


;FLOATING POINT ROUTINES ZERO PAGE (NEEDED ONLY IF F.P. ROUTINES ARE CALLED)
        ORG $D4
FR0     .DS FPREC       ;FP REG0
FRE     .DS FPREC
FR1     .DS FPREC       ;FP REG1
FR2     .DS FPREC
FRX     .DS 1           ;FP SPARE
EEXP    .DS 1           ;VALUE OF E
NSIGN   .DS 1           ;SIGN OF #
ESIGN   .DS 1           ;SIGN OF EXPONENT
FCHRFLG .DS 1           ;1ST CHAR FLAG
DIGRT   .DS 1           ;# OF DIGITS RIGHT OF DECIMAL
CIX     .DS 1           ;CURRENT INPUT INDEX
INBUFF  .DS 2           ;POINTS TO USER'S LINE INPUT BUFFER
ZTEMP1  .DS 2
ZTEMP4  .DS 2
ZTEMP3  .DS 2
RADFLG  .DS 1           ;0=RADIANS, 6=DEGREES
FLPTR   .DS 2           ;POINTS TO USER'S FLOATING PT NUMBER
FPTR2   .DS 2

;FLOATING PT ROUTINES' NON-ZERO PAGE RAM (NEEDED ONLY IF F.P. ROUTINES CALLED)
        *=$57E
LBPR1   .DS 1           ;LBUFF PREFIX 1
LBPR2   .DS 1           ;LBUFF PREFIX 2
LBUFF   .DS 128         ;LINE BUFFER
PLYARG  =       LBUFF+$60       ;POLYNOMIAL ARGUMENTS
FPSCR   =       PLYARG+FPREC
FPSCR1  =       FPSCR+FPREC
FSCR    =       FPSCR
FSCR1   =       FPSCR1

;                               FP PACKAGE EQUATES FOR SIN, COS, ATAN, AND SQR ROUTINES ETC

NATCF   =       $B              ;NUMBER OF ATAN COEFFICIENTS FOR POLYNOMIAL EVALUATION
NSCF    =       6               ;NUMBER OF SIN COEFFICIENTS

FASC2   =       $D905           ;AFTER FASC (FINISH FP TO ASCII CONVERSION)
XEFORM  =       $D920           ;!EFORM   PROCESS E FORMAT    FOR FP -> ASCII CONVERSION
XEFRM2  =       $D928           ;AFTER XEFORM (FINISH CONVERSION)
ZFR0    =       $DA44           ;FR0 <- 0
ZF1     =       $DA46           ;CLEAR 6 BYTES STARTING AT 0,X
INTLBF  =       $DA51           ;INIT LBUFF INTO INBUFF FOR FP -> ASCII CONVERSION
NORM    =       $DC00           ;NORMALIZE FLOATING POINT NUMBER - USED BY STRUNC ONLY
XCVFR0  =       $DC70           ;ICVFR0 FP TO 10 ASCII DIGITS IN LBUFF
EXP1    =       $DE03           ;MIDDLE OF EXP10 WHERE PLYEVL IS CALLED
EXP11   =       $DE12           ;AFTER PLYEVL IN EXP10
LOG10E  =       $DE89           ;LOGTEN (E) = .4342944819
XFORM   =       $DE95           ;FR0 <- (FR0-(X,Y)) / (FR0+(X,Y)) .
FHALF   =       $DF6C           ;FLOATING POINT CONSTANT 5
ATCOEF  =       $DFAE           ;ATAN COEFFICIENTS
FP9S    =       $DFEA           ;FLOATING POINT CONSTANT .9999999999 (ALMOST 1)
PIOV4   =       $DFF0           ;FLOATING POINT CONSTANT PI/4 = .7853981634

;                               VARIABLES
        ORG $480
QUADFLG .DS 1                   ;SIN QUADRANT FLAG
INTFLG  .DS 1                   ;FLAG FOR POWER ROUTINE
FTEMP   .DS 6                   ;TEMPORARY FLOATING POINT REGISTER POR POWER ROUTINE

        OPT H-F+                ;NO HEADER, ACTIVATE FILL MODE FOR ROM CREATION
        ORG $A000               ;ARBITRARY STARTING POINT
;
;       TEST PROGRAM
;
START
        JSR     GETNUM
        JSR     FMOVE
        JSR     GETNUM          ;GET 2ND NUMBER FROM E -- OMIT IF ONLY ONE ARGUMENT

        JSR     SPOWER          ;CHANGE TO GET DIFFERENT ROUTINES
        BCC     NOERR
;
;       ERROR -- DISPLAY MESSAGE
;
        LDA     #<ERRMSG
        STA     ICBAL
        LDA     #>ERRMSG
        JMP     CONTIN

NOERR
        JSR     FASC            ;FLOATING POINT TO ASCII
;
;       FIND END OF STRING AND CHANGE NEGATIVE # TO POSITIVE AND ADD CARRIAGE RETURN
;
        LDY     #$FF
MLOOP
        INY
        LDA     (INBUFF),Y
        BPL     MLOOP
        AND     #$7F
        STA     (INBUFF),Y
        INY
        LDA     #CR
        STA     (INBUFF),Y
;
;       DISPLAY RESULT
;
        LDA     INBUFF
        STA     ICBAL
        LDA     INBUFF+1
CONTIN
        STA     ICBAL+1
        LDA     #PUTREC
        STA     ICCOM
        LDA     #40
        STA     ICBLL
        LDA     #0
        STA     ICBLL+1
        LDX     #0
        JSR     CIOV

        JMP     START           ;DO IT AGAIN
GETNUM                          ;GET ONE NUMBER FROM E (IOCB #0)
        LDA     #GETREC         ;GET RECORD (ENDS IN CR)
        STA     ICCOM
        LDA     #<LBUFF
        STA     ICBAL
        LDA     #>LBUFF
        STA     ICBAL+1
        LDA     #40
        STA     ICBLL
        LDA     #0
        STA     ICBLL+1
        LDX     #0
        JSR     CIOV
        LDA     #<LBUFF
        STA     INBUFF
        LDA     #>LBUFF
        STA     INBUFF+1
        LDA     #0
        STA     CIX
        JMP     AFP             ;CALL ASCII TO FLOATING POINT AND RETURN


ERRMSG  .BYTE 'ERROR',CR        ;INDICATES CARRY SET RETURN FROM FP ROUTINE

;
;       FR0 <- E^FR0
;
;       USES INTEGER FUNCTION LIKE BASIC'S INSTEAD OF JUST IFP, WHICH ROUNDS
;       PROVIDES ACCURACY OF AT LEAST 7 DIGITS (EXCEPT POSSIBLY AT EXTREMA)
;       INSTEAD OF 6.

SEXPE                           ;E^X (SEE SHEP ATARI BASIC $DDC0 EXP)
        LDX     #<LOG10E        ;E^X = 10^(X*LOGTEN(E))
        LDY     #>LOG10E
        JSR     LD1MUL          ;FR0 <- FR0*LOG10E
;
;       FR0 <- 10^FR0 (SEE COMMENTS FOR SEXPE)
;
;       RETURNS EXACT POWER OF 10 FOR INTEGERS.
;
SEXPTE                          ;10^X (SEE SHEP ATARI BASIC $DDCC EXP10)
        LDA     #0              ;CLEAR TRANSFORM FLAG
        STA     DIGRT           ;XFMFLG
        LDA     FR0
        STA     FCHRFLG         ;SAME AS SGNFLG   REMEMBER ARG SIGN
        JSR     SABSVA          ;TAKE ABSOLUTE VALUE, A<-FR0
        SEC
        SBC     #$40
        BMI     SEXP05          ;X<1 SO USE SERIES DIRECTLY (BUT CHECK FOR 0 FIRST)
        LDX     #<FPSCR
        LDY     #>FPSCR
        JSR     FSTOR           ;SAVE IN SCRATCH REG
        JSR     SINTEG          ;GREATEST INTEGER <= X
        JSR     FPI             ;MAKE INTEGER
        BCS     SFERR3          ;RETURN IF ERROR
        LDA     FR0+1           ;CHECK MSB
        BNE     SFERR3          ;SHOULDN'T HAVE ANY -- RETURN IF ERROR
        LDA     FR0
        STA     DIGRT           ;XFMFLG         SAVE MULTIPLIER EXP
        JSR     IFP             ;NOW TURN IT BACK TO FP
        JSR     FMOVE           ;FR1 <- FR0
        LDX     #<FPSCR         ;RELOAD FROM TEMP SCRATCH REG
        LDY     #>FPSCR
        JSR     FLD0R
        JSR     SFSUB
SEXP05
        LDA     FR0
        BNE     SEXP10
        LDA     #1              ;10^0 = 1
        JSR     PSET0
        JMP     EXP11           ;$DE12 DO 10^X, SKIPPING PLYEVL   LDA XFMFLG
SEXP10
        JMP     EXP1            ;DO REST OF 10^X
SFERR3
        SEC
INIT    RTS

;       FR0 <- FR0 ^ FR1 = SEXPTE (FR1 * SLOGTE (FR0))
;
;       USES MORE ACCURATE SEXPTE INSTEAD OF EXP10
;       RETURNS EXACT INTEGER IF BOTH FR0 AND FR1 ARE POSITIVE INTEGERS.
;       RETURNS RECIPROCAL INTEGER IF BOTH ARE INTEGERS AND FR1 < 0
;       RETURNS CARRY SETT IF FR0 < 0 OR (FR0 = 0 AND FR1 < 0) OR OVERFLOW
;       0 ^ FR1 = 0 IF FR1 = 0
;       0 ^ 0 = 1
;
SPOWER
        LDA     FR0             ;FR0 = 0?
        BNE     SPOW20          ;NO
        LDA     #0              ;YES.
        LDX     FR1
        BMI     PERR2           ;FR1 < 0        0 ^ -X => ERROR
        BNE     SPOW10          ;FR1 > 0        0 ^ X = 0
        LDA     #1              ;FR1 = 0        0 ^ 0 = 1
SPOW10
        JMP     PSET0
SPOW20
        LDA     FR1
        PHA                     ;SAVE FR1'S SIGN
        AND     #$7F            ;TAKE ABSOLUTE VALUE OF FR1
        STA     FR1
        LDX     #<FTEMP         ;SAVE FR1 IN FTEMP
        LDY     #>FTEMP
        JSR     FST1R
        JSR     FMOVE
        LDA     #1
        STA     INTFLG          ;ASSUME NOT BOTH INTEGERS
        JSR     STRUNC          ;TRUNCATE FR0 -- RETURN A=0 AND EQ IF FR0 WAS ALREADY AN INTEGER
        BNE     SPOW50          ;FR0 WAS NOT AN INTEGER
        LDX     #<FTEMP         ;LOAD SAVED VALUE INTO FR0
        LDY     #>FTEMP
        JSR     FLD0R
        JSR     STRUNC          ;TEST FOR INTEGER
        BNE     SPOW50          ;NOT INTEGER
        STA     INTFLG          ;0 => BOTH INTEGER => RESULT SHOULD BE INTEGER
SPOW50
        LDX     #<FR1
        LDY     #>FR1           ;FR0 <- FR1 (MOVE ORIGINAL FR0 BACK)
        JSR     FLD0R
        JSR     SLOGTE          ;LOG10(FR0)
        BCS     PERROR          ;ERROR => POP FR1 SIGN AND RETURN
        LDX     #<FTEMP         ;LOAD FR1 AGAIN
        LDY     #>FTEMP
        JSR     FLD1R
        JSR     FMUL            ;FR0 <- FR1 * LOG10(BASE)
        BCS     PERROR          ;RETURN IF ERROR
        JSR     SEXPTE          ;10 ^ FR0
        BCS     PERROR
        LDA     INTFLG          ;SHOULD RESULT BE INTEGER?
        BNE     SPOW80          ;NO.
                                ;YES ROUND TO NEAREST INTEGER
        LDX     #<FHALF         ;FR1 <- 0.5
        LDY     #>FHALF
        JSR     FLD1R
        LDA     FR0
        BPL     SROU10


        LDA     #$3F+$80        ;IF FR0 =0 THEN FR1 <- -0.5
        STA     FR1
SROU10
        JSR     SFADD           ;FR0 <- FR0 + FR1 (2-LEVEL RETURN IF ERROR)
        JSR     STRUNC          ;TRUNCATE
SPOW80
        CLC                     ;INDICATE NO ERROR?
        PLA                     ;RELOAD FR1'S ORIGINAL SIGN
        BPL     PRTN            ;DONE IF > 0
        JSR     FMOVE           ;IF < 0 THEN TAKE RECIPROCAL
        LDA     #1
        JSR     PSET0           ;FR0 <- 1
        JMP     FDIV
PERROR
        PLA                     ;DISCARD FR1'S SIGN
PERR2
        SEC                     ;INDICATE ERROR
PRTN
        RTS

;
;       FR0 <- NATURAL LOG (FR0)
;
;       RETURNS CARRY SET IF FR0<=0
;       RETURNS EXACTLY 0 IF FR0 = 1
;
SLN
        JSR     LOGCHK          ;CHECK FDR 0,1 (SPECIAL CASES)
        JMP     LOG

;
;       FR0 <- COMMON LOG (FR0) (LOG BASE 10)
;       SIMILAR TO SLN
;
SLOGTE
        JSR     LOGCHK
        JMP     LOG10
LOGCHK                          ;CHECK FOR 0,1
        SEC
        LDA     FR0
        BEQ     PULRTN          ;LN(0),LOG(0) => ERROR
        BMI     PULRTN          ;<0  => ERROR => 2-LEVEL RETURN
        LDX     #FPREC-1
LOGCLP
        LDA     FR0,X
        CMP     ONE,X
        BNE     RTURN2          ;NOT 1 => OK
        DEX
        BPL     LOGCLP
        PLA                     ;SKIP LOGCHK RETURN
        PLA
        JMP     PCLRO           ;LN(1)=LOGTEN(1)=0
PULRTN
        PLA
        PLA
RTURN2  RTS

; BASIC SINE & COS ROUTINES
;
; TO FIX BUGS OF VERSION 5 9 OF SHEP BASIC
;
; BY DAVE & LARRY -- MODIFIED BY CAROL
; 4-6-79
;
; MOD FUNCTION MAKES ROUTINES MORE ACCURATE FOR ANGLES > 360 DEGREES
;
;
; COSINE ROUTINE -- ADD 90 OR PI/2 TO FR0 TO DO SIN

SCOS
        JSR     SINMOD          ;TAKE ANGLE MOD 2*PI, 360
        JSR     PIOVL           ;SET UP X & Y REGS TO LOAD PI/2 OR 90
        JSR     FLD1R           ;PUT PI/2 OR 90 INTO FR1
        JSR     SFADD           ;FR0=FR0 + PI/2 (OR 90)
;
; SINE ROUTINE
; COMPUTE QUADRANT, GET FRACTION AND DO POLYNOMIAL.
; THEN ADJUST FOR QUADRANT
SSIN
        JSR     SINMOD          ;TAKE ANGLE MOD 2*PI, 360
;
; FR0=FR0/(PI/2) OR FR0=FR0/90
        JSR     PIOVL           ;LOAD X & Y REGS TO GET PI/2 OR 90
        JSR     LD1DIV          ;FR0=FR0/FR1
;                               NOW HAVE 0-4 (NOT NECESSARILY INTEGER)
; IF FR0 NOW FRACTION, IT IS QUADRANT 0
; ELSE, GET INTEGER OF FR0 LSD
        LDA     #0
        STA     QUADFLG         ;ASSUME QUADRANT 0
        LDA     FR0             ;EXPONENT
        CMP     #$40            ;SUBTRACT 64 EXCESS
        BCC     SINF3           ;GO IF QUADRANT 0

        LDA     FR0+1           ;SHOULD BE 0. 1. 2. OR 3
        STA     QUADFLG         ;NOW HAVE QUADRANT (0,1,2, OR 3)

        JSR     FMOVE           ;FR1 <- FR0
        JSR     STRUNC          ;TRUNCATE FR0
        JSR     SFSUB           ;FR0 <- TRUNC(FR0)-FR0
        JSR     SCHGSG          ; CHANGE SIGN -- FRACTIONAL PART (FR0) = FR0 - TRUNC (FR0)
;
; IF ODD QUADRANT' SET FR0=1-FR0 (90 DEGREE INVERT)
        LSR     QUADFLG         ;IS IT ODD QUADRANT?
        BCC     SINF3           ;NO
        JSR     ONESUB          ;FR0 <- 1-FR0
;
; SAVE ARG FOR LATER A1B2 SINF3
SINF3
        LDX     #<FPSCR
        LDY     #>FPSCR
        JSR     FSTOR           ;FPSCR <- FR0
;
; NOW COMPUTE SINE
; THIS CODE TAKEN FROM BASIC 5.9 LINES 6760-6770
        JSR     SSQUAR          ;FR0=X**2
        LDA     #NSCF
        LDX     #<SCOEF
        LDY     #>SCOEF


        JSR     PLYEVL          ;EVALUATE P(X**2)
        LDX     #<FPSCR
        LDY     #>FPSCR
        JSR     LD1MUL          ;FR0=SIN(X)=X*P(X**2)
;
; IF LOWER QUADRANT (2 OR 3) THEN FR0=-(FR0)
        LSR     QUADFLG         ;IS IT LOWER QUAD
        BCC     SINF4           ;NO
        JSR     SCHGSG          ;YES
;
SINF4
;
; IF ABS(FR0) >= 1 THEN SET TO 1
        LDA     FR0
        AND     #$7F            ;WITHOUT SIGN BIT
        CMP     #$40            ;COMPARE $40
        BCC     SINFIN
        LDA     #0
        STA     FR0+4           ;PERFORM PSEUDO INT(FR0)  (CLEAR LAST 2 BYTES)
        STA     FR0+5
SINFN2  CLC                     ;NO ERROR
SINFIN  RTS

;
;       FR0 <- ARC TANGENT (FR0)
;       FROM SHEPARDSON ATARI BASIC 5.9 4-5-79 (MODIFIED)
;       SAME ACCURACY AS SHEP VERSION -- USES FEWER BYTES
;
SATAN
        LDA     #0
        STA     FCHRFLG         ;SIGN FLAG OFF
        STA     DIGRT           ;AND TRANSFORM FLAG
        LDA     FR0
        TAX
        AND     #$7F
        CMP     #$40            ;CHECK X VS 1.0 JSBHHI
        BMI     ATAN1           ;X<1 - USE SERIES DIRECTLY
        STA     FR0             ;FORCE PLUS
        TXA                     ;OLD FR0 WITH SIGN
        AND     #$80
        STA     FCHRFLG         ;REMEMBER SIGN
        INC     DIGRT
        LDX     #<FP9S
        LDY     #>FP9S
        JSR     XFORM           ;CHANGE ARG TO (X-1)/(X+1)
ATAN1
;                                ARCTAN(X), -1<X<1 BY SERIES APPROX
        LDX     #<FPSCR         ;CAN'T USE FTEMP BECAUSE SATAN IS CALLED BY OTHER ROUTINES. WHICH USE IT
        LDY     #>FPSCR
        JSR     FSTOR
        JSR     SSQUAR          ; X*X -> FR0
        LDA     #NATCF
        LDX     #<ATCOEF
        LDY     #>ATCOEF
        JSR     PLYEVL          ;P(X*X)
        BCS     ATNOUT          ;ERROR
        LDX     #<FPSCR
        LDY     #>FPSCR
        JSR     LD1MUL          ;X*P(X*X)
        LDA     DIGRT           ;WAS ARG XFORMED
        BEQ     ATAN2           ;NO.
        LDX     #<PIOV4          ;YES-ADD ARCTAN(1) = PI/4
        LDY     #>PIOV4
        JSR     FLD1R
        JSR     FADD
        LDA     FCHRFLG         ;GET ORG SIGN
        ORA     FR0
        STA     FR0             ;ATAN(-X) = -ATAN (X)
ATAN2
        LDA     RADFLG          ;RAD OR DEG
        BEQ     ATNOUT          ;RAD - FINI
        LDX     #<PIOV18
        LDY     #>PIOV18
        JSR     LD1DIV          ;DIVIDE BY PI/180 TO CONVERT TO DEGREES
ATNOUT
        RTS
;
;       FR0 <- SQUARE ROOT (FR0)
;
;       FROM SHEPARDSON ATARI BASIC 5.9 4-5-79 (MODIFIED)
;       SAME ACCURACY AS SHEP VERSION -- USES FEWER BYTES
;
;       USES NEWTON-RAPHSON ITERATION
;       F(Y) = Y*Y - X
;       FPRIME(Y) = 2*Y
;       Y[I+1] = Y[I] - F(Y[I]) / FPRIME(Y[I]) = Y[I] + . 5*((X/Y[I])-Y[I])
;
;       ERROR EXIT
;

SQRERR
        SEC
        RTS
;
;       ENTRY POINT
;
SSQRT                           ;X<-SQRT(X)
        LDX     #FR1
        JSR     ZF1             ;FR1 <- ALL 0'S
        LDX     #0
        STX     DIGRT
        INX                     ;1
        STX     FR1+1
        LDA     FR0
        BMI     SQRERR          ;ERROR IF <0
        CMP     #$3F
        BEQ     FSQR            ;X IN RANGE OF APPROX - GO DO IT TO IT
        TAX
        INX
        STX     FR1             ;MANTISSSA = 1
        STX     DIGRT           ;NOT IN RANGE - TRANSFORM
        JSR     FDIV            ;X/100**N
FSQR                            ;SQR(X) 0.1<=X<1
        LDA     #6
        STA     ESIGN
        LDX     #<FSCR
        LDY     #>FSCR
        JSR     FSTOR           ;STASH X IN FSCR
        LDA     #2
        JSR     INTSUB          ;2-X
        LDX     #<FSCR
        LDY     #>FSCR
        JSR     LD1MUL          ;X*(2-X) : 1ST APPROX
SQRLP
        LDX     #<FSCR1
        LDY     #>FSCR1
        JSR     FSTOR           ;Y->FSCR1
        JSR     FMOVE           ;Y->FR1
        LDX     #<FSCR
        LDY     #>FSCR
        JSR     FLD0R
        JSR     FDIV            ;X/Y
        LDX     #<FSCR1
        LDY     #>FSCR1
        JSR     FLD1R
        JSR     FSUB            ;(X/Y)-Y
        LDX     #<FHALF
        LDY     #>FHALF
        JSR     LD1MUL          ;.5*((X/Y)-Y)-DELTAY
        LDA     FR0             ;DELTA 0
        BEQ     SQRDON
        LDX     #<FSCR1
        LDY     #>FSCR1
        JSR     FLD1R
        JSR     FADD            ;Y=Y+DELTAY
        DEC     ESIGN           ;COUNT & LOOP
        BPL     SQRLP
SQRDON
        LDX     #<FSCR1         ;DELTA = 0 - GET Y BACK
        LDY     #>FSCR1
        JSR     FLD0R
;                                WAS ARG TRANSFORMED?
        LDX     #FR1
        JSR     ZF1             ;FR1 <- ALL 0'S AGAIN ;NO FINI
        LDA     DIGRT
        BEQ     SABSVA
        SEC
        SBC     #$40
                                ;YES - TRANSFORM RESULT TO MATCH
        LSR                     ;DIVIDE EXP BY 2
        PHP                     ;SAVE CARRY (LSB OF DIGRT)
        CLC
        ADC     #$40
        STA     FR1
        LDA     #1              ;MANTISSA = 1
        PLP                     ;RELOAD CARRY (LSBIT OF DIGRT)
        BCC     SQR2            ;WAS EXP ODD OR EVEN
        LDA     #$10            ;ODD - MANT = 10
SQR2
        STA     FR1+1
        JSR     FMUL            ;SQR(X) = SGR(X/100**N) * <10**N>
SABSVA                          ;FR0 - ABSVAL(FR0) AC-FR0
        LDA     FR0
        AND     #$7F
        STA     FR0
SABRTN
        RTS
;
;       THE FOLLOWING ROUTINES ARE CALLED BY THE PREVIOUS ROUTINES
;       IN GENERAL. THEY DO A 2-LEVEL RETURN WITH CARRY SET IF AN
;       ERROR OCCURS. THUS BYPASSING THE REMAINDER OF THE CALLING ROUTINE
;
FST1R                           ; LIKE FSTOR EXCEPT USES FR1
        STX     FLPTR
        STY     FLPTR+1
        LDY     #5
FSLOP
        LDA     FR1,Y
        STA     (FLPTR),Y
        DEY
        BPL     FSLOP
        RTS

LD1MUL                          ; FR0 <- FR0 * DATA CONSTANT (ADDR IN X & Y)
        JSR     FLD1R
        JMP     SFMUL

SSQUAR
        JSR     FMOVE           ;FR0 <- FR0 * FR0

SFMUL                           ;FR0 <- FR0 * FR1
        JSR     FMUL
        BCS     CRYSND
        RTS
SFADD                           ;FR0 <- FR0 + FR1
        JSR     FADD
        BCS     CRYSND
        RTS
ONESUB  LDA #1                  ;FR0 <- 1-FR0

INTSUB                          ;FR0 <- A - FR0
        PHA
        JSR     FMOVE
        PLA
        JSR     PSET0           ;A MUST BE FROM 0-9 OR BCD
SFSUB                           ;FR0 <- FR0 - FR1
CRYCHK  JSR     FSUB            ;CHECK CARRY TO SEE IF THERE IS AN ERROR
        BCC     RETURN          ;RETURN IF CARRY CLEAR
CRYSND
        PLA                     ;DO A 2-LEVEL RETURN IF ERROR
        PLA
RETURN  RTS

LD1DIV                          ;FR0 <- FR0 / (X,Y)
        JSR     FLD1R
SFDIV                           ;FR0 <- FR0 / FR1
        JSR     FDIV
        BCS     CRYSND
        RTS

SINTEG                          ;FR0 <- INT(FR0)
        LDA     FR0
        PHA
        JSR     STRUNC          ;FR0 <- TRUNC(FR0), RETURN EQ IF ALREADY INT
        BEQ     INTRT3          ;INTEGER   POP AND RETURN
        PLA                     ;RELOAD OLD FR0 WITH SIGN
        BPL     INTRT2          ;POSITIVE
                                ;WAS NEGATIVE NON-INTEGER
SUBONE                          ;FR0 <- FR0-1
        LDA     #1
SUBINT                          ;FR0 <- FR0 - A
        JSR     INTSUB          ;FR0 <- A-FR0
SCHGSG
        LDA     FR0             ;FR0 <- -FR0 SET EG/NE
        BEQ     SCH10
        EOR     #$80
        STA     FR0
SCH10
        RTS

;                               GREATEST INT <= FR0
;
;               PART OF INT ROUTINE FROM SHEP ATARI BASIC B0D5-B0EE
;               DOES NOT AFFECT FR1?
;
STRUNC                          ;TRUNCATE FR0
                                ;RETURN A=0 AND EQ IF FR0 WAS ALREADY AN INTEGER
        LDA     FR0             ;GET EXPONENT
        AND     #$7F            ;AND OUT SIGN BIT
        SEC
        SBC     #$3F            ;GET LOCATION OF 1ST FRACTION BYTE
        BPL     XINT1           ;IF >= 0 THEN BRANCH
        LDA     #0              ;ELSE SET =0
XINT1

        TAX                     ;PUT IN X AS INDEX INTO FROM
        LDA     #0              ;SET ACCUM TO ZERO FOR ORING
        TAY                     ;ZERO Y
INT2
        CPX     #FPREC-1        ;IS D. P. LOC >= 5?
        BCS     INTRTN          ;IF YES, LOOP DONE
        ORA     FR0+1,X         ;OR IN THE BYTE OF MANTISSA
        STY     FR0+1,X         ;ZERO BYTE
        INX                     ;POINT TO NEXT BYTE
        BNE     INT2            ;JMP
INTRTN
        PHA                     ;SAVE OR OF ALL FRACTIONAL BYTES
        JSR     NORM            ;NORMALIZE
INTRT3
        PLA                     ;RELOAD
INTRT2  RTS
PCLRO                           ;CLEAR FR0
;                               RETURN WITH CARRY CLEAR (CC)
        LDA     #0
PSET0                           ;SET FR0 TO INTEGER PASSED IN A (MUST BE BCD OR <10)
;                               RETURN WITH CARRY CLEAR (CC)
        PHA
        JSR     ZFR0            ;FR0 <- 0
        PLA
        BEQ     CLRTN           ;0 => ALL 0'S
        STA     FR0+1
        LDA     #$40            ;SET EXPONENT
        STA     FR0
CLRTN
        CLC
        RTS


;       SINE ROUTINES
;
SINLD
        LDX     #<PI2           ;LOAD 2*PI
        LDY     #>PI2
        LDA     RADFLG
        BEQ     SNMOD3
        LDX     #<C360          ;DEGREES => LOAD 360
        LDY     #>C360
SNMOD3
        RTS

SINMOD                          ;FIND ANGLE MOD 2*PI OR 360 DEPENDING ON RADFLG
        LDA     FR0
        AND     #$7F
        CMP     #$45
        BCS     CRYSND          ;OUT OF RANGE -- 2-LEVEL RETURN
        LDX     #<FPSCR         ;SAVE IN TEMP SCRATCH REG
        LDY     #>FPSCR
        JSR     FSTOR
        JSR     SINLD           ;LOAD 2*PI OR 360
        JSR     FLD1R
        JSR     SFDIV           ;ANGLE/360
        JSR     SINTEG          ;INT(ANGLE/360)
        JSR     SINLD           ;LOAD 2*PI OR 360
        JSR     FLD1R
        JSR     SFMUL           ;INT(ANGLE/360)*360
        JSR     FMOVE
        LDX     #<FPSCR         ;RELOAD ANGLE
        LDY     #>FPSCR
        JSR     FLD0R
        JMP     SFSUB           ;ANGLE - INT(ANGLE/360)*360

PIOVL           ;LOAD X & Y REGS IN PREPARATION FOR LOADING REG 0 OR 1 WITH PI/2. 90 OR 100(IF GRAD)
        LDA     #<RADPI2
        CLC
        ADC     RADFLG
        TAX
        LDY     #>RADPI2
        RTS

;                               DATA

ONE     .BYTE   $40,$01,0,0,0,0       ;1

SCOEF
        .BYTE   $BD,$03,$55,$14,$99,$39 ;-.00000355149939

        .BYTE   $3E,$01,$60,$44,$27,$52 ;0.000160442752

        .BYTE   $BE,$46,$81,$75,$43,$55 ;-.004681754355

        .BYTE   $3F,$07,$96,$92,$62,$39 ;0.0796926239

        .BYTE   $BF,$64,$59,$64,$08,$67 ;-.6459640867

RADPI2  .BYTE   $40,$01,$57,$07,$96,$32 ;PI/2 =  1.570796327  PART OF SCOEF

        .BYTE   $40,$90,0,0,0,0         ;90 (DEGREES)

PIOV18  .BYTE   $3F,$01,$74,$53,$29,$25 ;PI/180 = .0174532925 DEG->RAD

PI2     .BYTE   $40,$06,$28,$31,$85,$31 ;2*PI = 6.28318531

C360    .BYTE   $41,$03,$60,0,0,0       ;360

        ORG $BFFA               ;CARTRIDGE START INFO
        .WORD   START           ;COLD/WARM START ADDRESS
        .BYTE   0,4             ;RUN CARTRIDGE
        .WORD   INIT            ;POWER UP START VECTOR
