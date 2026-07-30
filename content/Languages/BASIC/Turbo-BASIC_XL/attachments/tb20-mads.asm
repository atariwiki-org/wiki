      OPT ?+

;         .LI ON
;------------------------------
; TURBO-BASIC PART 1
;------------------------------
;         .LI OFF
; ZERO PAGE  System Adressen
;
LINZBS = $00
BOOT   = $09
DOSVEC = $0A
DOSINI = $0C
APPMHI = $0E
BRKKEY = $11
RTCLOK = $12
ICAX1Z = $2A
ICAX2Z = $2B
ROWCRS = $54
COLCRS = $55
DINDEX = $57
SAVMSC = $58
RAMTOP = $6A
;------------------------------
; PAGE 2 ADRESSEN
;
VDSLST = $0200
VIMIRQ = $0216
VVBLKI = $0222
COLDST = $0244
PADDL0 = $0270
COLOR0 = $02C4
COLOR1 = $02C5
COLOR2 = $02C6
RUNAD  = $02E0
INITAD = $02E2
MEMTOP = $02E5
MEMLO  = $02E7
CRSINH = $02F0
CHBAS  = $02F4
ATACHR = $02FB
CH     = $02FC
FILDAT = $02FD
DSPFLG = $02FE
;------------------------------
; IOCB 0
;
ICCOM  = $0342
ICSTA  = $0343
ICBAL  = $0344
ICBAH  = $0345
ICPTL  = $0346
ICPTH  = $0347
ICBLL  = $0348
ICBLH  = $0349
ICAX1  = $034A
ICAX2  = $034B
ICSPR  = $034C
;------------------------------
BASICF = $03F8
;------------------------------
CONSOL = $D01F
;------------------------------
RANDOM = $D20A
AUDF1  = $D200
AUDC1  = $D201
AUDCTL = $D208
SKCTL  = $D20F
;------------------------------
PORTB  = $D301
;------------------------------
NMIEN  = $D40E
NMIST  = $D40F
;------------------------------
EDITRV = $E400
KEYBDV = $E420
CIOV   = $E456
COLDSV = $E477
;Ende der System adressen
;------------------------------
;ZERO-PAGE  BASIC Adressen
;
BAS_LOMEM=$80
VNTP     =$82  ;VAR.NAMETAB.
VNTD     =$84  ;VAR.N.TAB.ENDE
VVTP     =$86  ;VAR.WERTETAB.
STMTAB   =$88  ;START BASIC PR.
STMCUR   =$8A  ;CURRENT_STATEMENT.
STARP    =$8C  ;VARFELDER
RUNSTK   =$8E  ;BASIC-STACK
BASMEMTOP=$90
MEOLFLG    =$92
ZP093    =$93
ZP094    =$94
ZP095    =$95
ZP096    =$96
ZP097    =$97
ZP098    =$98
ZP099    =$99
ZP09A    =$9A
ZP09B    =$9B
ZP09C    =$9C
ZP09D    =$9D
ZP09E    =$9E
LLNGTH   =$9F
ZP0A0    =$A0
ZP0A1    =$A1
ZP0A2    =$A2
ZP0A3    =$A3
ZP0A4    =$A4
ZP0A5    =$A5
ZP0A6    =$A6
STATE_LEN=$A7
STATE_NDX=$A8
OPSTKX   =$A9
ARSLVL   =$AA
EXSVOP   =$AB
TVSCIX   =$AC
EXSVPR    =$AD
ZP0AE    =$AE
ZP0AF    =$AF
ZP0B0    =$B0
ZP0B1    =$B1
ZP0B2    =$B2
ZP0B3    =$B3
ZP0B4    =$B4
ZP0B5    =$B5
DATA_PTR =$B6
DATAZ_PTR=$B7
ZP0B9    =$B9
STOPLN   =$BA
TRAPLN   =$BC
ZP0BE    =$BE
ZP0BF    =$BF
CIO_CMD  =$C0
CIO_KANAL=$C1
ZP0C2    =$C2
ERRSAV   =$C3
ZP0C4    =$C4
ZP0C5    =$C5
ZP0C6    =$C6
ZP0C7    =$C7
BAS_COLOR=$C8
PRINT_TAB=$C9
PROG_CLR =$CA
ZP0CB    =$CB
ZP0CC    =$CC
ZP0CD    =$CD
ZP0CE    =$CE
ZP0CF    =$CF
ZP0D0    =$D0
ZP0D1    =$D1
ZP0D2    =$D2
ZP0D3    =$D3
FR0      =$D4
ZP0DA    =$DA
ZP0DB    =$DB
ZP0DC    =$DC
ZP0DD    =$DD
ZP0DE    =$DE
ZP0DF    =$DF
FR1      =$E0
ZP0E6    =$E6
ZP0E7    =$E7
ZP0E8    =$E8
ZP0E9    =$E9
ZP0EA    =$EA
ZP0EB    =$EB
ZP0EC    =$EC
ZP0ED    =$ED
ZP0EE    =$EE
ZP0EF    =$EF
ZP0F0    =$F0
ZP0F1    =$F1
CIX      =$F2
INBUFF   =$F3
ZP0F5    =$F5
ZP0F6    =$F6
ZP0F7    =$F7
ZP0F8    =$F8
ZP0F9    =$F9
ZP0FA    =$FA
RADFLG   =$FB
ZP0FC    =$FC
ZP0FD    =$FD
ZP0FE    =$FE
ZP0FF    =$FF
;
;Ende der zero-page adressen
;------------------------------
; diverse adressen und tab.
;
; The TurboBasic XL low ram address - adjust to load in bigger DOS
TBXL_LOW_ADDRESS = $2080
; The loader for RAM under ROM parts and initialization address
TBXL_LOADER      = TBXL_LOW_ADDRESS+$80
XTAB3            = TBXL_LOADER
COMMANDS_TAB     = TBXL_LOW_ADDRESS+$180
DEVICE_NAMES     = TBXL_LOW_ADDRESS+$280
OS_RAM_ON        = TBXL_LOW_ADDRESS+$2A4
FUNCTION_TAB     = TBXL_LOW_ADDRESS+$2BA
TOP_LOADER       = $6000
OS_RAM_C0        = $C000
OS_RAM_D8        = $D800
OS_RAM_E4        = $E400
;------------------------------
ROM_ZSATZ   =$E000
; The character map of the loader - used to avoid screen flicker while loading
RAM_CHMAP   =$5C00
STACK       =$0105 ;STACK
;
XTAB1    =TBXL_LOW_ADDRESS+$A0
XTAB1_20 =XTAB1+$20
XTAB1_21 =XTAB1+$21
XTAB1_40 =XTAB1+$40
XTAB1_41 =XTAB1+$41
XTAB1_60 =XTAB1+$60
XTAB1_61 =XTAB1+$61
XTAB1_80 =XTAB1+$80
XTAB1_81 =XTAB1+$81
XTAB1_A0 =XTAB1+$A0
XTAB1_A1 =XTAB1+$A1
XTAB1_C0 =XTAB1+$C0
XTAB1_C1 =XTAB1+$C1
;
XTAB2    =COMMANDS_TAB+$CA
XTAB2_1  =XTAB2+$1  ;TAB. NACH
XTAB2_3  =XTAB2+$3  ;COMMANDSL.
XTAB2_4  =XTAB2+$4
XTAB2_6  =XTAB2+$6
XTAB2_7  =XTAB2+$7
XTAB2_8  =XTAB2+$8
XTAB2_9  =XTAB2+$9
XTAB2_B  =XTAB2+$B
XTAB2_C  =XTAB2+$C
XTAB2_E  =XTAB2+$E
XTAB2_F  =XTAB2+$F
XTAB2_10 =XTAB2+$10
XTAB2_11 =XTAB2+$11
XTAB2_13 =XTAB2+$13
XTAB2_14 =XTAB2+$14
XTAB2_16 =XTAB2+$16
XTAB2_17 =XTAB2+$17
XTAB2_18 =XTAB2+$18
XTAB2_19 =XTAB2+$19
XTAB2_1B =XTAB2+$1B
XTAB2_1C =XTAB2+$1C
XTAB2_1E =XTAB2+$1E
XTAB2_1F =XTAB2+$1F
XTAB2_20 =XTAB2+$20
XTAB2_21 =XTAB2+$21
XTAB2_23 =XTAB2+$23
XTAB2_24 =XTAB2+$24
XTAB2_26 =XTAB2+$26
XTAB2_27 =XTAB2+$27
XTAB2_28 =XTAB2+$28
XTAB2_29 =XTAB2+$29
XTAB2_2B =XTAB2+$2B
XTAB2_2C =XTAB2+$2C
XTAB2_2E =XTAB2+$2E
XTAB2_2F =XTAB2+$2F
;
ADR_480  =$480
ADR_481  =$481
ADR_482  =$482
ADR_483  =$483
;
ADR_500  =$500
ADR_501  =$501
ADR_57F  =$57F
ADR_580  =$580
ADR_581  =$581
ADR_58C  =$58C
ADR_58D  =$58D
ADR_5C0  =$5C0
ADR_5C8  =$5C8
ADR_5E0  =$5E0
ADR_5E1  =$5E1
ADR_5E2  =$5E2
ADR_5E3  =$5E3
ADR_5E4  =$5E4
ADR_5E5  =$5E5
ADR_5E6  =$5E6
ADR_5E7  =$5E7
ADR_5E8  =$5E8
ADR_5E9  =$5E9
ADR_5EA  =$5EA
ADR_5EB  =$5EB
ADR_5EC  =$5EC
ADR_5ED  =$5ED
ADR_5EE  =$5EE
ADR_5EF  =$5EF
ADR_5F0  =$5F0
ADR_5F1  =$5F1



;
; L0758 +L0776  ; NACH RESET
;
NMI_VEC  =$FFFA
IRQ_VEC  =$FFFE
;------------------------------
       ORG TBXL_LOADER
;
         LDX #$00
VORLAD1  LDA ROM_ZSATZ,X
         STA RAM_CHMAP ,X
         LDA ROM_ZSATZ+$100,X
         STA RAM_CHMAP +$100,X
         LDA ROM_ZSATZ+$200,X
         STA RAM_CHMAP +$200,X
         LDA ROM_ZSATZ+$300,X
         STA RAM_CHMAP +$300,X
         INX
         BNE VORLAD1
         LDA #$20
         STA COLOR2
         LDA #$5C
         STA COLOR1
         STA CRSINH
         LDA #>RAM_CHMAP 
         STA CHBAS
         LDA #<INFOTEXT_A
         STA ICBAL
         LDA #>INFOTEXT_A
         STA ICBAH
         LDA #<[INFOTEXT_E-INFOTEXT_A]
         STA ICBLL
         STX ICBLH
         LDA #$0B
         STA ICCOM
         JSR CIOV
         STX CRSINH
         RTS
;------------------------------
INFOTEXT_A
     .BY $7D,$9B,$9B,$7F,$20,$20,$20
     .BYTE 'TURBO-BASIC XL 2.0'
     .BY $9B,$9B,$7F,$20,$20,$20
     .BYTE 'Update von (12/90)'
     .BY $9B
INFOTEXT_E
;------------------------------
; INITPROGRAMM STARTEN
;
       ORG INITAD
;
       .WORD TBXL_LOADER
;------------------------------
; ROUTINE NACH RESET
;
       ORG TBXL_LOW_ADDRESS
;
RESET_VEC   LDA #<RESET_VEC
            LDY #>RESET_VEC
            STA DOSINI
            STY DOSINI+1
            LDA #$FF
            STA PORTB
DOS_ADR_SAV JSR $FFFF   ;DUMMY
            LDA #$FE
            STA PORTB
            LDA BAS_LOMEM
            LDY BAS_LOMEM+1
            STA MEMLO
            STY MEMLO+1
            JMP L0031
L0758
;
L0776    =L0758+1
;------------------------------
; JUMP TABLE. FOR COMMANDS LIST
;
          ORG COMMANDS_TAB;
         .WORD REM_CMD
         .WORD DATA_CMD
         .WORD INPUT_CMD
         .WORD COLOR_CMD
         .WORD LIST_CMD
         .WORD ENTER_CMD
         .WORD LET_CMD
         .WORD IF_CMD
         .WORD FOR_CMD
         .WORD NEXT_CMD
         .WORD GOTO_CMD
         .WORD GOTO_CMD
         .WORD GOSUB_CMD
         .WORD TRAP_CMD
         .WORD BYE_CMD
         .WORD CONT_CMD
         .WORD COM_CMD
         .WORD CLOSE_CMD
         .WORD CLR_CMD
         .WORD DEG_CMD
         .WORD DIM_CMD
         .WORD END_CMD
         .WORD NEW_CMD
         .WORD OPEN_CMD
         .WORD LOAD_CMD
         .WORD SAVE_CMD
         .WORD STATUS_CMD
         .WORD NOTE_CMD
         .WORD POINT_CMD
         .WORD XIO_CMD
         .WORD ON_CMD
         .WORD POKE_CMD
         .WORD PRINT_CMD
         .WORD RAD_CMD
         .WORD READ_CMD
         .WORD RESTORE_CMD
         .WORD RETURN_CMD
         .WORD RUN_CMD
         .WORD STOP_CMD
         .WORD POP_CMD
         .WORD PRINT_CMD
         .WORD GET_CMD
         .WORD PUT_CMD
         .WORD GRAPHICS_CMD
         .WORD PLOT_CMD
         .WORD POSITION_CMD
         .WORD DOS_CMD
         .WORD DRAWTO_CMD
         .WORD SETCOLOR_CMD
         .WORD LOCATE_CMD
         .WORD SOUND_CMD
         .WORD LPRINT_CMD
         .WORD CSAVE_CMD
         .WORD CLOAD_CMD
         .WORD LET_CMD
         .WORD ERROR_LINE
         .WORD DPOKE_CMD
         .WORD MOVE_CMD
         .WORD MOVE_NEG_CMD
         .WORD FOR_CTRL_CMD
         .WORD REPEAT_CMD
         .WORD UNTIL_CMD
         .WORD WHILE_CMD
         .WORD WEND_CMD
         .WORD ELSE_CMD
         .WORD ENDIF_CMD
         .WORD BPUT_CMD
         .WORD BGET_CMD
         .WORD FILLTO_CMD
         .WORD DO_CMD
         .WORD LOOP_CMD
         .WORD EXIT_CMD
         .WORD DIR_CMD
         .WORD LOCK_CMD
         .WORD UNLOCK_CMD
         .WORD RENAME_CMD
         .WORD DELETE_CMD
         .WORD PAUSE_CMD
         .WORD TIMES_CMD
         .WORD PROC_CMD
         .WORD EXEC_CMD
         .WORD ENDPROC_CMD
         .WORD FCOLOR_CMD
         .WORD LIST_CTRL_CMD
         .WORD MINUS_LINE
         .WORD RENUM_CMD
         .WORD DEL_CMD
         .WORD DUMP_CMD
         .WORD TRACE_CMD
         .WORD TEXT_CMD
         .WORD BLOAD_CMD
         .WORD BRUN_CMD
         .WORD GO_NR_CMD
         .WORD GO_MARKE
         .WORD BRK_CTRL_CMD
         .WORD PAINT_CMD
         .WORD CLS_CMD
         .WORD DSOUND_CMD
         .WORD CIRCLE_CMD
         .WORD PUTFL_CMD
         .WORD GETFL_CMD


;
;------------------------------
       ORG DEVICE_NAMES
;
DISKWILD_NAME .BYTE 'D:*.*',$9B
SCREEN_NAME   .BYTE 'S:',$9B
CASSETTE_NAME .BYTE 'C:',$9B
PRINTER_NAME  .BYTE 'P:',$9B
OBJ_RUN_FLAG
;------------------------------
; RAM UNTERM O.S EINSCHALTEN
;
       ORG OS_RAM_ON
;
       LDA PORTB
       AND #$FC
       ORA #$02
       STA PORTB
       RTS
;------------------------------
; JUMP TABLE. FOR FUNCTIONS LIST
;
          ORG FUNCTION_TAB
;
         .WORD KL_GL_FUN
         .WORD KL_GR_FUN
         .WORD GR_GL_FUN
         .WORD KLEIN_FUN
         .WORD GR_FUN
         .WORD GL_FUN
         .WORD POWER_FUN
         .WORD MULTIPL_FUN
         .WORD ADDIT_FUN
         .WORD SUBTR_FUN
         .WORD DIVIS_FUN
         .WORD NOT_FUN
         .WORD OR_FUN
         .WORD AND_FUN
         .WORD Y0008
         .WORD Y0126
         .WORD X_FPASIGN
         .WORD Y0128
         .WORD KL_GL_FUN
         .WORD KL_GR_FUN
         .WORD GR_GL_FUN
         .WORD KLEIN_FUN
         .WORD GR_FUN
         .WORD GL_FUN
         .WORD Y0008
         .WORD Y0129
         .WORD Y0130
         .WORD Y0131
         .WORD Y0132
         .WORD Y0126
         .WORD Y0132
         .WORD Y0133
         .WORD STR_FUN
         .WORD CHR_FUN
         .WORD USR_FUN
         .WORD ASC_FUN
         .WORD VAL_FUN
         .WORD LEN_FUN
         .WORD ADR_FUN
         .WORD ATN_FUN
         .WORD COS_FUN
         .WORD PEEK_FUN
         .WORD SIN_FUN
         .WORD RND_KL_FUN
         .WORD FRE_FUN
         .WORD EXP_FUN
         .WORD LOG_FUN
         .WORD CLOG_FUN
         .WORD SQR_FUN
         .WORD SGN_FUN
         .WORD ABS_FUN
         .WORD INT_FUN
         .WORD PADDLE_FUN
         .WORD STICK_FUN
         .WORD PTRIG_FUN
         .WORD STRIG_FUN
         .WORD DPEEK_FUN
         .WORD AND_BIN_FUN
         .WORD OR_BIN_FUN
         .WORD INSTR_FUN
         .WORD INKEY_FUN
         .WORD EXOR_BIN_FUN
         .WORD HEX_FUN
         .WORD DEC_FUN
         .WORD DIV_FUN
         .WORD FRAC_FUN
         .WORD TIMES_FUN
         .WORD TIME_FUN
         .WORD MOD_FUN
         .WORD ON_EXEC_FUN
         .WORD RND_FUN
         .WORD RAND_FUN
         .WORD TRUNC_FUN
L0441    .WORD NULL_FUN
         .WORD EINS_FUN
         .WORD ZWEI_FUN
         .WORD DREI_FUN
         .WORD ON_GO_FUN
         .WORD UINSTR_FUN
         .WORD ERR_FUN
         .WORD ERL_FUN
;  AB HIER $23DC
       .BY $00,$00,$00,$00
       .BY $00,$00,$00,$00,$00,$00,$00,$00
       .BY $00,$20,$20,$20,$20,$20,$20,$2C
       .BY $28,$22,$22,$28,$1E,$1A,$1C,$32
       .BY $04,$32,$32,$30,$30,$30,$30,$30
       .BY $30,$2E,$2E,$32,$32,$32,$32,$32
       .BY $04,$32,$32,$32,$32,$32,$32,$32
       .BY $32,$32,$32,$32,$32,$32,$32,$32
       .BY $32,$32,$32,$32,$32,$32,$32,$32
       .BY $32,$32,$2A,$2A,$32,$32,$2A,$32
       .BY $32,$26
L0931  .BY $32,$32,$32,$24,$00,$32
       .BY $32,$32,$32,$32,$32,$32,$00,$32
       .BY $32,$32,$00,$00,$00,$00,$00,$00
       .BY $00,$00,$00,$00,$00,$00,$00,$20
       .BY $20,$20,$20,$20,$20,$2C,$28,$22
       .BY $22,$28,$1D,$1A,$1C,$02,$30,$01
       .BY $01,$30,$30,$30,$30,$30,$30,$2D
       .BY $2D,$02,$02,$02,$02,$02,$03,$02
       .BY $02,$02,$02,$02,$02,$02,$02,$02
       .BY $02,$02,$02,$02,$02,$02,$02,$02
       .BY $02,$02,$02,$02,$02,$02,$02,$02
       .BY $2A,$2A,$02,$32,$2A,$02,$02,$28
       .BY $02,$32,$32,$28,$00,$32,$02,$02
       .BY $32,$32,$32,$32,$00,$02,$32,$32
;
;------------------------------
; O.S ON AND CALL CIO
;
CIO_JUMP     INC PORTB
             JSR CIOV
             DEC PORTB
             CPY #$00
REM_CMD
DATA_CMD
MINUS_LINE
GO_MARKE
ON_EXEC_FUN
ON_GO_FUN
Y0008        RTS
;------------------------------
;  NMI +IRQ ABSCHLUSS
;
NMI_END  PLA
         TAX
IRQ_END  DEC PORTB
         PLA
         RTI
;------------------------------
; NMI CALL 
;
NMI_CALL   BIT NMIST
           BPL NO_NMI_DLI
           JMP (VDSLST) ; DLI
NO_NMI_DLI
           PHA
           TXA
           PHA
           LDA #>NMI_END
           PHA
           LDA #<NMI_END
           PHA
           TSX
           LDA STACK,X ;STACK
           PHA
           CLD
           PHA
           TXA
           PHA
           TYA
           PHA
           INC PORTB
           STA NMIST
           JMP (VVBLKI)
;------------------------------
; IRQ AUFRUFEN
;
IRQ_AUFRUF PHA
           LDA #>IRQ_END
           PHA
           LDA #<IRQ_END
           PHA
           PHP
           INC PORTB
           JMP (VIMIRQ)
;------------------------------
; BYTE AN DEVICE UEBERGEBEN
;
PUTBYTE  INC PORTB
         JSR ?L1
         DEC PORTB
         RTS
;
?L1      LDA ICPTH,X
         PHA
         LDA ICPTL,X
         PHA
         TYA
         LDY #$5C
         RTS
;------------------------------
; BYTE VON DER TASTATUR LESEN
;
GETKEY     INC PORTB
GETKEY_VEC JSR $FFFF ; DUMMY
           DEC PORTB
           RTS
;------------------------------
;***          DOS         ***
DOS_CMD    JSR SOUND_OFF
           INC PORTB
           LDA DOS_ADR_SAV+1
           STY DOS_ADR_SAV+2
           STA DOSINI
           STY DOSINI+1           
           JMP (DOSVEC) 

;***          BYE         ***
BYE_CMD  JSR IO_CL_ALL
         INC PORTB
         JMP COLDSV
;------------------------------
;***         DPEEK        ***
DPEEK_FUN  JSR L0115
           INC PORTB
           LDY #$01
           LDA (FR0),Y
           TAX
           DEY
           LDA (FR0),Y
           DEC PORTB
           STA FR0
           STX FR0+1
           JMP L0118
;------------------------------
;***         DPOKE        ***
DPOKE_CMD  JSR L0119
           INC PORTB
           LDY #$00
           STA (ZP09B),Y
           LDA FR0+1
           INY
           BNE DPOKE_1
ERROR3_1   JMP ERROR_3
;***         POKE        ***
POKE_CMD   JSR L0119
           BNE ERROR3_1
           INC PORTB
DPOKE_1    STA (ZP09B),Y
           JMP OS_RAM_ON
;------------------------------
;***         USR          ***
USR_FUN
         JSR ?L1
         JSR L0124
         JMP L0125
?L1      LDA #>[OS_RAM_ON-1]
         PHA
         LDA #<[OS_RAM_ON-1]
         PHA
         LDA ZP0B0
         STA ZP0C6
?L2      JSR L0115
         DEC ZP0C6
         BMI ?L3
         LDA FR0
         PHA
         LDA FR0+1
         PHA
         JMP ?L2
?L3      INC PORTB
         LDA ZP0B0
         PHA
         JMP (FR0)
;------------------------------
; ENDE PART 1
;------------------------------

;         .LI ON
;------------------------------
; TURBO-BASIC PART 2
;------------------------------
;         .LI OFF
;------------------------------
ERROR2_1   JMP ERROR2_2
L0468      LDA #$00
L0703      STY ZP0A4
           STA ZP0A5
           CLC
           LDA BASMEMTOP
           ADC ZP0A4
           TAY
           LDA BASMEMTOP+1
           ADC ZP0A5
           CMP MEMTOP+1
           BCC ?L1
           BNE ERROR2_1
           CPY MEMTOP
           BCC ?L1
           BNE ERROR2_1
?L1        SEC
           LDA BASMEMTOP
           SBC LINZBS,X
           STA ZP0A2
           LDA BASMEMTOP+1
           SBC LINZBS+1,X
           STA ZP0A3
           CLC
           LDA LINZBS,X
           STA ZP097
           STA ZP099
           ADC ZP0A4
           STA ZP09B
           LDA LINZBS+1,X
           STA ZP098
           STA ZP09A
           ADC ZP0A5
           STA ZP09C
?L2        LDA LINZBS,X
           ADC ZP0A4
           STA LINZBS,X
           LDA LINZBS+1,X
           ADC ZP0A5
           STA LINZBS+1,X
           INX
           INX
           CPX #$92
           BCC ?L2
           STA APPMHI+1
           LDA BASMEMTOP
           STA APPMHI
MOVE_D_SUB INC PORTB
           LDX ZP0A3
           CLC
           TXA
           ADC ZP09A
           STA ZP09A
           CLC
           TXA
           ADC ZP09C
           STA ZP09C
           INX
           LDY ZP0A2
           BEQ ?L4
?L1        DEY
           LDA (ZP099),Y
           STA (ZP09B),Y
           TYA
           BNE ?L1
           BEQ ?L4
?L2        DEC ZP09A
           DEC ZP09C
?L3        DEY
           LDA (ZP099),Y
           STA (ZP09B),Y
           DEY
           LDA (ZP099),Y
           STA (ZP09B),Y
           DEY
           LDA (ZP099),Y
           STA (ZP09B),Y
           DEY
           LDA (ZP099),Y
           STA (ZP09B),Y
           TYA
           BNE ?L3
?L4        DEX
           BNE ?L2
           DEC PORTB
           RTS
L0495      LDA #$00
L0979      STY ZP0A4
           STA ZP0A5
           SEC
           LDA BASMEMTOP
           SBC LINZBS,X
           STA ZP0A2
           LDA BASMEMTOP+1
           SBC LINZBS+1,X
           STA ZP0A3
           SEC
           LDA LINZBS,X
           STA ZP099
           SBC ZP0A4
           STA ZP09B
           LDA LINZBS+1,X
           STA ZP09A
           SBC ZP0A5
           STA ZP09C
?L1        SEC
           LDA LINZBS,X
           SBC ZP0A4
           STA LINZBS,X
           LDA LINZBS+1,X
           SBC ZP0A5
           STA LINZBS+1,X
           INX
           INX
           CPX #$92
           BCC ?L1
           STA APPMHI+1
           LDA BASMEMTOP
           STA APPMHI
MOVE_SUB   INC PORTB
           LDY #$00
           LDX ZP0A3
           BEQ ?L2
?L1        LDA (ZP099),Y
           STA (ZP09B),Y
           INY
           LDA (ZP099),Y
           STA (ZP09B),Y
           INY
           LDA (ZP099),Y
           STA (ZP09B),Y
           INY
           LDA (ZP099),Y
           STA (ZP09B),Y
           INY
           BNE ?L1
           INC ZP09A
           INC ZP09C
           DEX
           BNE ?L1
?L2        LDX ZP0A2
           BEQ ?L4
?L3        LDA (ZP099),Y
           STA (ZP09B),Y
           INY
           DEX
           BNE ?L3
?L4        DEC PORTB
           RTS
L0150      CLC
           JMP CLEAR_FR0
L0149      CLC
           RTS
L0152      SEC
           RTS
L0311      JSR FR0_TO_FR1
L0287      LDA FR0
           BEQ L0149
           LDA FR1
           BEQ L0150
           EOR FR0
           AND #$80
           STA ZP0EE
           LDA FR1
           AND #$7F
           STA FR1
           LDA FR0
           AND #$7F
           SEC
           SBC #$40
           SEC
           ADC FR1
           BMI L0152
           ORA ZP0EE
           TAY
           JSR L0153
           STA ZP0DA
           STA ZP0DB
           STA ZP0DC
           STA ZP0DD
           STA ZP0DE
           STA ZP0DF
           STY FR0
           LDY #$07
?L1        LSR FR1+5
           BCC ?L2
           CLC
           LDA ZP0DE
           ADC XTAB2_28,Y
           STA ZP0DE
           LDA ZP0DD
           ADC XTAB2_20,Y
           STA ZP0DD
           LDA ZP0DC
           ADC XTAB2_18,Y
           STA ZP0DC
           LDA ZP0DB
           ADC XTAB2_10,Y
           STA ZP0DB
           LDA ZP0DA
           ADC XTAB2_8,Y
           STA ZP0DA
           LDA FR0+5
           ADC XTAB2,Y
           STA FR0+5
           DEY
           BPL ?L1
           BMI ?L3
?L2        BEQ ?L3
           DEY
           BPL ?L1
?L3        LDY #$07
L0167      LSR FR1+4
           BCC ?L5
           CLC
           LDA ZP0DD
           ADC XTAB2_28,Y
           STA ZP0DD
           LDA ZP0DC
           ADC XTAB2_20,Y
           STA ZP0DC
           LDA ZP0DB
           ADC XTAB2_18,Y
           STA ZP0DB
           LDA ZP0DA
           ADC XTAB2_10,Y
           STA ZP0DA
           LDA FR0+5
           ADC XTAB2_8,Y
           STA FR0+5
           LDA FR0+4
           ADC XTAB2,Y
           STA FR0+4
           DEY
           BPL L0167
           BMI ?L6
?L5        BEQ ?L6
           DEY
           BPL L0167
?L6        LDY #$07
?L7        LSR FR1+3
           BCC ?L8
           CLC
           LDA ZP0DC
           ADC XTAB2_28,Y
           STA ZP0DC
           LDA ZP0DB
           ADC XTAB2_20,Y
           STA ZP0DB
           LDA ZP0DA
           ADC XTAB2_18,Y
           STA ZP0DA
           LDA FR0+5
           ADC XTAB2_10,Y
           STA FR0+5
           LDA FR0+4
           ADC XTAB2_8,Y
           STA FR0+4
           LDA FR0+3
           ADC XTAB2,Y
           STA FR0+3
           DEY
           BPL ?L7
           BMI ?L9
?L8        BEQ ?L9
           DEY
           BPL ?L7
?L9        LDY #$07
L0177      LSR FR1+2
           BCC ?L11
           CLC
           LDA ZP0DB
           ADC XTAB2_28,Y
           STA ZP0DB
           LDA ZP0DA
           ADC XTAB2_20,Y
           STA ZP0DA
           LDA FR0+5
           ADC XTAB2_18,Y
           STA FR0+5
           LDA FR0+4
           ADC XTAB2_10,Y
           STA FR0+4
           LDA FR0+3
           ADC XTAB2_8,Y
           STA FR0+3
           LDA FR0+2
           ADC XTAB2,Y
           STA FR0+2
           DEY
           BPL L0177
           BMI ?L12
?L11       BEQ ?L12
           DEY
           BPL L0177
?L12       LDY #$07
?L13       LSR FR1+1
           BCC ?L14
           CLC
           LDA ZP0DA
           ADC XTAB2_28,Y
           STA ZP0DA
           LDA FR0+5
           ADC XTAB2_20,Y
           STA FR0+5
           LDA FR0+4
           ADC XTAB2_18,Y
           STA FR0+4
           LDA FR0+3
           ADC XTAB2_10,Y
           STA FR0+3
           LDA FR0+2
           ADC XTAB2_8,Y
           STA FR0+2
           LDA FR0+1
           ADC XTAB2,Y
           STA FR0+1
           DEY
           BPL ?L13
           BMI ?L15
?L14       BEQ ?L15
           DEY
           BPL ?L13
?L15       JMP L0183
L0185      CLC
           RTS
L0184      SEC
           RTS
L0317      LDA FR1
           BEQ L0184
           LDA FR0
           BEQ L0185
           EOR FR1
           AND #$80
           STA ZP0EE
           LDA FR1
           AND #$7F
           STA FR1
           LDA FR0
           AND #$7F
           SEC
           SBC FR1
           CLC
           ADC #$40
           BMI L0184
           ORA ZP0EE
           TAY
           JSR L0153
           STA ZP0E6
           STA ZP0E7
           STA ZP0E8
           STA ZP0E9
           STA ZP0EA
           STA FR1
           STA ZP0DA
           STY FR0
           LDY #$00
?L1        LDA FR1
           CMP XTAB2,Y
           BNE ?L2   
           LDA FR1+1
           CMP XTAB2_8,Y
           BNE ?L2   
           LDA FR1+2
           CMP XTAB2_10,Y
           BNE ?L2   
           LDA FR1+3
           CMP XTAB2_18,Y
           BNE ?L2   
           LDA FR1+4
           CMP XTAB2_20,Y
           BNE ?L2   
           LDA FR1+5
           CMP XTAB2_28,Y
           BNE ?L2   
           LDX #$00
           JMP L0192
?L2        BCC ?L3   
           LDA FR1+5
           SBC XTAB2_28,Y
           STA FR1+5
           LDA FR1+4
           SBC XTAB2_20,Y
           STA FR1+4
           LDA FR1+3
           SBC XTAB2_18,Y
           STA FR1+3
           LDA FR1+2
           SBC XTAB2_10,Y
           STA FR1+2
           LDA FR1+1
           SBC XTAB2_8,Y
           STA FR1+1
           LDA FR1
           SBC XTAB2,Y
           STA FR1
?L3        ROL FR0+1
           INY
           CPY #$08
           BNE ?L1   
           LDY #$00
L0197      LDA FR1+1
           CMP XTAB2,Y
           BNE ?L5   
           LDA FR1+2
           CMP XTAB2_8,Y
           BNE ?L5   
           LDA FR1+3
           CMP XTAB2_10,Y
           BNE ?L5   
           LDA FR1+4
           CMP XTAB2_18,Y
           BNE ?L5   
           LDA FR1+5
           CMP XTAB2_20,Y
           BNE ?L5   
           LDA ZP0E6
           CMP XTAB2_28,Y
           BNE ?L5   
           LDX #$01
           JMP L0192
?L5        BCC ?L6   
           LDA ZP0E6
           SBC XTAB2_28,Y
           STA ZP0E6
           LDA FR1+5
           SBC XTAB2_20,Y
           STA FR1+5
           LDA FR1+4
           SBC XTAB2_18,Y
           STA FR1+4
           LDA FR1+3
           SBC XTAB2_10,Y
           STA FR1+3
           LDA FR1+2
           SBC XTAB2_8,Y
           STA FR1+2
           LDA FR1+1
           SBC XTAB2,Y
           STA FR1+1
?L6        ROL FR0+2
           INY
           CPY #$08
           BNE L0197
           LDY #$00
L0200      LDA FR1+2
           CMP XTAB2,Y
           BNE ?L8   
           LDA FR1+3
           CMP XTAB2_8,Y
           BNE ?L8   
           LDA FR1+4
           CMP XTAB2_10,Y
           BNE ?L8   
           LDA FR1+5
           CMP XTAB2_18,Y
           BNE ?L8   
           LDA ZP0E6
           CMP XTAB2_20,Y
           BNE ?L8   
           LDA ZP0E7
           CMP XTAB2_28,Y
           BNE ?L8   
           LDX #$02
           JMP L0192
?L8        BCC ?L9   
           LDA ZP0E7
           SBC XTAB2_28,Y
           STA ZP0E7
           LDA ZP0E6
           SBC XTAB2_20,Y
           STA ZP0E6
           LDA FR1+5
           SBC XTAB2_18,Y
           STA FR1+5
           LDA FR1+4
           SBC XTAB2_10,Y
           STA FR1+4
           LDA FR1+3
           SBC XTAB2_8,Y
           STA FR1+3
           LDA FR1+2
           SBC XTAB2,Y
           STA FR1+2
?L9        ROL FR0+3
           INY
           CPY #$08
           BNE L0200
           LDY #$00
L0203      LDA FR1+3
           CMP XTAB2,Y
           BNE ?L11
           LDA FR1+4
           CMP XTAB2_8,Y
           BNE ?L11
           LDA FR1+5
           CMP XTAB2_10,Y
           BNE ?L11
           LDA ZP0E6
           CMP XTAB2_18,Y
           BNE ?L11
           LDA ZP0E7
           CMP XTAB2_20,Y
           BNE ?L11
           LDA ZP0E8
           CMP XTAB2_28,Y
           BNE ?L11
           LDX #$03
           JMP L0192
?L11       BCC ?L12
           LDA ZP0E8
           SBC XTAB2_28,Y
           STA ZP0E8
           LDA ZP0E7
           SBC XTAB2_20,Y
           STA ZP0E7
           LDA ZP0E6
           SBC XTAB2_18,Y
           STA ZP0E6
           LDA FR1+5
           SBC XTAB2_10,Y
           STA FR1+5
           LDA FR1+4
           SBC XTAB2_8,Y
           STA FR1+4
           LDA FR1+3
           SBC XTAB2,Y
           STA FR1+3
?L12       ROL FR0+4
           INY
           CPY #$08
           BNE L0203
           LDY #$00
L0206      LDA FR1+4
           CMP XTAB2,Y
           BNE ?L14
           LDA FR1+5
           CMP XTAB2_8,Y
           BNE ?L14
           LDA ZP0E6
           CMP XTAB2_10,Y
           BNE ?L14
           LDA ZP0E7
           CMP XTAB2_18,Y
           BNE ?L14
           LDA ZP0E8
           CMP XTAB2_20,Y
           BNE ?L14
           LDA ZP0E9
           CMP XTAB2_28,Y
           BNE ?L14
           LDX #$04
           JMP L0192
?L14       BCC L0205
           LDA ZP0E9
           SBC XTAB2_28,Y
           STA ZP0E9
           LDA ZP0E8
           SBC XTAB2_20,Y
           STA ZP0E8
           LDA ZP0E7
           SBC XTAB2_18,Y
           STA ZP0E7
           LDA ZP0E6
           SBC XTAB2_10,Y
           STA ZP0E6
           LDA FR1+5
           SBC XTAB2_8,Y
           STA FR1+5
           LDA FR1+4
           SBC XTAB2,Y
           STA FR1+4
L0205      ROL FR0+5
           INY
           CPY #$08
           BNE L0206
           LDA FR0+1
           BNE L0207
           LDY #$00
?L16       LDA FR1+5
           CMP XTAB2,Y
           BNE ?L17
           LDA ZP0E6
           CMP XTAB2_8,Y
           BNE ?L17
           LDA ZP0E7
           CMP XTAB2_10,Y
           BNE ?L17
           LDA ZP0E8
           CMP XTAB2_18,Y
           BNE ?L17
           LDA ZP0E9
           CMP XTAB2_20,Y
           BNE ?L17
           LDA ZP0EA
           CMP XTAB2_28,Y
           BNE ?L17
           LDX #$05
           JMP L0192
?L17       BCC ?L18
           LDA ZP0EA
           SBC XTAB2_28,Y
           STA ZP0EA
           LDA ZP0E9
           SBC XTAB2_20,Y
           STA ZP0E9
           LDA ZP0E8
           SBC XTAB2_18,Y
           STA ZP0E8
           LDA ZP0E7
           SBC XTAB2_10,Y
           STA ZP0E7
           LDA ZP0E6
           SBC XTAB2_8,Y
           STA ZP0E6
           LDA FR1+5
           SBC XTAB2,Y
           STA FR1+5
?L18       ROL ZP0DA
           INY
           CPY #$08
           BNE ?L16
L0207      JMP L0183
;------------------------------
L0192  ROL FR0+1,X
       INY
       CPY #$08
       BNE L0192
       BEQ L0207  
L0153  SED
       CLC
       LDA FR1+5
       STA XTAB2_2F
       ADC FR1+5
       STA XTAB2_2E
       LDA FR1+4
       STA XTAB2_27
       ADC FR1+4
       STA XTAB2_26
       LDA FR1+3
       STA XTAB2_1F
       ADC FR1+3
       STA XTAB2_1E
       LDA FR1+2
       STA XTAB2_17
       ADC FR1+2
       STA XTAB2_16
       LDA FR1+1
       STA XTAB2_F
       ADC FR1+1
       STA XTAB2_E
       LDA #$00
       STA XTAB2_7
       ADC #$00
       STA XTAB2_6
       LDX #$02
?L1    LDA XTAB2_2C,X
       ADC XTAB2_2C,X
       STA XTAB2_2B,X
       LDA XTAB2_24,X
       ADC XTAB2_24,X
       STA XTAB2_23,X
       LDA XTAB2_1C,X
       ADC XTAB2_1C,X
       STA XTAB2_1B,X
       LDA XTAB2_14,X
       ADC XTAB2_14,X
       STA XTAB2_13,X
       LDA XTAB2_C,X
       ADC XTAB2_C,X
       STA XTAB2_B,X
       LDA XTAB2_4,X
       ADC XTAB2_4,X
       STA XTAB2_3,X
       DEX
       BNE ?L1   
       LDA XTAB2_2E
       ADC XTAB2_2C
       STA XTAB2_2B
       LDA XTAB2_26
       ADC XTAB2_24
       STA XTAB2_23
       LDA XTAB2_1E
       ADC XTAB2_1C
       STA XTAB2_1B
       LDA XTAB2_16
       ADC XTAB2_14
       STA XTAB2_13
       LDA XTAB2_E
       ADC XTAB2_C
       STA XTAB2_B
       LDA XTAB2_6
       ADC XTAB2_4
       STA XTAB2_3
       LDX #$02
?L2    LDA XTAB2_29,X
       ADC XTAB2_29,X
       STA XTAB2_28,X
       LDA XTAB2_21,X
       ADC XTAB2_21,X
       STA XTAB2_20,X
       LDA XTAB2_19,X
       ADC XTAB2_19,X
       STA XTAB2_18,X
       LDA XTAB2_11,X
       ADC XTAB2_11,X
       STA XTAB2_10,X
       LDA XTAB2_9,X
       ADC XTAB2_9,X
       STA XTAB2_8,X
       LDA XTAB2_1,X
       ADC XTAB2_1,X
       STA XTAB2,X
       DEX
       BPL ?L2   
       LDA FR0+1
       STA FR1+1
       LDA FR0+2
       STA FR1+2
       LDA FR0+3
       STA FR1+3
       LDA FR0+4
       STA FR1+4
       LDA FR0+5
       STA FR1+5
;       LDX #5
;COPY_FR0_FR1_LOOP
;      LDA FR0,X
;      STA FR1,X
;      DEX
;      BNE COPY_FR0_FR1_LOOP
;------------------------------
CLEAR_FR0  LDA #$00
           STA FR0+0
           STA FR0+1
           STA FR0+2
           STA FR0+3
           STA FR0+4
           STA FR0+5
           RTS



;------------------------------
; ENDE PART 2
;------------------------------

;         .LI ON
;------------------------------
; TURBO-BASIC PART 3
;------------------------------
;         .LI OFF
SET_INBUFF_580  LDA #>ADR_580
                STA INBUFF+1
                LDA #<ADR_580
                STA INBUFF
                RTS
;------------------------------
CALL_ASC_SUCH  INC PORTB
               JSR $DBA1 ; ROM
               DEC PORTB
               RTS
;------------------------------
CALL_FP_ASC  INC PORTB
             JSR $D8E6 ; ROM
             DEC PORTB
             RTS
;------------------------------
CALL_ASC_FP  INC PORTB
             JSR $D800 ; ROM
             DEC PORTB
             RTS
;------------------------------
Y1199  LDY CIX
       LDA (INBUFF),Y
       SEC
       SBC #$30
       CMP #$0A
       RTS
;------------------------------
L0124  LDY FR0
       LDA FR0+1
       STA ZP0F7
       JSR CLEAR_FR0
       SED
       TYA
       BEQ ?L5   
       LSR
       LSR
       LSR
       LSR
       STA ZP0F8
       TYA
       AND #$07
       LDY #$00
       BCC ?L1   
       ADC #$07
?L1    LSR ZP0F8
       BCC ?L2   
       ADC #$15
?L2    LSR ZP0F8
       BCC ?L3   
       ADC #$31
?L3    LSR ZP0F8
       BCC ?L4   
       ADC #$63
       BCC ?L4   
       INY
?L4    LSR ZP0F8
       BCC ?L5   
       ADC #$27
       INY
       BCC ?L5   
       INY
?L5    LDX ZP0F7
       BEQ L0254
       LSR ZP0F7
       BCC ?L6   
       ADC #$55
       INY
       INY
       BCC ?L6   
       INY
?L6    LSR ZP0F7
       BCC ?L7   
       ADC #$11
       TAX
       TYA
       ADC #$05
       TAY
       TXA
?L7    LSR ZP0F7
       BCC ?L8   
       ADC #$23
       TAX
       TYA
       ADC #$10
       TAY
       TXA
?L8    LSR ZP0F7
       BCC L0258
       ADC #$47
       TAX
       TYA
       ADC #$20
       TAY
       TXA
L0258  LSR ZP0F7
       BCC ?L10  
       ADC #$95
       TAX
       TYA
       ADC #$40
       TAY
       TXA
?L10   LSR ZP0F7
       BCC ?L11  
       ADC #$91
       TAX
       TYA
       ADC #$81
       TAY
       TXA
       BCC ?L11  
       INC FR0+1
?L11   LSR ZP0F7
       BCC ?L12  
       ADC #$83
       TAX
       TYA
       ADC #$63
       TAY
       LDA FR0+1
       ADC #$01
       STA FR0+1
       TXA
?L12   LSR ZP0F7
       BCC L0254
       ADC #$67
       TAX
       TYA
       ADC #$27
       TAY
       LDA FR0+1
       ADC #$03
       STA FR0+1
       TXA
L0254  STY FR0+2
       STA FR0+3
       LDA #$42
       STA FR0
       JMP L0262
L0263  CLC
       RTS
L0320  LDA FR1
       EOR #$80
       STA FR1
L0265  LDA FR1
       AND #$7F
       BEQ L0263
       STA ZP0F7
       LDA FR0
       AND #$7F
       SEC
       SBC ZP0F7
       BCS ?L1   
       LDA FR0
       LDY FR1
       STA FR1
       STY FR0
       LDA FR0+1
       LDY FR1+1
       STA FR1+1
       STY FR0+1
       LDA FR0+2
       LDY FR1+2
       STA FR1+2
       STY FR0+2
       LDA FR0+3
       LDY FR1+3
       STA FR1+3
       STY FR0+3
       LDA FR0+4
       LDY FR1+4
       STA FR1+4
       STY FR0+4
       LDA FR0+5
       LDY FR1+5
       STA FR1+5
       STY FR0+5
       JMP L0265
?L1    TAY
       BEQ L0266
       DEY
       BEQ L0267
       DEY
       BEQ ?L3   
       DEY
       BEQ ?L2   
       DEY
       BNE L0263
       LDA FR1+1
       STA FR1+5
       STY FR1+4
       STY FR1+3
       STY FR1+2
       JMP L0270
?L2    LDA FR1+2
       STA FR1+5
       LDA FR1+1
       STA FR1+4
       STY FR1+3
       STY FR1+2
       JMP L0270
?L3    LDA FR1+3
       STA FR1+5
       LDA FR1+2
       STA FR1+4
       LDA FR1+1
       STA FR1+3
       STY FR1+2
       JMP L0270
L0267  LDA FR1+4
       STA FR1+5
       LDA FR1+3
       STA FR1+4
       LDA FR1+2
       STA FR1+3
       LDA FR1+1
       STA FR1+2
L0270  STY FR1+1
L0266  SED
       LDA FR0
       EOR FR1
       BMI ?L8   
       CLC
       LDA FR0+5
       ADC FR1+5
       STA FR0+5
       LDA FR0+4
       ADC FR1+4
       STA FR0+4
       LDA FR0+3
       ADC FR1+3
       STA FR0+3
       LDA FR0+2
       ADC FR1+2
       STA FR0+2
       LDA FR0+1
       ADC FR1+1
       STA FR0+1
       BCC ?L7   
       LDA FR0+4
       STA FR0+5
       LDA FR0+3
       STA FR0+4
       LDA FR0+2
       STA FR0+3
       LDA FR0+1
       STA FR0+2
       LDA #$01
       STA FR0+1
       INC FR0
?L7    JMP L0262
?L8    SEC
       LDA FR0+5
       SBC FR1+5
       STA FR0+5
       LDA FR0+4
       SBC FR1+4
       STA FR0+4
       LDA FR0+3
       SBC FR1+3
       STA FR0+3
       LDA FR0+2
       SBC FR1+2
       STA FR0+2
       LDA FR0+1
       SBC FR1+1
       STA FR0+1
       BCS L0262
       LDA FR0
       EOR #$80
       STA FR0
       SEC
       TYA
       SBC FR0+5
       STA FR0+5
       TYA
       SBC FR0+4
       STA FR0+4
       TYA
       SBC FR0+3
       STA FR0+3
       TYA
       SBC FR0+2
       STA FR0+2
       TYA
       SBC FR0+1
       STA FR0+1
       JMP L0262
L0183  LDX ZP0DA 
       BNE L0273
L0262  LDX #$00
L0273  CLD
       LDY FR0
       BEQ ?L7   
       LDA FR0+1
       BNE ?L6   
       DEY
       LDA FR0+2
       BNE ?L5   
       DEY
       LDA FR0+3
       BNE ?L4   
       DEY
       LDA FR0+4
       BNE ?L3   
       DEY
       LDA FR0+5
       BNE ?L2   
       DEY
       TXA
       BEQ ?L7   
       STA FR0+1
       BNE ?L6   
?L2    STA FR0+1
       STX FR0+2
       LDA #$00
       STA FR0+5
       STA FR0+4
       STA FR0+3
       BEQ ?L6   
?L3    STA FR0+1
       LDA FR0+5
       STA FR0+2
       STX FR0+3
       LDA #$00
       STA FR0+5
       STA FR0+4
       BEQ ?L6   
?L4    STA FR0+1
       LDA FR0+4
       STA FR0+2
       LDA FR0+5
       STA FR0+3
       STX FR0+4
       LDA #$00
       STA FR0+5
       BEQ ?L6   
?L5    STA FR0+1
       LDA FR0+3
       STA FR0+2
       LDA FR0+4
       STA FR0+3
       LDA FR0+5
       STA FR0+4
       STX FR0+5
?L6    STY FR0
       TYA
       AND #$7F
       CMP #$71
       BCS ?L9
       CMP #$0F
       BCS ?L8
?L7    JSR CLEAR_FR0
?L8    CLC
?L9    RTS
;------------------------------
L0026  STX ZP0FC
       STY ZP0FD
       STA ZP0EF
       JSR FR0_TO_5E0
       JSR FP_TO_FR1
       DEC ZP0EF
?L1    JSR L0287
       BCS ?L3   
       LDA ZP0FC
       ADC #$06
       STA ZP0FC
       BCC ?L2
       INC ZP0FD
?L2    JSR FP_TO_FR1
       JSR L0265
       BCS ?L3   
       DEC ZP0EF
       BEQ ?L3   
       LDA ADR_5E0
       STA FR1
       LDA ADR_5E1
       STA FR1+1
       LDA ADR_5E2
       STA FR1+2
       LDA ADR_5E3
       STA FR1+3
       LDA ADR_5E4
       STA FR1+4
       LDA ADR_5E5
       STA FR1+5
       JMP ?L1
?L3    RTS
;------------------------------
FP_TO_FR1 LDY #$05
          LDA (ZP0FC),Y
          STA FR1+5
          DEY
          LDA (ZP0FC),Y
          STA FR1+4
          DEY
          LDA (ZP0FC),Y
          STA FR1+3
          DEY
          LDA (ZP0FC),Y
          STA FR1+2
          DEY
          LDA (ZP0FC),Y
          STA FR1+1
          DEY
          LDA (ZP0FC),Y
          STA FR1
          RTS
;------------------------------
FR0_TO_FR1 LDA FR0
           STA FR1
           LDA FR0+1
           STA FR1+1
           LDA FR0+2
           STA FR1+2
           LDA FR0+3
           STA FR1+3
           LDA FR0+4
           STA FR1+4
           LDA FR0+5
           STA FR1+5
           RTS
;------------------------------
FR0_TO_5E0 LDA FR0
           STA ADR_5E0
           LDA FR0+1
           STA ADR_5E1
           LDA FR0+2
           STA ADR_5E2
           LDA FR0+3
           STA ADR_5E3
           LDA FR0+4
           STA ADR_5E4
           LDA FR0+5
           STA ADR_5E5
           RTS
;------------------------------
FR0_TO_5E6 LDA FR0
           STA ADR_5E6
           LDA FR0+1
           STA ADR_5E7
           LDA FR0+2
           STA ADR_5E8
           LDA FR0+3
           STA ADR_5E9
           LDA FR0+4
           STA ADR_5EA
           LDA FR0+5
           STA ADR_5EB
           RTS
;------------------------------
ADR_5E0_FR0  LDX #$00
             .BY $2C
ADR_5E6_FR0  LDX #$06
             .BY $2C
ADR_5EC_FR0  LDX #$0C
             LDA ADR_5E0,X
             STA FR0
             LDA ADR_5E1,X
             STA FR0+1
             LDA ADR_5E2,X
             STA FR0+2
             LDA ADR_5E3,X
             STA FR0+3
             LDA ADR_5E4,X
             STA FR0+4
             LDA ADR_5E5,X
             STA FR0+5
             RTS
;------------------------------
ADR_5EC_FR1 LDX #$0C
            .BY $2C
ADR_5E6_FR1 LDX #$06
            LDA ADR_5E0,X
            STA FR1
            LDA ADR_5E1,X
            STA FR1+1
            LDA ADR_5E2,X
            STA FR1+2
            LDA ADR_5E3,X
            STA FR1+3
            LDA ADR_5E4,X
            STA FR1+4
            LDA ADR_5E5,X
            STA FR1+5
L0307       RTS
;------------------------------
L0832  LDX #$05
       INC PORTB
?L1    LDA $DE89,X ; ROM ADR.
       STA FR1,X
       DEX
       BPL ?L1
       DEC PORTB
       JSR L0287
       BCS L0307
L0849  LDA #$00
       STA ZP0F1
       LDA FR0
       STA ZP0F0
       AND #$7F
       STA FR0
       CMP #$40
       BCC ?L1
       BNE L0307
       LDA FR0+1
       AND #$F0
       LSR
       STA ZP0F1
       LSR
       LSR
       ADC ZP0F1
       STA ZP0F1
       LDA FR0+1
       AND #$0F
       ADC ZP0F1
       STA ZP0F1
       LDA #$00
       STA FR0+1
       JSR L0262
?L1    LDA #$0A
       LDX #$4D    ; ROM
       LDY #$DE    ; ADR.
       INC PORTB  
       JSR L0026
       DEC PORTB  
       JSR L0311
       LDA ZP0F1
       BEQ ?L2
       LSR
       CLC
       ADC FR0
       BMI ?L3
       STA FR0
       LSR ZP0F1
       BCC ?L2
       JSR L0314
?L2    ASL ZP0F0
       BCC ?L4
       JSR FR0_TO_FR1
       JSR FR0_EINS
       JMP L0317
?L3    SEC
?L4    RTS
;------------------------------
FR0_EINS LDA #$40
         STA FR0
         LDY #$01
         STY FR0+1
         DEY
         STY FR0+2
         STY FR0+3
         STY FR0+4
         STY FR0+5
         RTS
;------------------------------
; ENDE PART 3
;------------------------------

;         .LI ON
;------------------------------
; TURBO-BASIC PART 4
;------------------------------
;         .LI OFF
L0326  STX ZP0FC
       STY ZP0FD
       JSR FR0_TO_5E0
       JSR FP_TO_FR1
       JSR L0265
       JSR FR0_TO_5E6
       JSR ADR_5E0_FR0
       JSR FP_TO_FR1
       JSR L0320
       JSR ADR_5E6_FR1
       JMP L0317
;------------------------------
L0323  SEC
       RTS
L0830  LDA #$05
       BNE L0322
L0831  LDA #$00
L0322  STA ZP0F0
       LDA FR0
       BMI L0323
       BEQ L0323
       ASL
       EOR #$80
       STA ZP0F1
       LDA #$40
       STA FR0
       LDA FR0+1
       AND #$F0
       BEQ ?L1
       INC ZP0F1
       JSR L0325
?L1    LDX #$66  ; ROM
       LDY #$DF  ; ADR.
       INC PORTB  
       JSR L0326
       JSR FR0_TO_5E6
       JSR L0311
       LDA #$0A
       LDX #$72  ; ROM
       LDY #$DF  ; ADR.
       JSR L0026
       DEC PORTB  
       JSR ADR_5E6_FR1
       JSR L0287
       LDA #$3F
       STA FR1
       LDA #$50
       STA FR1+1
       LDA #$00
       STA FR1+2
       STA FR1+3
       STA FR1+4
       STA FR1+5
       JSR L0265
       JSR FR0_TO_FR1
       LDA ZP0F1
       BPL ?L2
       CLC
       EOR #$FF
       ADC #$01
?L2    STA FR0
       LDA #$00
       STA FR0+1
       JSR L0124
       LDA ZP0F1
       AND #$80
       ORA FR0
       STA FR0
       JSR L0265
       LDX ZP0F0
       BEQ ?L4
       INC PORTB  
?L3    LDA $DE89,X ; ROM ADR.
       STA FR1,X
       DEX
       BPL ?L3
       DEC PORTB  
       JMP L0317
?L4    CLC
       RTS
;------------------------------
L0337  SEC
       RTS
L0826  LDA #$04
       BIT FR0
       BPL L0330
       LDA #$02
       BNE L0330
L0828  LDA #$01
L0330  STA ZP0F0
       LDA FR0
       AND #$7F
       STA FR0
       LDX RADFLG
       LDA XTAB5,X
       STA FR1
       LDA XTAB5+1,X
       STA FR1+1
       LDA XTAB5+2,X
       STA FR1+2
       LDA XTAB5+3,X
       STA FR1+3
       LDA XTAB5+4,X
       STA FR1+4
       LDA XTAB5+5,X
       STA FR1+5
       JSR L0317
       BCS L0337
       LDA FR0
       AND #$7F
       SEC
       SBC #$40
       BMI ?L3
       CMP #$04
       BPL L0337
       TAX
       LDA FR0+1,X
       STA ZP0F1
       AND #$10
       BEQ ?L1
       LDA #$02
?L1    CLC
       ADC ZP0F1
       AND #$03
       ADC ZP0F0
       STA ZP0F0
       STX ZP0F1
       LDA #$00
?L2    STA FR0+1,X
       DEX
       BPL ?L2
       JSR L0262
?L3    LSR ZP0F0
       BCC ?L4
       JSR FR0_TO_FR1
       JSR FR0_EINS
       JSR L0320
?L4    JSR FR0_TO_5E6
       JSR L0311
       BCS L0337
       LDA #$06
       LDX #<XTAB4
       LDY #>XTAB4
       JSR L0026
       JSR ADR_5E6_FR1
       JSR L0287
       LSR ZP0F0
       BCC L0342
       CLC
       LDA FR0
       BEQ L0342
       EOR #$80
       STA FR0
L0342  RTS
;------------------------------
XTAB4    .BY $BD,$03,$55,$14,$99,$39,$3E,$01
         .BY $60,$44,$27,$52,$BE,$46,$81,$75
         .BY $43,$55,$3F,$07,$96,$92,$62,$39
         .BY $BF,$64,$59,$64,$08,$67
XTAB5    .BY $40
         .BY $40,$90,$00,$00,$00,$00
XTAB6    .BY $3F,$01,$74,$53,$29,$25
;------------------------------
L0829  LDA #$00
       STA ZP0F0
       STA ZP0F1
       LDA FR0
       AND #$7F
       CMP #$40
       BMI L0350
       LDA FR0
       AND #$80
       STA ZP0F0
       INC ZP0F1
       LDA #$7F
       AND FR0
       STA FR0
       LDX #$EA  ; ROM
       LDY #$DF  ; ADR.
       INC PORTB  
       JSR L0326
       DEC PORTB  
L0350  JSR FR0_TO_5E6
       JSR L0311
       BCS ?L5   
       LDA #$0B
       LDX #$AE  ; ROM
       LDY #$DF  ; ADR.
       INC PORTB  
       JSR L0026
       DEC PORTB  
       BCS ?L5   
       JSR ADR_5E6_FR1
       JSR L0287
       BCS ?L5   
       LDA ZP0F1
       BEQ ?L3
       LDX #$05
       INC PORTB  
?L2    LDA $DFF0,X ; ROM ADR.
       STA FR1,X
       DEX
       BPL ?L2
       DEC PORTB  
       JSR L0265
       LDA ZP0F0
       ORA FR0
       STA FR0
?L3    LDA RADFLG
       BEQ ?L5   
       LDX #$05
?L4    LDA XTAB6,X
       STA FR1,X
       DEX
       BPL ?L4
       JSR L0317
?L5    RTS
;------------------------------
L0357  SEC
       RTS
L0358  CLC
       RTS
L0833  LDA #$00
       STA ZP0F1
       LDA FR0
       BMI L0357
       BEQ L0358
       CMP #$3F
       BEQ ?L1
       CLC
       ADC #$01
       STA ZP0F1
?L1    LDA #$06
       STA ZP0EF
       LDA #$3F
       STA FR0
       JSR FR0_TO_5E6
       JSR FR0_TO_FR1
       JSR FR0_EINS
       INC FR0+1
       JSR L0320
       JSR ADR_5E6_FR1
       JSR L0287
?L2    LDA FR0
       STA ADR_5EC
       LDA FR0+1
       STA ADR_5ED
       LDA FR0+2
       STA ADR_5EE
       LDA FR0+3
       STA ADR_5EF
       LDA FR0+4
       STA ADR_5F0
       LDA FR0+5
       STA ADR_5F1
       JSR FR0_TO_FR1
       JSR ADR_5E6_FR0
       JSR L0317
       JSR ADR_5EC_FR1
       JSR L0320
       JSR L0368
       LDA FR0
       BEQ ?L3
       JSR ADR_5EC_FR1
       JSR L0265
       DEC ZP0EF
       BPL ?L2
       BMI ?L4
?L3    JSR ADR_5EC_FR0
?L4    LDA ZP0F1
       BEQ L0373
       LSR
       CLC
       ADC FR0
       SBC #$1F
       STA FR0
       LSR ZP0F1
       BCC L0373
       JSR L0314
L0373  CLC
       RTS
L0374  JMP CLEAR_FR0
L0368  LDA FR0
       AND #$7F
       CMP #$0F
       BCC L0374
       JSR FR0_TO_FR1
       SED
       LDX #$00
       LDY #$04
       CLC
?L8    LDA FR0+5
       ADC FR1+5
       STA FR0+5
       LDA FR0+4
       ADC FR1+4
       STA FR0+4
       LDA FR0+3
       ADC FR1+3
       STA FR0+3
       LDA FR0+2
       ADC FR1+2
       STA FR0+2
       LDA FR0+1
       ADC FR1+1
       STA FR0+1
       TXA
       ADC #$00
       TAX
       DEY
       BNE ?L8
       CLD
       TXA
       BEQ L0325
       LDA FR0+4
       STA FR0+5
       LDA FR0+3
       STA FR0+4
       LDA FR0+2
       STA FR0+3
       LDA FR0+1
       STA FR0+2
       STX FR0+1
L0314  LDA FR0+1
       CMP #$10
       BCC L0376
       INC FR0
L0325  LDA FR0+1
       CMP #$10
       BCC L0377
       LSR
       ROR FR0+2
       ROR FR0+3
       ROR FR0+4
       ROR FR0+5
       LSR
       ROR FR0+2
       ROR FR0+3
       ROR FR0+4
       ROR FR0+5
       LSR
       ROR FR0+2
       ROR FR0+3
       ROR FR0+4
       ROR FR0+5
       LSR
       ROR FR0+2
       ROR FR0+3
       ROR FR0+4
       ROR FR0+5
       STA FR0+1
       RTS
L0377  DEC FR0
L0376  LDA #$00
       ASL FR0+5
       ROL FR0+4
       ROL FR0+3
       ROL FR0+2
       ROL FR0+1
       ROL
       ASL FR0+5
       ROL FR0+4
       ROL FR0+3
       ROL FR0+2
       ROL FR0+1
       ROL
       ASL FR0+5
       ROL FR0+4
       ROL FR0+3
       ROL FR0+2
       ROL FR0+1
       ROL
       ASL FR0+5
       ROL FR0+4
       ROL FR0+3
       ROL FR0+2
       ROL FR0+1
       ROL
       RTS
L0379  CMP #$FF
       BCC ?L2
       CPY #$50
?L2    TXA
       ADC #$00
       STA FR0
       RTS
L0380  TYA
       AND #$F0
       LSR
       STA FR0
       LSR
       LSR
       ADC FR0
       STA FR0
       TYA
       AND #$0F
       LDX FR0+2
       CPX #$50
       ADC FR0
       STA FR0
       RTS
L0431  LDX #$00
       LDY FR0+1
       LDA FR0
       STX FR0+1
       SEC
       SBC #$40
       BCC L0379
       BEQ L0380
       CMP #$02
       BEQ L0381
       BCS L0382
       LDA FR0+2
       AND #$F0
       LSR
       STA FR0
       LSR
       LSR
       ADC FR0
       STA FR0
       LDA FR0+2
       AND #$0F
       LDX FR0+3
       CPX #$50
       ADC FR0
       STA FR0
L0389  TYA
       AND #$0F
       TAX
       LDA XTAB7_5,X
       ADC FR0
       STA FR0
       LDA XTAB7_6,X
       ADC FR0+1
       STA FR0+1
       TYA
       AND #$F0
       BEQ L0382
       LSR
       LSR
       LSR
       TAX
       LDA FR0
       ADC XTAB7_3,X
       STA FR0
       LDA FR0+1
       ADC XTAB7_4,X
       STA FR0+1
L0382  RTS
L0381  CPY #$07
       BCS L0382
       LDA FR0+3
       AND #$F0
       LSR
       STA FR0
       LSR
       LSR
       ADC FR0
       STA FR0
       LDA FR0+3
       AND #$0F
       LDX FR0+4
       CPX #$50
       ADC FR0
       STA FR0
       LDA XTAB7_1,Y
       ADC FR0
       STA FR0
       LDA XTAB7_2,Y
       ADC FR0+1
       STA FR0+1
       LDY FR0+2
       BNE L0389
       RTS
;------------------------------
XTAB7_1  .BY $00,$10,$20,$30,$40,$50,$60
XTAB7_2  .BY $00,$27,$4E,$75,$9C
XTAB7_3  .BY $C3
XTAB7_4  .BY $EA,$E8,$03,$D0,$07,$B8,$0B,$A0
         .BY $0F,$88,$13,$70,$17,$58,$1B,$40
         .BY $1F,$28,$23
XTAB7_5  .BY $00,$64,$C8,$2C,$90,$F4,$58,$BC
         .BY $20,$84
XTAB7_6  .BY $00,$00,$00,$01,$01,$01,$02,$02
         .BY $03,$03
;------------------------------
;***       RENUM          ***
RENUM_ERR JMP ERROR_3
RENUM_CMD JSR LOOP_BEGIN
          JSR L0399
          STA ZP0A2
          STY ZP0A3
          ORA ZP0A3
          BEQ RENUM_ERR
          TYA
          ORA ZP09A
          ORA ZP09C
          BMI RENUM_ERR
          LDA ZP099
          STA ZP0A0
          LDA ZP09A
          STA ZP0A1
          JSR L0402
          LDA STMCUR
          STA FR1+2
          LDA STMCUR+1
          STA FR1+3
          LDA #$80
          STA FR0+1
          ASL
          STA FR0
          JSR RENUM_19
          BMI RENUM_ERR
          LDA STMTAB+1
          STA STMCUR+1
          LDA STMTAB
RENUM_1   STA STMCUR
          LDY #$01
          LDA (STMCUR),Y
          BMI RENUM_5
          INY
          LDA (STMCUR),Y
          STA LLNGTH
          INY
RENUM_2   LDA (STMCUR),Y
          STA STATE_LEN
          INY
          STY STATE_NDX
          LDA (STMCUR),Y
          CMP #$0A
          BEQ ?L3
          CMP #$0B
          BEQ ?L3
          CMP #$0C
          BEQ ?L3
          CMP #$0D
?L3       BEQ RENUM_10
          CMP #$1E
          BEQ RENUM_11
          CMP #$23
          BEQ RENUM_9
          CMP #$07
          BEQ RENUM_8
          CMP #$04
          BEQ RENUM_12
          CMP #$56
          BEQ RENUM_12
RENUM_4   LDY STATE_LEN
          CPY LLNGTH
          BCC RENUM_2
          CLC
          LDA STMCUR
          ADC LLNGTH
          BCC RENUM_1
          INC STMCUR+1
          BCS RENUM_1
RENUM_5   LDA FR1+3
          STA STMCUR+1
          LDA FR1+2
?L6       STA STMCUR
          LDY #$01
          LDA (STMCUR),Y
          BMI ?L7
          LDA ZP09C
          STA (STMCUR),Y
          DEY
          LDA ZP09B
          STA (STMCUR),Y
          CLC
          ADC ZP0A2
          STA ZP09B
          LDA ZP09C
          ADC ZP0A3
          STA ZP09C
          LDY #$02
          LDA (STMCUR),Y
          ADC STMCUR
          BCC ?L6
          INC STMCUR+1
          BCS ?L6
?L7       JSR L0421
          JMP L0422
RENUM_8   JSR L0423
          CPX #$1B
          BNE RENUM_4
          DEC STATE_NDX
RENUM_9   LDY STATE_NDX
          INY
          CPY STATE_LEN
          BCS RENUM_4
RENUM_10  JSR RENUM_14
          JMP RENUM_4
RENUM_11  JSR L0423
          CPX #$17
          BEQ RENUM_13
          CPX #$18
          BNE RENUM_4
          .BY $2C
RENUM_12  INC STATE_NDX
RENUM_13  LDA STATE_NDX
          CMP STATE_LEN
          BCS RENUM_4
          PHA
          JSR RENUM_15
          PLA
          STA STATE_NDX
          JSR L0429
          JMP RENUM_13
RENUM_14  INC STATE_NDX
RENUM_15  LDY STATE_NDX
          STY ZP0DC
          LDA (STMCUR),Y
          BEQ ?L18
          CMP #$0F
          BCS ?L18
          JSR Y0189
          JSR L0431
          LDA FR0+1
          BMI ?L18
          BCS ?L18
          JSR RENUM_19
          PHP
          BCS ?L16
          STA FR0
          STY FR0+1
?L16      JSR L0124
          ASL FR0
          PLP
          ROR FR0
          LDY STATE_NDX
          LDX #$05
?L17      LDA FR0,X
          DEY
          STA (STMCUR),Y
          DEX
          BPL ?L17
?L18      RTS
RENUM_19  LDA FR0
          CMP ZP099
          LDA FR0+1
          SBC ZP09A
          BCS ?L20
          LDA FR0
          LDY FR0+1
          RTS
?L20      LDA FR1+2
          STA ZP0DA
          LDA FR1+3
          STA ZP0DB
          LDA ZP09B
          STA FR1
          LDA ZP09C
?L21      STA FR1+1
          LDY #$01
          LDA (ZP0DA),Y
          BMI ?L25
          CMP FR0+1
          BNE ?L22
          DEY
          LDA (ZP0DA),Y
          CMP FR0
?L22      BCS ?L24
          LDY #$02
          LDA (ZP0DA),Y
          ADC ZP0DA
          STA ZP0DA
          BCC ?L23
          INC ZP0DB
?L23      DEY
          LDA (ZP0DA),Y
          BMI ?L25
          CLC
          LDA FR1
          ADC ZP0A2
          STA FR1
          LDA FR1+1
          ADC ZP0A3
          JMP ?L21
?L24      CLC
          BEQ ?L26
?L25      SEC
?L26      LDA FR1
          LDY FR1+1
          RTS
;------------------------------
L0423  INC STATE_NDX
L0429  JSR Y0189
       BCC L0429
       TAX
       LDA L0441,X
       BNE L0429
       RTS
;------------------------------
;***     BLOAD + BRUN     ***
BLOAD_CMD  LDA #$00
           .BY $2C
BRUN_CMD   LDA #$80
           STA OBJ_RUN_FLAG
           LDA #<DUMMY_RTS
           LDY #>DUMMY_RTS
           STA RUNAD
           STY RUNAD+1
           LDA #$04
           LDY #$01
           JSR OPENIOCB_X
           INC PORTB
           JSR OBGET_BYTE
           CMP #$FF
           BNE STATUS_OK
           INY
           BNE STATUS_OK
?L1        LDA #<DUMMY_RTS
           LDY #>DUMMY_RTS
           STA INITAD
           STY INITAD+1
           JSR OBGET_BYTE
           CMP #$FF
           BNE ?L2
           CPY #$FF
           BEQ ?L1
?L2        STA ICBAL,X
           TYA
           STA ICBAH,X
           JSR OBGET_BYTE
           SEC
           SBC ICBAL,X
           STA ICBLL,X
           TYA
           SBC ICBAH,X
           STA ICBLH,X
           INC ICBLL,X
           BNE ?L3
           INC ICBLH,X
?L3        JSR CIOV
           TYA
           BMI OBLOA_ERR1
           JSR OBLOA_INIT
           LDA ICSTA+$10
           CMP #$03
           BNE ?L1
           LDX #$10
           LDA #$0C
           STA ICCOM,X
           JSR CIOV
           BIT OBJ_RUN_FLAG
           BPL ?L4
           JSR OBLOA_RUN
?L4        LDA #$FE
           STA PORTB
DUMMY_RTS  RTS
STATUS_OK  LDA #$01
OBLOA_ERR1 TAY
OBLOA_ERR2 JSR OS_RAM_ON
           TYA
           JMP ERR_FUN ;* ???
OBLOA_INIT JMP (INITAD)
OBLOA_RUN  JMP (RUNAD)
OBGET_BYTE LDA #$07
           LDX #$10
           STA ICCOM,X
           LDA #$00
           STA ICBLL,X
           STA ICBLH,X
           JSR CIOV
           BMI OBLOA_ERR2
           PHA
           LDA #$00
           STA ICBLL,X
           JSR CIOV
           BMI OBLOA_ERR2
           TAY
           PLA
           RTS
TURBOBAS_TOP



;------------------------------
; ENDE PART 4
;------------------------------

;         .LI ON
;------------------------------
; TURBO-BASIC PART 5
;------------------------------
;         .LI OFF
;------------------------------
; VORPROGRAMM, WIRD NACH BEEN-
; DIGUNG NICHT MEHR GEBRAUCHT
;------------------------------
       ORG TOP_LOADER
;------------------------------
       LDX KEYBDV+4
       LDY KEYBDV+5
       INX
       BNE L_1
       INY
L_1    STX GETKEY_VEC+1
       STY GETKEY_VEC+2
;------------------------------
; VEKTOR FUER NMI + IRQ IN DEN
; IN DEN O.S.RAM SCHREIBEN
;
       LDA #$00
       STA NMIEN
       SEI
       LDA #$FE
       STA PORTB
       LDA #<NMI_CALL
       STA NMI_VEC
       LDA #>NMI_CALL
       STA NMI_VEC+1
       LDA #<IRQ_AUFRUF
       STA IRQ_VEC
       LDA #>IRQ_AUFRUF
       STA IRQ_VEC+1
;------------------------------
; ZEICHENSAETZE IN RAM KOPIEREN
;
       LDA #$CC
       JSR COPY_ZSATZ
       LDA #$E0
       JSR COPY_ZSATZ
;------------------------------
       LDA #$40
       STA NMIEN
       CLI
       LDA #$FF
       STA PORTB
;------------------------------
;  REST VON DISK LADEN
       JSR TB_HIGH_READ
;------------------------------
       LDA #<TURBOBAS_TOP
       LDY #>TURBOBAS_TOP
       STA MEMLO
       STY MEMLO+1
;------------------------------
       LDA DOSINI
       LDY DOSINI+1
       STA DOS_ADR_SAV+1
       STY DOS_ADR_SAV+2
;------------------------------
       LDA #<RESET_VEC
       LDY #>RESET_VEC
       STA DOSINI
       STY DOSINI+1
;------------------------------
       LDA #$FE
       STA PORTB
       STA PROG_CLR
;------------------------------
       LDA #$01
       STA BASICF
       ORA BOOT
       STA BOOT
       LDA #$00
       STA COLDST
;------------------------------
          JSR NEW_BAS_PTR
          LDA #$00
          STA ZP0A0
          STA ZP0A1
          JSR L0467
          LDY #$1F
          LDX #$8A
          JSR L0468
          LDY #$1E
TOPLOAD_1 LDA INIT_TAB,Y
          STA (ZP097),Y
          DEY
          BPL TOPLOAD_1
          JSR L0421
          LDA #>[L0984-1]
          PHA
          LDA #<[L0984-1]
          PHA
          JSR SET_RAMTOP
          DEC PORTB
          JMP RUN_1
;------------------------------
INIT_TAB .BY $00,$00,$19,$07,$0D,$67,$14,$19
         .BY $25,$0F,$0D
         .BYTE 'D:AUTORUN.BAS'
         .BY $16,$01,$00,$06,$06,$16,$16
;------------------------------
; SPEICHERGRENZEN SETZEN
;     EDITOR OEFFNEN
;
SET_RAMTOP LDA #$FF
           STA PORTB
           LDA #$C0
           STA RAMTOP
           LSR
           STA APPMHI+1
           LDA EDITRV+1
           PHA
           LDA EDITRV
           PHA
           RTS
;------------------------------
; 4 PAGES FUER Z.S. KOPIEREN
;
COPY_ZSATZ STA FR0+1
           LDY #$00
           STY FR0
           LDX #$04
?L1        LDA #$FF
           STA PORTB
?L2        LDA (FR0),Y
           STA XTAB3,Y
           INY
           BNE ?L2
           DEC PORTB
?L3        LDA XTAB3,Y
           STA (FR0),Y
           INY
           BNE ?L3
           INC FR0+1
           DEX
           BNE ?L1
           RTS
;------------------------------
; PARTE DIE UNTER DEN O.S. ROM
; KOMMEN, LESEN
;
TB_HIGH_READ
       LDX #$10
       LDA #$D6
       STA ICBAL,X
       LDA #$00
       STA ICBAH,X
       STA ICBLH,X
       LDA #$04
       STA ICBLL,X
       LDA #$07
       STA ICCOM,X
       JSR CIOV
       BMI ?L6
       LDA #<TOP_LOAD_BUF
       STA ZP0DA
       STA ICBAL,X
       LDA #>TOP_LOAD_BUF
       STA ZP0DB
       STA ICBAH,X
       LDA FR0+4
       SBC FR0+2
       STA ZP0DC
       LDA FR0+5
       SBC FR0+3
       STA ZP0DD
       INC ZP0DC
       BNE ?L1
       INC ZP0DD
?L1    LDA ZP0DC
       STA ICBLL,X
       LDA ZP0DD
       STA ICBLH,X
       JSR CIOV
       BMI ?L7
       DEC PORTB
       LDY #$00
       LDX ZP0DD
       BEQ ?L3
?L2    LDA (ZP0DA),Y
       STA (FR0+2),Y
       INY
       BNE ?L2
       INC FR0+3
       INC ZP0DB
       DEX
       BNE ?L2
?L3    LDX ZP0DC
       BEQ ?L5
?L4    LDA (ZP0DA),Y
       STA (FR0+2),Y
       INY
       DEX
       BNE ?L4
?L5    LDA #$FF
       STA PORTB
       BMI TB_HIGH_READ
?L6    RTS
?L7    JMP (DOSVEC)



TOP_LOAD_BUF
;------------------------------
       ORG INITAD
       .WORD TOP_LOADER
;------------------------------
       ORG OS_RAM_C0
;------------------------------
;***         DEL          ***
DEL_CMD JSR LOOP_BEGIN
        JSR L0489
        JSR L0490
        STA ZP0A0
        STY ZP0A1
        JSR L0490
        JSR L0467
?L1     LDY #$01
        LDA (STMCUR),Y
        CMP FR0+1
        BNE ?L2
        DEY
        LDA (STMCUR),Y
        CMP FR0
?L2     BCC ?L3
        BNE ?L5
?L3     LDY #$02
        CLC
        LDA (STMCUR),Y
        TAY
        ADC STMCUR
        STA STMCUR
        BCC ?L4
        INC STMCUR+1
?L4     LDX #$8A
        JSR L0495
        JMP ?L1
?L5     JSR L0497
        JMP L0422
;------------------------------
;***         DUMP          ***
DUMP_CMD INY
         CPY STATE_LEN
         BCS ?L1
         JSR OPENWRITE
?L1      LDA #$00
         STA ZP0B9
?L2      JSR WRITE_EOL
         LDA BRKKEY
         BEQ ?L4
         LDA ZP0B9
         JSR FP_VVTP_FR0
         LDA ZP09D
         CMP STMTAB
         LDA ZP09E
         SBC STMTAB+1
         BCS ?L5
         LDA ZP0B9
         JSR ?L3
         INC ZP0B9
         BNE ?L2
?L3      JSR WRITE_VARNAME
         JSR L0510
         LDA ZP0D2
         CMP #$C0
         BCS ?L7
         CMP #$80
         BCS DUMP_9
         CMP #$40
         BCS DUMP_9
         LDA #$3D
         JSR WRITE_BYTE
         JMP CALL_FP_ASC1
?L4      DEC BRKKEY
?L5      LDA ZP0B5
         BEQ ?L6
         JSR IO_CLOSE
         LDA #$00
         STA ZP0B5
?L6      RTS
?L7      LDY #$4F
         LSR
         BCS DUMP_8
         LDY #$5D
         LSR
         BCS DUMP_8
         LDA #$3F
         JMP WRITE_BYTE
DUMP_8   TYA
         JSR L0519
         LDY #$00
         LDA (FR0),Y
         TAX
         INY
         LDA (FR0),Y
         JMP L0520
DUMP_9   LDA FR0+5
         PHA
         LDA FR0+4
         PHA
         LDA FR0+3
         LDX FR0+2
         JSR L0520
         LDA #$2C
         JSR WRITE_BYTE
         PLA
         TAX
         PLA
         JMP L0520
;------------------------------
L0489  TXA
       PHA
       LDA BASMEMTOP
       PHA
       LDA BASMEMTOP+1
       PHA
       LDA ZP0B2
       PHA
       LDA ZP0A0
       PHA
       LDA ZP0A1
       PHA
?L1    JSR POP_1
       BCS L0523
       LDY ZP0A1
       BNE ?L2
       LDA #<XTAB8
       STA ZP0A0
       LDA #>XTAB8
       STA ZP0A1
?L2    TAY
       BMI ?L3
       LDY #$00
       LDA (ZP0A0),Y
       INY
       STA (BASMEMTOP),Y
       LDA (ZP0A0),Y
       INY
       STA (BASMEMTOP),Y
       BCC ?L1
?L3    LDY #$00
       LDA (ZP0A0),Y
       LDY #$13
       STA (BASMEMTOP),Y
       LDY #$01
       LDA (ZP0A0),Y
       LDY #$14
       STA (BASMEMTOP),Y
       BCC ?L1

L0523  PLA
       STA ZP0A1
       PLA
       STA ZP0A0
       PLA
       STA ZP0B2
       PLA
       STA BASMEMTOP+1
       STA APPMHI+1
       PLA
       STA BASMEMTOP
       STA APPMHI
       PLA
       TAX
       RTS

L0497  PHA
       LDA BASMEMTOP
       PHA
       LDA BASMEMTOP+1
       PHA
       LDA ZP0B2
       PHA
       LDA ZP0A0
       PHA
       LDA ZP0A1
       PHA
       LDA STMCUR
       PHA
       LDA STMCUR+1
       PHA
       LDA ZP0BE
       PHA
       LDA ZP0BF
       PHA
       JSR L0528
       JSR L0421
L0497_1 JSR POP_1
       BCS ?L5
       PHA
       LDY ZP0A1
       INY
       BEQ ?L2
       JSR L0402
       BCC ?L3
?L2    LDA #$00
       STA STMCUR
       STA STMCUR+1
?L3    LDY #$01
       PLA
       BPL ?L4
       LDY #$13
?L4    LDA STMCUR
       STA (BASMEMTOP),Y
       INY
       LDA STMCUR+1
       STA (BASMEMTOP),Y
       JMP L0497_1
?L5    PLA
       STA ZP0BF
       PLA
       STA ZP0BE
       PLA
       STA STMCUR+1
       PLA
       STA STMCUR
       JMP L0523
XTAB8  .BY $FF,$FF
L0528  LDA VVTP
       STA ZP0A0
       LDA VVTP+1
       STA ZP0A1
?L1    LDA ZP0A0
       CMP STMTAB
       LDA ZP0A1
       SBC STMTAB+1
       BCS ?L3
       LDY #$00
       LDA (ZP0A0),Y
       AND #$C0
       CMP #$C0
       BNE ?L2
       STA (ZP0A0),Y
?L2    CLC
       LDA ZP0A0
       ADC #$08
       STA ZP0A0
       BCC ?L1
       INC ZP0A1
       BCS ?L1
?L3    RTS
;------------------------------
;***      SETCOLOR        ***
SETCOLOR_CMD
           JSR L0399
           AND #$0F
           ASL ZP09B
           ASL ZP09B
           ASL ZP09B
           ASL ZP09B
           ORA ZP09B
           LDX ZP09A
           BNE ERROR3_2
           LDX ZP099
           CPX #$05
           BCS ERROR3_2
           STA COLOR0,X
           RTS
;------------------------------
SOUND_OFF  LDX #$07
           LDA #$00
?L1        STA AUDF1,X
           DEX
           BPL ?L1
           RTS
;------------------------------
ERROR3_2   JMP ERROR_3
;------------------------------
;***   SOUND + DSOUND      ***
DSOUND_CMD
SOUND_CMD
       STA ZP0A2
       INY
       CPY STATE_LEN
       BCS SOUND_OFF
       JSR L0540
       LDY #$00
       BIT ZP0A2
       BPL ?L1
       ASL
       LDY #$78
?L1    CMP #$04
       BCS ERROR3_2
       ASL
       PHA
       STY AUDCTL
       LDA #$03
       STA SKCTL
       JSR L0399
       PLA
       TAX
       LDA ZP099
       STA AUDF1,X
       BIT ZP0A2
       BPL ?L2
       INX
       INX
       LDA ZP09A
       STA AUDF1,X
?L2    LDA ZP09B
       ASL
       ASL
       ASL
       ASL
       ORA FR0
       STA AUDC1,X
       RTS
;------------------------------
;***     POSITION         ***
POSITION_CMD
POSITION
       JSR L0543
       STA COLCRS
       STY COLCRS+1
       JSR L0540
       STA ROWCRS
       RTS
;------------------------------
;***          COLOR       ***
COLOR_CMD  JSR L0543
           STA BAS_COLOR
           RTS
;------------------------------
;***          FCOLOR      ***
FCOLOR_CMD  JSR L0543
            STA FILDAT
            RTS
;------------------------------
;***   FILLTO + DRAWTO    ***
FILLTO_CMD  LDA #$12
            .BY $2C
DRAWTO_CMD  LDA #$11
            PHA
            JSR POSITION
            LDA BAS_COLOR
            STA ATACHR
            LDX #$60
            LDA #$0C
            STA ICAX1,X
            LDA #$00
            STA ICAX2,X
            PLA
            JMP L0546
;------------------------------
;***       GRAPHICS        ***
GRAPHICS_CMD
       LDX #$06
       STX CIO_KANAL
       JSR IO_CLOSE
       JSR L0543
       LDX #<SCREEN_NAME
       LDY #>SCREEN_NAME
       STX INBUFF
       STY INBUFF+1
       LDX #$06
       AND #$F0
       EOR #$1C
       TAY
       LDA FR0
       JSR OPENIOCB
       JMP IO_STATUS
;------------------------------
;***         PLOT         ***
PLOT_CMD  JSR POSITION
          LDY BAS_COLOR
          LDX #$60
          JMP WRITE_BYTE2
;------------------------------
L0749  LDX ZP0B4
       BNE L0552
       LDA ZP0C2
       JSR WRITE_BYTE
L0552  LDX ZP0B4
       LDA #$05
       JSR L0553
       JSR CIOCALL_1
       JMP IO_STATUS
;------------------------------
WRITE_EOL    LDA #$9B
WRITE_BYTE   LDX ZP0B5
WRITE_BYTE1  TAY
             JSR L0555
WRITE_BYTE2  LDA ICAX1,X
             STA ICAX1Z
             LDA ICAX2,X
             STA ICAX2Z
             JSR PUTBYTE
L0641        TYA
             JMP IO_ERR_BRK
L0553        STA CIO_CMD
L0555        STX CIO_KANAL
             JMP IONR_MUL
;------------------------------
;***      ENTER           ***
ENTER_CMD  LDA #$04
           JSR OPENIOCB_7
           STA ZP0B4
           JMP L0561
OPENWRITE  LDA #$08
           JSR OPENIOCB_7
           STA ZP0B5
           RTS
;------------------------------
OPENIOCB_7  LDY #$07
OPENIOCB_X  STY CIO_KANAL
            PHA
            JSR IONR_MUL
            JSR IO_CLOSE_NR
            LDY #$03
            STY CIO_CMD
            PLA
            LDY #$00
            JSR L0563
            LDA #$07
            RTS
;------------------------------
;***         LOAD          ***
RUN_LOAD_BAS
          LDA #$FF
          .BY $2C
LOAD_CMD  LDA #$00
          PHA
          LDA #$04
          JSR OPENIOCB_7
          PLA
LOAD_BAS  PHA
          LDA #$07
          STA CIO_CMD
          STA PROG_CLR
          JSR IONR_MUL
          LDY #$0E
          JSR CIOCALL_2
          JSR IO_STATUS
          LDA ADR_580
          ORA ADR_581
          BNE ERROR21_1
          LDX #$8C
?L1       CLC
          LDA BAS_LOMEM
          ADC ADR_500,X
          TAY
          LDA BAS_LOMEM+1
          ADC ADR_501,X
          CMP MEMTOP+1
          BCC ?L3
          BNE ?L2
          CPY MEMTOP
          BCC ?L3
?L2       JMP ERROR19_1
?L3       STA LINZBS+1,X
          STY LINZBS,X
          DEX
          DEX
          CPX #$82
          BCS ?L1
          JSR LO_SA_BASPRG
          JSR CLR_1
          LDA #$00
          STA PROG_CLR
          PLA
          BEQ ?L4
          RTS
?L4       JMP L0579
ERROR21_1 LDA #$00
          STA PROG_CLR
          LDA #$15
          JMP ERROR_ROUT
;------------------------------
;***         SAVE          ***
SAVE_CMD  LDA #$08
          JSR OPENIOCB_7
SAVE_BAS  LDA #$0B
          STA CIO_CMD
          LDX #$80
?L1       SEC
          LDA LINZBS,X
          SBC BAS_LOMEM
          STA ADR_500,X
          INX
          LDA LINZBS,X
          SBC BAS_LOMEM+1
          STA ADR_500,X
          INX
          CPX #$8E
          BCC ?L1
          JSR IONR_MUL
          LDY #$0E
          JSR CIOCALL_2
          JSR IO_STATUS
LO_SA_BASPRG
          JSR IONR_MUL
          LDA VNTP
          STA INBUFF
          LDA VNTP+1
          STA INBUFF+1
          LDY ADR_58D
          DEY
          TYA
          LDY ADR_58C
          JSR CIOCALL_3
          JSR IO_STATUS
          JMP IO_CLOSE
;------------------------------
;***         CSAVE         ***
CSAVE_CMD  LDA #$08
           JSR OPEN_CASS
           JMP SAVE_BAS
;------------------------------
;***         CLOAD         ***
CLOAD_CMD  LDA #$04
           JSR OPEN_CASS
           LDA #$00
           JMP LOAD_BAS
;------------------------------
OPEN_CASS  PHA
           LDX #<CASSETTE_NAME
           STX INBUFF
           LDX #>CASSETTE_NAME
           STX INBUFF+1
           LDX #$07
           PLA
           TAY
           LDA #$80
           JSR OPENIOCB
           JSR IO_STATUS
           LDA #$07
           RTS
;------------------------------
OPENIOCB  PHA
          LDA #$03
          JSR L0553
          PLA
          STA ICAX2,X
          TYA
          STA ICAX1,X
          JSR CIOCALL_4
          JMP SET_INBUFF_580
;------------------------------
; ENDE PART 5
;------------------------------

;         .LI ON
;------------------------------
; TURBO-BASIC PART 6
;------------------------------
;         .LI OFF
;------------------------------
;***     XIO + OPEN        ***
XIO_CMD   JSR L0543
          .BY $2C
OPEN_CMD  LDA #$03
          STA CIO_CMD
          JSR GET_IOCBNR
          JSR L0543
          PHA
          JSR L0543
          TAY
          PLA
L0563     PHA
          TYA
          PHA
          LDY STATE_NDX
          INY
          CPY STATE_LEN
          BCS SET_DISKWILD
          JSR LET_CMD
L0598     JSR L0595
          JSR IONR_MUL
          PLA
          STA ICAX2,X
          PLA
          STA ICAX1,X
          JSR CIOCALL_1
          JSR L0596
          JMP IO_STATUS
;------------------------------
SET_DISKWILD
       LDA #<DISKWILD_NAME
       LDX #>DISKWILD_NAME
       LDY #$05
       JSR L0597
       JMP L0598
;------------------------------
;***         STATUS        ***
STATUS_CMD  JSR GET_IOCBNR
            LDA #$0D
            JSR CIOCALL_6
            TYA
            JMP L0600
;------------------------------
;***         NOTE          ***
NOTE_CMD  LDA #$26
          JSR L0601
          LDA ICSPR,X
          LDY ICSPR+1,X
          JSR L0602
          JSR IONR_MUL
          LDA ICSPR+2,X
          JMP L0600
;------------------------------
;***         POINT         ***
POINT_CMD  JSR GET_IOCBNR
           JSR L0543
           JSR IONR_MUL
           LDA FR0
           STA ICSPR,X
           LDA FR0+1
           STA ICSPR+1,X
           JSR L0543
           JSR IONR_MUL
           LDA FR0
           STA ICSPR+2,X
           LDA #$25
           STA CIO_CMD
           JMP L0603
;------------------------------
;***          PUT         ***
PUT_CMD  JSR IOCBNR_J_N
?L1      JSR L0543
         LDX CIO_KANAL
         JSR WRITE_BYTE1
         LDY STATE_NDX
         INY
         CPY STATE_LEN
         BCC ?L1
         RTS
;------------------------------
;***          GET         ***
GET_CMD     LDA (STMCUR),Y
            CMP #$1C
            BEQ ?L2
?L1         JSR GETKEY_1
            JSR L0600
            LDY STATE_NDX
            INY
            CPY STATE_LEN
            BCC ?L1
            RTS
?L2         JSR GET_IOCBNR
GET_3       JSR IONR_MUL
LOCATE_GET  JSR GETBYTE
            TAX
            TYA
            JSR IO_ERR_BRK
            TXA
            JSR L0600
            LDY STATE_NDX
            INY
            CPY STATE_LEN
            BCC GET_3
NUR_RTS     RTS
;------------------------------
;***       LOCATE         ***
LOCATE_CMD  JSR POSITION
            LDX #$60
            BNE LOCATE_GET
;------------------------------
IOCBNR_J_N   LDA (STMCUR),Y
             CMP #$1C
             BEQ GET_IOCBNR
             LDA #$00
             BEQ IONR_ST_MUL
GET_IOCBNR   JSR L0614
IONR_ST_MUL  STA CIO_KANAL
IONR_MUL     LDA CIO_KANAL
             ASL
             ASL
             ASL
             ASL
             TAX
             BPL NUR_RTS
             LDA #$14
             JMP ERROR_ROUT
IO_STATUS    JSR IONR_MUL
             LDA ICSTA,X
IO_ERR_BRK   BPL NUR_RTS
             LDY #$00
             STY DSPFLG
             CMP #$80
             BNE ?L1
             STY BRKKEY
             LDX PROG_CLR
             BEQ NUR_RTS
             JMP L0031
?L1          LDY CIO_KANAL
             CMP #$88
             BEQ ?L4
?L2          STA ZP0B9
             CPY #$07
             BNE ?L3
             JSR IO_CLOSE
?L3          JSR L0620
             JMP ERROR_IO
?L4          CPY #$07
             BNE ?L2
             LDX #$5D
             CPX ZP0C2
             BNE ?L2
             JSR IO_CLOSE
             JMP L0623
IO_CLOSE     JSR IONR_MUL
             BEQ NUR_RTS
IO_CLOSE_NR  LDA #$0C
             JMP CIOCALL_6
CIOCALL_1    LDY #$FF
CIOCALL_2    LDA #$00
CIOCALL_3    STA ICBLH,X
             TYA
             STA ICBLL,X
CIOCALL_4    LDA INBUFF+1
             LDY INBUFF
             STA ICBAH,X
             TYA
             STA ICBAL,X
CIOCALL_5    LDA CIO_CMD
CIOCALL_6    STA ICCOM,X
             JMP CIO_JUMP
;------------------------------
L0600  LDY #$00
L0602  PHA
       TYA
       PHA
       JSR LET_CMD
       PLA
       STA FR0+1
       PLA
       STA FR0
       JSR L0124
       JMP L0625
;------------------------------
IO_CL_ALL JSR SOUND_OFF
          LDY #$07
          STY CIO_KANAL
?L1       JSR IO_CLOSE
          DEC CIO_KANAL
          BNE ?L1
          RTS
;------------------------------
;***          CLOSE         ***
CLOSE_CMD INY
          CPY STATE_LEN
          BCS IO_CL_ALL
          LDA #$0C
L0601     STA CIO_CMD
          JSR GET_IOCBNR
L0603     JSR CIOCALL_5
          JMP IO_STATUS
;------------------------------
PRINT_READY LDX #$06
?L1         STX CIX
            LDA READY_TEXT,X
            JSR WRITE_BYTE
            LDX CIX
            DEX
            BPL ?L1
            RTS
;------------------------------
READY_TEXT  .BYTE $9B,'YDAER'
            .BYTE $9B
;------------------------------
L0595  JSR L0632
       LDA FR0
       STA INBUFF
       LDA FR0+1
       STA INBUFF+1
       LDY FR0+2
       LDX FR0+3
       BEQ ?L1
       LDY #$FF
?L1    LDA (INBUFF),Y
       STA ZP097
       STY ZP098
       LDA #$9B
       STA (INBUFF),Y
       STA MEOLFLG
       RTS
L0596  LDY ZP098
       LDA ZP097
       STA (INBUFF),Y
       LDA #$00
       STA MEOLFLG
       JMP SET_INBUFF_580
;------------------------------
;***       DIRECTORY       ***
DIR_CMD LDA #$06
        JSR OPENIOCB_7
?L1     LDX #$70
        JSR GETBYTE
        BMI ?L2
        LDX #$00
        JSR WRITE_BYTE1
        BPL ?L1
?L2     TYA
        PHA
        LDX #$70
        JSR IO_CLOSE_NR
        PLA
        CMP #$88
        BEQ ?L3
        JMP ERROR_ROUT
?L3     RTS
;------------------------------
;** RENAME,LOCK,UNLOCK,DELETE **
RENAME_CMD LDA #$20
           .BY $2C
LOCK_CMD   LDA #$23
           .BY $2C
UNLOCK_CMD LDA #$24
           .BY $2C
DELETE_CMD LDA #$21
           STA CIO_CMD
           LDA #$07
           STA CIO_KANAL
           LDA #$00
           TAY
           JMP L0563
;------------------------------
;***      BPUT + BGET      ***
BPUT_CMD LDA #$0B
         .BY $2C
BGET_CMD LDA #$07
         PHA
         JSR GET_IOCBNR
         JSR L0119
         JSR IONR_MUL
         LDA ZP09B
         STA ICBAL,X
         LDA ZP09C
         STA ICBAH,X
         LDA FR0
         STA ICBLL,X
         LDA FR0+1
         STA ICBLH,X
         PLA
L0546    JSR CIOCALL_6
         JMP L0641
;------------------------------
GETBYTE LDA #$07
        STA CIO_CMD
        LDY #$00
        JMP CIOCALL_2
;------------------------------
GETKEY_1 JSR GETKEY
         CPY #$80
         BCS ?L1
         RTS
?L1      JMP L0641
;------------------------------
;***     %PUT + %GET       ***
PUTFL_CMD LDA #$0B
          .BY $2C
GETFL_CMD LDA #$07
          STA CIO_CMD
          JSR IOCBNR_J_N
?L1       JSR L0644
          JSR IONR_MUL
          LDA #$D4
          STA INBUFF
          LDA #$00
          STA INBUFF+1
          LDY #$06
          JSR CIOCALL_2
          JSR SET_INBUFF_580
          JSR IO_STATUS
          LDA CIO_CMD
          CMP #$07
          BNE ?L2
          JSR L0625
?L2       LDY STATE_NDX
          INY
          CPY STATE_LEN
          BCC ?L1
          RTS



;------------------------------
;***  FLOATING POINT SIGN   ***

X_FPASIGN
       LDY OPSTKX
       BNE ?L1
       DEC ARSLVL
       LDX ARSLVL
       DEC ARSLVL
       LDA XTAB1,X
       JSR CALC_VARTAB
       LDY #$02
       LDA XTAB1_21,X
       STA (ZP09D),Y
       INY
       LDA XTAB1_41,X
       STA (ZP09D),Y
       INY
       LDA XTAB1_61,X
       STA (ZP09D),Y
       INY
       LDA XTAB1_81,X
       STA (ZP09D),Y
       INY
       LDA XTAB1_A1,X
       STA (ZP09D),Y
       INY
       LDA XTAB1_C1,X
       STA (ZP09D),Y
       RTS
?L1    LDA #$80
       STA ZP0B1
       RTS
;------------------------------
;***                       ***
Y0133  INC ZP0B0
Y0126  LDY OPSTKX
       PLA
       PLA
       JMP LET_4
;------------------------------
;***                       ***
Y0132  LDA #$40
       STA ZP0B1
Y0131  BIT ZP0B1
       BPL ?L1
       LDA ARSLVL
       STA ZP0AF
       DEC ARSLVL
?L1    LDA ZP0B0
       TAY
       BEQ ?L2
       DEC ZP0B0
       JSR L0115
       BMI ?L3
?L2    STY ZP098
       STA ZP097
       JSR L0115
       BMI ?L3
       STA ZP0F5
       STY ZP0F6
       JSR L0663
       BIT ZP0B1
       BVC ?L4
       LDA #$00
       STA ZP0B1
       RTS
?L3    JMP ERROR_9
?L4    LSR ZP0D2
       BCC ?L3
       LDA ZP0F5
       CMP FR0+2
       LDA ZP0F6
       SBC FR0+3
       BCS ?L3
       LDA ZP097
       CMP FR0+4
       LDA ZP098
       SBC FR0+5
       BCS ?L3
       LDA FR0+5
       BNE L0665
       LDY FR0+5
       DEY
       BNE L0665
       LDA ZP0F5
       STA ZP0F7
       LDA ZP0F6
       STA ZP0F8
       JMP L0666
L0665  LDY #$00
       STY ZP0F7
       STY ZP0F8
       LDY #$10
?L6    LSR FR0+5
       ROR FR0+4
       BCC ?L7
       CLC
       LDA ZP0F7
       ADC ZP0F5
       STA ZP0F7
       LDA ZP0F8
       ADC ZP0F6
       STA ZP0F8
?L7    ASL ZP0F5
       ROL ZP0F6
       DEY
       BNE ?L6
L0666  CLC
       LDA ZP097
       ADC ZP0F7
       STA ZP0F5
       LDA ZP098
       ADC ZP0F8
       ASL ZP0F5
       ROL
       STA ZP0F6
       TAY
       LDA ZP0F5
       ASL
       ROL ZP0F6
       ADC ZP0F5
       TAX
       TYA
       ADC ZP0F6
       TAY
       TXA
       ADC FR0
       TAX
       TYA
       ADC FR0+1
       TAY
       TXA
       ADC STARP
       STA ZP0F5
       TYA
       ADC STARP+1
       STA ZP0F6
       BIT ZP0B1
       BPL L0671
       LDX ZP0AF
       STX ARSLVL
       DEC ARSLVL
       LDY #$00
       STY ZP0B1
       LDA XTAB1_20,X
       STA (ZP0F5),Y
       INY
       LDA XTAB1_40,X
       STA (ZP0F5),Y
       INY
       LDA XTAB1_60,X
       STA (ZP0F5),Y
       INY
       LDA XTAB1_80,X
       STA (ZP0F5),Y
       INY
       LDA XTAB1_A0,X
       STA (ZP0F5),Y
       INY
       LDA XTAB1_C0,X
       STA (ZP0F5),Y
       RTS
L0671  INC ARSLVL
       LDX ARSLVL
       LDY #$05
       LDA (ZP0F5),Y
       STA XTAB1_C0,X
       DEY
       LDA (ZP0F5),Y
       STA XTAB1_A0,X
       DEY
       LDA (ZP0F5),Y
       STA XTAB1_80,X
       DEY
       LDA (ZP0F5),Y
       STA XTAB1_60,X
       DEY
       LDA (ZP0F5),Y
       STA XTAB1_40,X
       DEY
       LDA (ZP0F5),Y
       STA XTAB1_20,X
       LSR XTAB3,X
       RTS
;------------------------------
;***                       ***
Y0130  LDA ZP0B0
       BEQ ?L1
       JSR L0679
       STY ZP098
       STA ZP097
?L1    JSR L0679
       SEC
       SBC #$01
       STA ZP0F5
       TYA
       SBC #$00
       STA ZP0F6
       JSR L0663
       LDA ZP0B1
       BPL ?L2
       ORA ZP0B0
       STA ZP0B1
       LDY FR0+5
       LDA FR0+4
       JMP ?L3
?L2    LDA FR0+2
       LDY FR0+3
?L3    LDX ZP0B0
       BEQ ?L5
       DEC ZP0B0
       CPY ZP098
       BCC L0683
       BNE ?L4
       CMP ZP097
       BCC L0683
?L4    LDY ZP098
       LDA ZP097
?L5    SEC
       SBC ZP0F5
       STA FR0+2
       TAX
       TYA
       SBC ZP0F6
       STA FR0+3
       BCC L0683
       TAY
       BNE L0685
       TXA
       BEQ L0683
L0685  JSR L0686
       CLC
       LDA FR0
       ADC ZP0F5
       STA FR0
       LDA FR0+1
       ADC ZP0F6
       STA FR0+1
       BIT ZP0B1
       BPL L0687
L0688  RTS
L0687  JMP L0125
L0679  JSR L0115
       BNE L0688
       TAX
       BNE L0688
L0683  LDA #$05
       JMP ERROR_ROUT
;------------------------------
;***                       ***
Y0128  JSR L0632
L0762  LDA FR0
       STA ZP099
       LDA FR0+1
       STA ZP09A
       LDA FR0+2
       STA ZP0A2
       LDY FR0+3
       STY ZP0A3
       LDY OPSTKX
       BEQ ?L1
       LDA #$80
       STA ZP0B1
       JSR LET_4
       LDA FR0+3
       LDY FR0+2
       ROL ZP0B1
       BCS ?L2
?L1    JSR L0632
       LDA FR0+5
       LDY FR0+4
?L2    CMP ZP0A3
       BCC ?L3
       BNE ?L4
       CPY ZP0A2
       BCS ?L4
?L3    STA ZP0A3
       STY ZP0A2
?L4    CLC
       LDA FR0
       STA ZP09B
       ADC ZP0A2
       TAY
       LDA FR0+1
       STA ZP09C
       ADC ZP0A3
       TAX
       SEC
       TYA
       SBC STARP
       STA ZP0F9
       TXA
       SBC STARP+1
       STA ZP0FA
       JSR MOVE_SUB
       LDA ZP0D3
       JSR FP_VVTP_FR0
       SEC
       LDA ZP0F9
       SBC FR0
       TAY
       LDA ZP0FA
       SBC FR0+1
       TAX
       LDA #$02
       AND ZP0B1
       BEQ L0695
       LDA #$00
       STA ZP0B1
       CPX FR0+3
       BCC L0696
       BNE L0695
       CPY FR0+2
       BCS L0695
L0696  RTS
L0695  STY FR0+2
       STX FR0+3
       JMP L0625
;------------------------------
; ENDE PART 6
;------------------------------

;         .LI ON
;------------------------------
; TURBO-BASIC PART 7
;------------------------------
;         .LI OFF
;------------------------------
;***     COM + DIM         ***
COM_CMD
DIM_CMD LDY STATE_NDX
        CPY STATE_LEN
        BCC ?L1
        RTS
?L1     JSR LET_CMD
        LSR ZP0D2
        BCS ?L4
        SEC
        ROL ZP0D2
        BMI ?L5
        LDA ZP0F5
        ADC #$01
        STA ZP0F5
        STA FR0+2
        LDA ZP0F6
        ADC #$00
        BMI ?L4
        STA FR0+3
        STA ZP0F6
        LDA ZP097
        ADC #$01
        STA FR0+4
        LDA ZP098
        ADC #$00
        STA FR0+5
        BMI ?L4
        LDY #$00
        STY ZP0F7
        STY ZP0F8
        LDY #$10
?L2     LDA ZP0F5
        LSR
        BCC ?L3
        CLC
        LDA ZP0F7
        ADC FR0+4
        STA ZP0F7
        LDA ZP0F8
        ADC FR0+5
        STA ZP0F8
        BMI ?L4
?L3     ROR ZP0F8
        ROR ZP0F7
        ROR ZP0F6
        ROR ZP0F5
        DEY
        BNE ?L2
        ASL ZP0F5
        ROL ZP0F6
        BMI ?L4
        LDX ZP0F6
        LDA ZP0F5
        ASL
        ROL ZP0F6
        BMI ?L4
        ADC ZP0F5
        STA ZP0F5
        TAY
        TXA
        ADC ZP0F6
        STA ZP0F6
        BPL DIM_6
?L4     JMP ERROR_9
?L5     LDA #$00
        STA FR0+2
        STA FR0+3
        LDY ZP0F5
        STY FR0+4
        LDA ZP0F6
        STA FR0+5
        BNE DIM_6
        CPY #$00
        BEQ ?L4
DIM_6   LDX #$8E
        JSR L0703
        SEC
        LDA ZP097
        SBC STARP
        STA FR0
        LDA ZP098
        SBC STARP+1
        STA FR0+1
        JSR L0625
        LDA #$00
        TAY
        LDX ZP0F6
        BEQ ?L8
?L7     STA (ZP097),Y
        INY
        BNE ?L7
        INC ZP098
        DEX
        BNE ?L7
?L8     LDX ZP0F5
        BEQ ?L10
?L9     STA (ZP097),Y
        INY
        DEX
        BNE ?L9
?L10    JMP DIM_CMD
;------------------------------
L0467  JSR L0421
L0402  LDA STMCUR
       STA ZP0BE
       LDA STMCUR+1
       STA ZP0BF
       LDA ZP0A1
       TAX
       ASL
       TAY
       LDA (BAS_LOMEM),Y
       STA STMCUR+1
       INY
       LDA (BAS_LOMEM),Y
?L1    STA STMCUR
       LDY #$01
       TXA
       CMP (STMCUR),Y
       BNE ?L3
       DEY
       LDA (STMCUR),Y
       CMP ZP0A0
       BCS ?L5
?L2    LDY #$02
       LDA (STMCUR),Y
       ADC STMCUR
       BCC ?L1
       INC STMCUR+1
       BCS ?L1
?L3    BCC ?L4
       CLC
       BCC ?L2
?L4    SEC
       RTS
?L5    BNE ?L4
       CLC
       RTS
;------------------------------
L0717  LDA #$C1
       .BY $2C
L0718  LDA #$C2
       TAX
       INY
       LDA (ZP099),Y
       BNE ?L3
       INY
       LDA (ZP099),Y
?L3    EOR #$80
       JSR CALC_VARTAB
       TXA
       CMP (ZP09D),Y
       BEQ L0715
       STA (ZP09D),Y
       LDA ZP099
       LDY #$02
       STA (ZP09D),Y
       INY
       LDA ZP09A
       STA (ZP09D),Y
       JMP L0715
L0421  LDA ZP099
       PHA
       LDA ZP09A
       PHA
       LDA #$00
       TAY
?L4    STA (BAS_LOMEM),Y
       INY
       INY
       BNE ?L4
       LDA STMTAB+1
       STA ZP09A
       LDA STMTAB
L0721  STA ZP099
       LDY #$04
       LDA (ZP099),Y
       CMP #$4F
       BEQ L0717
       CMP #$5D
       BEQ L0718
L0715  LDY #$01
       LDA (ZP099),Y
       ASL
       BCS ?L8
       TAY
       LDA (BAS_LOMEM),Y
       BNE ?L7
       LDA ZP09A
       STA (BAS_LOMEM),Y
       INY
       LDA ZP099
       STA (BAS_LOMEM),Y
?L7    CLC
       LDY #$02
       LDA (ZP099),Y
       ADC ZP099
       BCC L0721
       INC ZP09A
       BCS L0721
?L8    LDA STMTAB
       STA ZP099
       LDA STMTAB+1
       STA ZP09A
       LDY #$00
?L9    LDA (BAS_LOMEM),Y
       BNE ?L10
       LDA ZP09A
       STA (BAS_LOMEM),Y
       INY
       LDA ZP099
       STA (BAS_LOMEM),Y
       JMP ?L11
?L10   STA ZP09A
       INY
       LDA (BAS_LOMEM),Y
       STA ZP099
?L11   INY
       BNE ?L9
       PLA
       STA ZP09A
       PLA
       STA ZP099
       RTS
;------------------------------
ERROR30_1 LDA #$1E
          JMP ERROR_ROUT
L0728     LDA (STMCUR),Y
          INY
          CPY STATE_LEN
          BCS ?L1
          CMP #$1C
          BNE ?L2
          INC STATE_NDX
          JSR Y0189
          LDA ZP0D2
          CMP #$C2
          BNE ERROR30_1
          LDY #$00
          LDA (FR0),Y
          TAX
          INY
          LDA (FR0),Y
          TAY
          TXA
          RTS
?L1       LDA #$00
          TAY
          RTS
?L2       JMP L0543
;------------------------------
;***      RESTORE           ***
RESTORE_CMD JSR L0728
            CPY #$00
            BMI ?L1
            STA DATAZ_PTR
            STY DATAZ_PTR+1
            LDA #$00
            STA DATA_PTR
            RTS
?L1         JMP ERROR_3
;------------------------------
;***         READ           ***
READ_CMD LDA DATAZ_PTR
         STA ZP0A0
         LDA DATAZ_PTR+1
         STA ZP0A1
         JSR L0402
         LDA STMCUR
         STA INBUFF
         LDA STMCUR+1
         STA INBUFF+1
         LDA ZP0BE
         STA STMCUR
         LDA ZP0BF
         STA STMCUR+1
READ_1   LDY #$00
         LDA (INBUFF),Y
         STA DATAZ_PTR
         INY
         LDA (INBUFF),Y
         STA DATAZ_PTR+1
         INY
         LDA (INBUFF),Y
         STA ZP0F5
         STY CIX
         LDY CIX
?L2      INY
         LDA (INBUFF),Y
         STA ZP0F6
         INY
         STY CIX
         LDA (INBUFF),Y
         CMP #$01
         BEQ READ_5
         LDY ZP0F6
         CPY ZP0F5
         BCS ?L3
         DEY
         BCC ?L2
?L3      DEY
         STY CIX
READ_4   LDY #$01
         LDA (INBUFF),Y
         BMI ERROR6_1
         SEC
         LDA CIX
         ADC INBUFF
         STA INBUFF
         LDA #$00
         STA DATA_PTR
         ADC INBUFF+1
         STA INBUFF+1
         BCC READ_1
READ_5   LDA #$00
         STA ZP0F5
?L6      LDA ZP0F5
         CMP DATA_PTR
         BCS ?L8
?L7      INC CIX
         LDY CIX
         LDA (INBUFF),Y
         CMP #$9B
         BEQ READ_4
         CMP #$2C
         BNE ?L7
         INC ZP0F5
         BNE ?L6
?L8      LDA #$40
         STA ZP0A6
         INC CIX
         JMP INPUT_3
;------------------------------
L0754  LDY CIX
       LDA (INBUFF),Y
       CMP #','
       CLC
       BEQ ?L1
       CMP #$9B
?L1    RTS
;------------------------------
ERROR6_1 LDA #$06
         JMP ERROR_ROUT
;------------------------------
;***       INPUT           ***
INPUT_CMD LDA #$3F
          STA ZP0C2
          LDA (STMCUR),Y
          CMP #$0F
          BNE ?L1
          JSR L0746
          JSR INPUT_12
          LDY STATE_NDX
          INC STATE_NDX
          LDA (STMCUR),Y
          CMP #$12
          BNE ?L1
          ROR ZP0B4
?L1       JSR Y0189
          DEC STATE_NDX
          BCC INPUT_2
          JSR L0614
          STA ZP0B4
INPUT_2   JSR SET_INBUFF_580
          JSR L0749
          JSR CHECK_BRK
          LDY #$00
          STY ZP0A6
          STY CIX
INPUT_3   JSR Y0189
          INC STATE_NDX
          LDA ZP0D2
          BMI INPUT_4
          JSR CALL_ASC_FP
          BCS ERROR8_1
          JSR L0754
          BNE ERROR8_1
          JSR L0625
          JMP INPUT_7
CHECK_BRK LDA BRKKEY
          BEQ ?L1
          RTS
?L1       DEC BRKKEY
          JMP BRK_BAS_V
ERROR8_1  LDA #$00
          STA ZP0B4
          LDA #$08
          JMP ERROR_ROUT
INPUT_4   LDY #$00
          LDA #$11
          STA L0758
          STY OPSTKX
          STY ZP0B0
          STY ARSLVL
          STY ZP0B1
          JSR L0125
          DEC CIX
          LDA CIX
          STA ZP0F5
          LDX #$FF
?L5       INX
          INC CIX
          LDY CIX
          LDA (INBUFF),Y
          CMP #$9B
          BEQ ?L6
          CMP #$2C
          BNE ?L5
          BIT ZP0A6
          BVC ?L5
?L6       LDY ZP0F5
          LDA STATE_NDX
          PHA
          TXA
          LDX #$F3
          JSR L0761
          PLA
          STA STATE_NDX
          JSR L0762
INPUT_7   BIT ZP0A6
          BVC ?L8
          INC DATA_PTR
          LDX STATE_NDX
          INX
          CPX STATE_LEN
          BCS ?L9
          JSR L0754
          BCC ?L11
          JMP READ_4
?L8       LDX STATE_NDX
          INX
          CPX STATE_LEN
          BCC ?L10
?L9       JSR SET_INBUFF_580
          LDA #$00
          STA ZP0B4
          RTS
?L10      JSR L0754
          BCC ?L11
          JMP INPUT_2
?L11      INC CIX
          JMP INPUT_3
INPUT_12  LDX #$00
          LDA FR0
          STA ICBAL,X
          LDA FR0+1
          STA ICBAH,X
          LDA FR0+2
          STA ICBLL,X
          LDA FR0+3
          STA ICBLH,X
          LDA #$0B
          JMP L0546
;------------------------------
       ORG OS_RAM_D8
;------------------------------
;***       MOVE           ***
MOVE_CMD JSR L0399
         STA ZP0A2
         STY ZP0A3
         JMP MOVE_SUB
;------------------------------
;***      -MOVE           ***
MOVE_NEG_CMD JSR L0399
             STA ZP0A2
             STY ZP0A3
             JMP MOVE_D_SUB
;------------------------------
;***          +           ***
ADDIT_FUN JSR L0768
          JSR L0265
          JMP L0769
;------------------------------
;***          -           ***
SUBTR_FUN JSR L0768
          JSR L0320
          JMP L0769
;------------------------------
;***          *           ***
MULTIPL_FUN JSR L0768
            JSR L0287
            JMP L0769
;------------------------------
;***          /           ***
DIVIS_FUN JSR L0768
          JSR L0317
          JMP L0769
;------------------------------
;***                      ***
Y0129  LDX ARSLVL
       LDA XTAB1_20,X
       BEQ ?L1
       EOR #$80
       STA XTAB1_20,X
?L1    RTS
;------------------------------
;***         <=           ***
KL_GL_FUN JSR L0771
          BCC EINS_FUN
          BEQ EINS_FUN
          BCS NULL_FUN
;------------------------------
;***         <>           ***
KL_GR_FUN JSR L0771
          BEQ NULL_FUN
          BNE EINS_FUN
;------------------------------
;***         <            ***
KLEIN_FUN JSR L0771
          BCC EINS_FUN
          BCS NULL_FUN
;------------------------------
;***         >            ***
GR_FUN JSR L0771
       BCC NULL_FUN
       BEQ NULL_FUN
       BCS EINS_FUN
;------------------------------
;***         >=           ***
GR_GL_FUN JSR L0771
          BCC NULL_FUN
          BCS EINS_FUN
;------------------------------
;***         =            ***
GL_FUN JSR L0771
       BEQ EINS_FUN
       BNE NULL_FUN
;------------------------------
;***       AND            ***
AND_FUN DEC ARSLVL
        LDX ARSLVL
        DEC ARSLVL
        LDA XTAB1_20,X
        AND XTAB1_21,X
        ASL
        BEQ NULL_FUN
        BNE EINS_FUN
;------------------------------
;***       OR             ***
OR_FUN DEC ARSLVL
       LDX ARSLVL
       DEC ARSLVL
       LDA XTAB1_20,X
       ORA XTAB1_21,X
       ASL
       BEQ NULL_FUN
       BNE EINS_FUN
;------------------------------
;***      NOT            ***
NOT_FUN LDX ARSLVL
        DEC ARSLVL
        LDA XTAB1_20,X
        BEQ EINS_FUN
;------------------------------
;***         %0          ***
NULL_FUN LDA #$00
         TAY
         BEQ L0774
;------------------------------
;***     %2 + %3         ***
DREI_FUN LDY #$03
         .BY $2C
ZWEI_FUN LDY #$02
         LDA #$40
         BNE L0774
;------------------------------
;***         %1          ***
EINS_FUN LDA #$40
L0775    LDY #$01
L0774    INC ARSLVL
         LDX ARSLVL
         STA XTAB1_20,X
         TYA
         STA XTAB1_40,X
         LDA #$00
         STA XTAB3,X
         STA XTAB1_60,X
         STA XTAB1_80,X
         STA XTAB1_A0,X
         STA XTAB1_C0,X
         RTS
;------------------------------
;***       SGN           ***
SGN_FUN LDX ARSLVL
        DEC ARSLVL
        LDA XTAB1_20,X
        ASL
        BEQ NULL_FUN
        LDA #$80
        ROR
        BNE L0775
;------------------------------
L0771   LDY OPSTKX
        LDA L0776,Y
        CMP #$2F
        BCC ?L1
        JMP L0778
?L1     LDY ARSLVL
        DEC ARSLVL
        LDX ARSLVL
        DEC ARSLVL
        LDA XTAB1_20,X
        CMP XTAB1_20,Y
        BNE ?L4
        ASL
        BCC ?L2
        INX
        DEY
?L2     LDA XTAB1_40,X
        CMP XTAB1_40,Y
        BNE ?L3
        LDA XTAB1_60,X
        CMP XTAB1_60,Y
        BNE ?L3
        LDA XTAB1_80,X
        CMP XTAB1_80,Y
        BNE ?L3
        LDA XTAB1_A0,X
        CMP XTAB1_A0,Y
        BNE ?L3
        LDA XTAB1_C0,X
        CMP XTAB1_C0,Y
?L3     RTS
?L4     ORA XTAB1_20,Y
        BPL ?L3
        ROR
        EOR #$80
        ROL
        RTS
L0778   JSR L0632
        JSR FR0_TO_FR1
        JSR L0632
        LDY #$00
?L6     LDA FR0+2
        BNE ?L7
        LDA FR0+3
        BEQ ?L14
        DEC FR0+3
?L7     DEC FR0+2
        TAX
?L14    PHP
        LDA FR1+2
        BNE ?L8
        LDA FR1+3
        BEQ ?L13
        DEC FR1+3
?L8     DEC FR1+2
        PLP
        BEQ ?L11
        LDA (FR0),Y
        CMP (FR1),Y
        BNE ?L10
        INC FR0
        BNE ?L9
        INC FR0+1
?L9     INC FR1
        BNE ?L6
        INC FR1+1
        BNE ?L6
?L10    BCS ?L12
?L11    INY
        CLC
?L12    RTS
?L13    PLP
        SEC
        RTS
;------------------------------
; ENDE PART 7
;------------------------------

;         .LI ON
;------------------------------
; TURBO-BASIC PART 8
;------------------------------
;         .LI OFF
;------------------------------
;***      LEN              ***
LEN_FUN JSR L0632
        LDA FR0+2
        LDY FR0+3
L0791   STA FR0
        STY FR0+1
L0118   JSR L0124
L0792   LDA #$00
        STA ZP0D2
        STA ZP0D3
        JMP L0125
;------------------------------
;***       PEEK            ***
PEEK_FUN JSR L0115
         LDY #$00
         LDA (FR0),Y
         JMP L0791
;------------------------------
;***       FRE             ***
FRE_FUN DEC ARSLVL
        SEC
        LDA MEMTOP
        SBC BASMEMTOP
        TAX
        LDA MEMTOP+1
        SBC BASMEMTOP+1
        TAY
        TXA
        JMP L0791
;------------------------------
;***       VAL            ***
VAL_FUN JSR L0595
        LDA #$00
        STA CIX
        JSR CALL_ASC_FP
        JSR L0596
        BCC L0792
        JMP ERROR18_1
;------------------------------
;***       ASC            ***
ASC_FUN JSR L0632
        LDY #$00
        LDA (FR0),Y
        JMP L0791
;------------------------------
;***       DEC            ***
DEC_FUN JSR L0595
        LDY #$00
        STY CIX
        STY FR0
        STY FR0+1
?L1     JSR L0794
        BCC ?L1
        JSR L0596
        JMP L0118
;------------------------------
;***       ADR            ***
ADR_FUN JSR L0632
        JMP L0118
;------------------------------
;***      PADDLE          ***
PADDLE_FUN LDA #$00
           BEQ GET_PORTS
;------------------------------
;***      STICK           ***
STICK_FUN  LDA #$08
           BNE GET_PORTS
;------------------------------
;***      PTRIG           ***
PTRIG_FUN  LDA #$0C
           BNE GET_PORTS
;------------------------------
;***      STRIG           ***
STRIG_FUN  LDA #$14
GET_PORTS  STA ZP0EC
           JSR L0115
           BNE ERROR3_3
           CMP #$08
           BCS ERROR3_3
           ADC ZP0EC
           TAX
           LDA PADDL0,X
L0864      LDY #$00
           JMP L0791
ERROR3_3   JMP ERROR_3
;------------------------------
L0803  JSR SET_INBUFF_580
       LDY #$00
       LDA FR0+1
       BEQ ?L1
       JSR ?L2
?L1    LDA FR0
?L2    PHA
       LSR
       LSR
       LSR
       LSR
       JSR ?L3
       PLA
       AND #$0F
?L3    ORA #$30
       CMP #$3A
       BCC ?L4
       ADC #$06
?L4    STA (INBUFF),Y
       INY
       RTS
;------------------------------
;***      HEX$            ***
HEX_FUN JSR L0115
        JSR L0803
        LDA #$80
        BNE L0804
;------------------------------
;***      STR$            ***
STR_FUN JSR L0663
        JSR CALL_FP_ASC
        LDY #$FF
?L1     INY
        LDA (INBUFF),Y
        BPL ?L1
        AND #$7F
        STA (INBUFF),Y
        INY
        LDA INBUFF
        BNE L0804
;------------------------------
;***       INKEY$         ***
INKEY_FUN LDA CH
          LDY #$00
          CMP #$C0
          BCS L0807
          LDX #$0E
?L1       CMP KEY_TAB,X
          BEQ L0807
          DEX
          BPL ?L1
          JSR GETKEY_1
          JMP L0810
;------------------------------
;***       CHR$            ***
CHR_FUN JSR L0115
        LDA FR0
L0810   STA ADR_5C0
        LDY #$01
L0807   LDA #<ADR_5C0
L0804   LDX #>ADR_5C0
L0597   STX FR0+1
        STA FR0
        STY FR0+2
        LDA #$00
        STA FR0+3
        STA ZP0D3
        LDA #$83
        STA ZP0D2
        JMP L0125
;------------------------------
;***       RND( + RND      ***
RND_KL_FUN DEC ARSLVL
RND_FUN    LDA #$3F
           STA FR0
           LDX #$05
?L1        LDA RANDOM
           AND #$F0
           CMP #$A0
           BCS ?L1
           STA FR1
?L2        LDA RANDOM
           AND #$0F
           CMP #$0A
           BCS ?L2
           ORA FR1
           STA FR0,X
           DEX
           BNE ?L1
           JSR L0262
           JMP L0792
;------------------------------
;***         RAND         ***
RAND_FUN JSR RND_FUN
         JSR MULTIPL_FUN
         JMP INT_FUN
;------------------------------
;***         ABS          ***
ABS_FUN LDX ARSLVL
        LDA XTAB1_20,X
        AND #$7F
        STA XTAB1_20,X
        RTS
;------------------------------
;***         FRAC         ***
FRAC_FUN JSR L0663
         LDA FR0
         AND #$7F
         SEC
         SBC #$40
         BCC L0817
         TAX
         LDA #$00
         CPX #$05
         BCC ?L1
         LDX #$04
?L1      STA FR0+1,X
         DEX
         BPL ?L1
         JSR L0262
         JMP L0125
L0817    INC ARSLVL
         RTS
;------------------------------
;***   DIV + TRUNC        ***
DIV_FUN   JSR DIVIS_FUN
TRUNC_FUN JSR L0663
          LDA FR0
          AND #$7F
          SEC
          SBC #$40
          BCC INT_5
          TAX
          LDA #$00
?L1       CPX #$04
          BCS INT_3
          STA FR0+2,X
          INX
          BCC ?L1
;------------------------------
;***         INT          ***
INT_FUN JSR L0663
        LDA FR0
        AND #$7F
        SEC
        SBC #$40
        BCC INT_4
        TAX
        CPX #$04
        BCS L0817
        LDA #$00
        TAY
?L1     ORA FR0+2,X
        STY FR0+2,X
        INX
        CPX #$04
        BNE ?L1
        BIT FR0
        BPL INT_3
        TAY
        BEQ INT_3
INT_2   LDA #$C0
        STA FR1
        LDY #$01
        STY FR1+1
        DEY
        STY FR1+2
        STY FR1+3
        STY FR1+4
        STY FR1+5
        JSR L0265
INT_3   JMP L0125
INT_4   ASL FR0
INT_5   JSR CLEAR_FR0
        BCC INT_3
        BCS INT_2
;------------------------------
;***         SIN          ***
SIN_FUN JSR L0663
        JSR L0826
        JMP L0827
;------------------------------
;***         COS          ***
COS_FUN JSR L0663
        JSR L0828
        JMP L0827
;------------------------------
;***         ATN          ***
ATN_FUN JSR L0663
        JSR L0829
        JMP L0827
;------------------------------
;***         LOG          ***
LOG_FUN JSR L0663
        JSR L0830
        JMP L0827
;------------------------------
;***         CLOG         ***
CLOG_FUN JSR L0663
         JSR L0831
         JMP L0827
;------------------------------
;***         EXP          ***
EXP_FUN JSR L0663
        JSR L0832
        JMP L0827
;------------------------------
;***         SQR          ***
SQR_FUN JSR L0663
        JSR L0833
        JMP L0827
;------------------------------
NULL_1   JMP NULL_FUN
EINS_1   JMP EINS_FUN
POWER_1  LDA FR1
         BPL NULL_1
ERROR3_4 JMP ERROR_3
;------------------------------
;***          ^           ***
POWER_FUN  JSR L0768
           LDA FR1
           BEQ EINS_1
           LDA FR0
           BEQ POWER_1
           BPL POWER_4
           AND #$7F
           STA FR0
           LDA FR1
           AND #$7F
           SEC
           SBC #$40
           BCC ERROR3_4
           LDX #$04
           CMP #$04
           BEQ POWER_3
           BCS POWER_4
           TAX
           TAY
POWER_2    LDA FR1+2,Y
           BNE ERROR3_4
           INY
           CPY #$04
           BNE POWER_2
POWER_3    LDA FR1+1,X
           LSR
           BCS POWER_5
POWER_4    CLC
POWER_5    LDA #$00
           ROR
           PHA
           LDA FR1
           CMP #$40
           BNE POWER_10
           LDA FR1+2
           ORA FR1+3
           ORA FR1+4
           ORA FR1+5
           BNE POWER_10
           LDA FR1+1
           AND #$F0
           LSR
           STA ZP0FC
           LSR
           LSR
           ADC ZP0FC
           STA ZP0FC
           LDA FR1+1
           AND #$0F
           ADC ZP0FC
           STA ZP0FC
           JSR FR0_TO_5E0
           LSR ZP0FC
           BCS POWER_6
           JSR FR0_EINS
POWER_6    JSR FR0_TO_5E6
           LDA ZP0FC
           BEQ POWER_11
           JSR ADR_5E0_FR0
POWER_7    JSR L0311
           BCS POWER_8
           LSR ZP0FC
           BCC POWER_7
           JSR FR0_TO_5E0
           JSR ADR_5E6_FR1
           JSR L0287
           BCC POWER_6
POWER_8    JMP ERROR_11
POWER_9    JMP ERROR_3
POWER_10   LDA FR1+5
           PHA
           LDA FR1+4
           PHA
           LDA FR1+3
           PHA
           LDA FR1+2
           PHA
           LDA FR1+1
           PHA
           LDA FR1
           PHA
           JSR L0831
           BCS POWER_9
           PLA
           STA FR1
           PLA
           STA FR1+1
           PLA
           STA FR1+2
           PLA
           STA FR1+3
           PLA
           STA FR1+4
           PLA
           STA FR1+5
           JSR L0287
           BCS POWER_8
           JSR L0849
           BCS POWER_8
POWER_11   PLA
           BPL POWER_12
           ORA FR0
           STA FR0
POWER_12   JMP L0125
;------------------------------
;***     DEG + RAD        ***
DEG_CMD LDA #$06
        .BY $2C
RAD_CMD LDA #$00
        STA RADFLG
        RTS
;------------------------------
L0851  JSR L0115  
       STA FR1
       STY FR1+1
       JMP L0115  
;------------------------------
;***          &            ***
AND_BIN_FUN JSR L0851
            TYA
            AND FR1+1
            TAY
            LDA FR1
            AND FR0
            JMP L0791
;------------------------------
;***          !           ***
OR_BIN_FUN JSR L0851
           TYA
           ORA FR1+1
           TAY
           LDA FR1
           ORA FR0
           JMP L0791
;------------------------------
;***         EXOR         ***
EXOR_BIN_FUN JSR L0851
             TYA
             EOR FR1+1
             TAY
             LDA FR1
             EOR FR0
             JMP L0791
;------------------------------
KEY_TAB .BY $9A,$98,$9D,$9B,$B3,$B5,$B0,$B2
        .BY $A6,$3C,$7C,$BC,$27,$67,$A7
;------------------------------
;***       PAUSE          ***
PAUSE_CMD JSR L0543
?L1       LDA RTCLOK+2
?L2       LDY BRKKEY
          BEQ ?L4
          CMP RTCLOK+2
          BEQ ?L2
          LDA FR0
          BNE ?L3
          DEC FR0+1
          BMI ?L4
?L3       DEC FR0
          JMP ?L1
?L4       RTS
;------------------------------
MOD_1  LDX ARSLVL
       DEX
       INC ARSLVL
       INC ARSLVL
       CLC
?L2    LDA XTAB3,X
       STA XTAB3+2,X
       LDA XTAB3+1,X
       STA XTAB3+3,X
       TXA
       ADC #$20
       TAX
       BCC ?L2
       RTS
;------------------------------
;***         MOD          ***
MOD_FUN JSR MOD_1
        JSR DIV_FUN
        JSR MULTIPL_FUN
        JMP SUBTR_FUN
;------------------------------
;***         ERR          ***
ERR_FUN LDA ERRSAV
        JMP L0864
;------------------------------
;***         ERL          ***
ERL_FUN LDA STOPLN
        LDY STOPLN+1
        JMP L0791
;------------------------------
;***      PRINT + ?       ***
PRINT_1   INC PRINT_TAB
PRINT_CMD LDA PRINT_TAB
          BEQ PRINT_1
          STA ZP0AF
          LDA #$00
          STA ZP094
PRINT_2   LDY STATE_NDX
          LDA (STMCUR),Y
          CMP #$12
          BEQ ?L4
          CMP #$16
          BEQ PRINT_8
          CMP #$14
          BEQ PRINT_8
          CMP #$15
          BEQ PRINT_7
          CMP #$1C
          BEQ ?L6
          JSR LET_CMD
          DEC STATE_NDX
          LDX ARSLVL
          LDA XTAB3,X
          BMI ?L3
          JSR STR_FUN
?L3       JSR L0632
          LDX ZP0B5
          JSR L0555
          LDA FR0
          STA ICBAL,X
          LDA FR0+1
          STA ICBAH,X
          LDA FR0+2
          STA ICBLL,X
          CLC
          ADC ZP094
          STA ZP094
          LDA FR0+3
          STA ICBLH,X
          ORA FR0+2
          BEQ PRINT_2
          LDA #$0B
          JSR L0546
          JMP PRINT_2
?L4       LDY ZP094
          INY
          CPY ZP0AF
          BCC ?L5
          CLC
          LDA PRINT_TAB
          ADC ZP0AF
          STA ZP0AF
          BCC ?L4
?L5       LDY ZP094
          CPY ZP0AF
          BCS PRINT_7
          JSR L0510
          INC ZP094
          JMP ?L5
?L6       JSR L0614
          STA ZP0B5
          DEC STATE_NDX
          JMP PRINT_2
L0614     INC STATE_NDX
          JMP L0543
PRINT_7   INC STATE_NDX
          JMP PRINT_2
PRINT_8   LDY STATE_NDX
          DEY
          LDA (STMCUR),Y
          CMP #$15
          BEQ ?L9
          CMP #$12
          BEQ ?L9
          JSR WRITE_EOL
?L9       LDA #$00
          STA ZP0B5
          RTS
;------------------------------
;***       LPRINT         ***
LPRINT_CMD LDA #<PRINTER_NAME
           STA INBUFF
           LDA #>PRINTER_NAME
           STA INBUFF+1
           DEC ZP0DB
           LDX #$07
           STX ZP0B5
           LDA #$00
           LDY #$08
           JSR OPENIOCB
           JSR IO_STATUS
           JSR PRINT_CMD
           JMP IO_CLOSE
;------------------------------
; ENDE PART 8
;------------------------------

;         .LI ON
;------------------------------
; TURBO-BASIC PART 9
;------------------------------
;         .LI OFF
;------------------------------
;***    UINSTR + INSTR    ***
UINSTR_FUN LDA #$5F
           .BY $2C
INSTR_FUN  LDA #$FF
           STA ZP0DF
           LDY ZP0B0
           DEY
           TYA
           BEQ ?L1
           JSR L0115
?L1        STA ZP0DA
           STY ZP0DB
           JSR L0632
           JSR FR0_TO_FR1
           JSR L0632
           CLC
           LDA FR0
           ADC ZP0DA
           STA FR0
           LDA FR0+1
           ADC ZP0DB
           STA FR0+1
           BCS NULL_2
           SEC
           LDA FR0+2
           SBC ZP0DA
           STA FR0+2
           LDA FR0+3
           SBC ZP0DB
           STA FR0+3
           BCC NULL_2
           ORA FR0+2
           BEQ NULL_2
           SEC
           LDA FR0+2
           SBC FR1+2
           STA ZP0DC
           LDA FR0+3
           SBC FR1+3
           STA ZP0DD
           BCS INSTR_2
NULL_2     JMP NULL_FUN
INSTR_2    INC ZP0DA
           BNE ?L3
           INC ZP0DB
?L3        LDY #$00
           LDA (FR1),Y
           EOR (FR0),Y
           AND ZP0DF
           BNE ?L6
           LDA FR0
           STA FR0+4
           LDA FR0+1
           STA FR0+5
           LDA FR1
           STA FR1+4
           LDA FR1+1
           STA FR1+5
           LDA FR1+3
           STA ZP0DE
           LDX FR1+2
           INX
?L4        DEX
           BNE ?L5
           DEC ZP0DE
           BMI ?L9
?L5        LDA (FR0+4),Y
           EOR (FR1+4),Y
           AND ZP0DF
           BNE ?L6
           INY
           BNE ?L4
           INC FR0+5
           INC FR1+5
           JMP ?L4
?L6        INC FR0
           BNE ?L7
           INC FR0+1
?L7        LDA ZP0DC
           BNE ?L8
           DEC ZP0DD
           BMI NULL_2
?L8        DEC ZP0DC
           JMP INSTR_2
?L9        LDA ZP0DA
           LDY ZP0DB
           JMP L0791
;------------------------------
CIRCLE_4  STA FR0+2
          STA FR0+3
          LDY #$08
?L5       ASL ZP0E6,X
          ROL FR1+5,X
          ROL FR0+2
          BCC ?L6
          CLC
          LDA ZP0E6,X
          ADC FR0+3
          STA ZP0E6,X
          BCC ?L6
          INC FR1+5,X
?L6       DEY
          BNE ?L5
          RTS
;------------------------------
ERROR3_5  JMP ERROR_3  
;------------------------------
;***       CIRCLE         ***
CIRCLE_CMD JSR L0399
           BNE ERROR3_5
           PHA
           LDY STATE_NDX
           INY
           CPY STATE_LEN
           BCS ?L1
           JSR L0543
           BNE ERROR3_5
?L1        PLA
           BNE ?L2
           LDA #$01
?L2        STA FR0+1
           LDX #$16
           LDA #$00
?L3        STA FR0+2,X
           DEX
           BPL ?L3
           LDA FR0+1
           STA FR1
           INX
           JSR CIRCLE_4
           LDA FR0
           LDX #$02
           JSR CIRCLE_4
           LDA FR0+1
           STA FR0+2
           LDY #$08
?L7        ASL ZP0DC
           ROL ZP0DB
           ROL ZP0DA
           ASL FR0+2
           BCC ?L8
           CLC
           LDA ZP0DC
           ADC ZP0E8
           STA ZP0DC
           LDA ZP0DB
           ADC ZP0E7
           STA ZP0DB
           BCC ?L8
           INC ZP0DA
?L8        DEY
           BNE ?L7
CIRCLE_9   JSR CIRCLE_15
           JSR CIRCLE_17
           JSR CIRCLE_15
           JSR CIRCLE_19
           JSR CIRCLE_16
           JSR CIRCLE_17
           JSR CIRCLE_16
           JSR CIRCLE_19
           BIT FR1+2
           BMI ?L12
           INC FR1+1
           CLC
           LDA ZP0EB
           ADC ZP0E6
           STA ZP0EB
           LDA ZP0EA
           ADC FR1+5
           STA ZP0EA
           BCC ?L10
           INC ZP0E9
?L10       SEC
           LDX #$02
?L11       LDA FR1+2,X
           SBC ZP0E9,X
           STA FR1+2,X
           DEX
           BPL ?L11
           BMI CIRCLE_9
?L12       LDA FR1
           BEQ CRS_HOME
           DEC FR1
           SEC
           LDA ZP0DC
           SBC ZP0E8
           STA ZP0DC
           LDA ZP0DB
           SBC ZP0E7
           STA ZP0DB
           BCS ?L13
           DEC ZP0DA
?L13       CLC
           LDX #$02
?L14       LDA FR1+2,X
           ADC ZP0DA,X
           STA FR1+2,X
           DEX
           BPL ?L14
           BMI CIRCLE_9
CIRCLE_15  CLC
           LDA ZP099
           ADC FR1
           STA COLCRS
           LDA ZP09A
           ADC #$00
           STA COLCRS+1
           RTS
CRS_HOME   LDX #$00
           STX ROWCRS
           STX COLCRS
           STX COLCRS+1
           RTS
CIRCLE_16  SEC
           LDA ZP099
           SBC FR1
           STA COLCRS
           LDA ZP09A
           SBC #$00
           STA COLCRS+1
           RTS
CIRCLE_17  CLC
           LDA ZP09B
           ADC FR1+1
           STA ROWCRS
           LDA ZP09C
           ADC #$00
           BEQ CIRCLE_20
CIRCLE_18  RTS
CIRCLE_19  SEC
           LDA ZP09B
           SBC FR1+1
           STA ROWCRS
           LDA ZP09C
           SBC #$00
           BNE CIRCLE_18
CIRCLE_20  LDY BAS_COLOR
           LDX #$60
           JSR PUTBYTE
           CPY #$80
           BNE CIRCLE_18
           JMP L0641
;------------------------------
L1014  STY ZP096
       LDX #$00
       STX ZP0AF
L0923  STA ZP095
       LDX CIX
       LDY #$00
       LDA (ZP095),Y
       BEQ L0916  
?L2    LDA ADR_580,X
       AND #$7F
       INX
       EOR (ZP095),Y
       BNE ?L3
       INY
       BNE ?L2
?L3    ASL
       BEQ L0919  
       BCS L0920  
?L4    INY
       LDA (ZP095),Y
       BPL ?L4
Y1007  SEC
L0920  INC ZP0AF
       BEQ ERROR4_1
       TYA
       ADC ZP095
       BCC L0923  
       INC ZP096
       BCS L0923  
L0919  CLC
       RTS
L0916  SEC
       RTS
;------------------------------
ERROR4_1 LDA #$04
         JMP ERROR_ROUT
;------------------------------
L0963  LDX #$00
       STX ZP0AF
       STY ZP096
?L1    STA ZP095
       LDX CIX
       LDY #$01
       LDA (ZP095),Y
       BEQ L0916  
?L2    LDA ADR_580,X
       AND #$7F
       INX
       CMP #$2E
       BEQ L0919  
       EOR (ZP095),Y
       BNE ?L3
       INY
       BNE ?L2
?L3    ASL
       BEQ L0919  
       BCS ?L5
?L4    INY
       LDA (ZP095),Y
       BPL ?L4
?L5    INC ZP0AF
       SEC
       TYA
       ADC ZP095
       BCC ?L1
       INC ZP096
       BCS ?L1
;------------------------------
       ORG OS_RAM_E4
;------------------------------
;***         LET          ***
LET_CMD LDY #$00
        LDA #$11
        STA L0758
        STY OPSTKX
        STY ZP0B0
        STY ARSLVL
        STY ZP0B1
LET_1   JSR Y0189
        BCS ?L2
        JSR L0125
        JMP LET_1
?L2     STA EXSVOP
        TAX
        LDA L0441,X
        STA TVSCIX
LET_3   LDY OPSTKX
        LDX L0758,Y
        LDA L0931,X
        CMP TVSCIX
        BCC LET_5
        TAX
        BEQ LET_6
LET_4   LDA L0758,Y
        DEC OPSTKX
        JSR JUMP_FUNK_TAB
        JMP LET_3
LET_5   LDA EXSVOP
        INY
        STA L0758,Y
        STY OPSTKX
        JMP LET_1
LET_6   RTS
;------------------------------
JUMP_FUNK_TAB
        ASL
        STA FTABPTR+1
FTABPTR JMP (FUNCTION_TAB-$B)
;------------------------------
Y0189  LDY STATE_NDX
       INC STATE_NDX
       LDA (STMCUR),Y
       BMI L0933  
       BEQ L0934  
       CMP #$0F
       BCC FP_RAM_FR0
       BEQ L0746
       RTS
;------------------------------
FP_RAM_FR0 INY
           LDA (STMCUR),Y
           STA FR0
           INY
           LDA (STMCUR),Y
           STA FR0+1
           INY
           LDA (STMCUR),Y
           STA FR0+2
           INY
           LDA (STMCUR),Y
           STA FR0+3
           INY
           LDA (STMCUR),Y
           STA FR0+4
           INY
           LDA (STMCUR),Y
           STA FR0+5
           INY
           STY STATE_NDX
           LDA #$00
           STA ZP0D2
           RTS
;------------------------------
L0746  INY
       LDA (STMCUR),Y
       LDX #$8A
L0761  STA FR0+2
       STA FR0+4
       INY
       TYA
       CLC
       ADC LINZBS,X  
       STA FR0
       LDA #$00
       STA FR0+3
       STA FR0+5
       ADC LINZBS+1,X  
       STA FR0+1
       TYA
       ADC FR0+2
       TAY
       LDA #$83
       STA ZP0D2
       STY STATE_NDX
       CLC
       RTS
;------------------------------
L0934       INY
            INC STATE_NDX
            LDA (STMCUR),Y
L0933       EOR #$80
FP_VVTP_FR0 STA ZP0D3
            JSR CALC_VARTAB
            LDA (ZP09D),Y
            STA ZP0D2
            LDY #$02
            LDA (ZP09D),Y
            STA FR0
            INY
            LDA (ZP09D),Y
            STA FR0+1
            INY
            LDA (ZP09D),Y
            STA FR0+2
            INY
            LDA (ZP09D),Y
            STA FR0+3
            INY
            LDA (ZP09D),Y
            STA FR0+4
            INY
            LDA (ZP09D),Y
            STA FR0+5
            RTS
;------------------------------
L0632    JSR L0663
L0686    LDA #$02
         BIT ZP0D2
         BNE L0935
         ORA ZP0D2
         STA ZP0D2
         LSR
         BCC ERROR_9
         CLC
         LDA FR0
         ADC STARP
         STA FR0
         TAY
         LDA FR0+1
         ADC STARP+1
         STA FR0+1
L0935    RTS
L0490    JSR L0543
         BPL L0935
         LDA #$07
         JMP ERROR_ROUT
L0399    JSR L0543
         STA ZP099
         STY ZP09A
L0119    JSR L0543
         STA ZP09B
         STY ZP09C
L0543    JSR LET_CMD
L0115    JSR L0663
         JSR L0431
         BCS ERROR_3
         LDA FR0
         LDY FR0+1
         RTS
L0540    JSR L0543
         BEQ L0935
ERROR_3  LDA #$03
         .BY $2C
ERROR_9  LDA #$09
         .BY $2C
ERROR_11 LDA #$0B
         .BY $2C
ERROR_10 LDA #$0A
         JMP ERROR_ROUT
;------------------------------
L0769  BCS ERROR_11
L0827  BCS ERROR_3
L0125  INC ARSLVL
       LDY ARSLVL
       CPY #$20
       BCS ERROR_10
       LDA FR0+5
       STA XTAB1_C0,Y  
       LDA FR0+4
       STA XTAB1_A0,Y  
       LDA FR0+3
       STA XTAB1_80,Y  
       LDA FR0+2
       STA XTAB1_60,Y  
       LDA FR0+1
       STA XTAB1_40,Y  
       LDA FR0
       STA XTAB1_20,Y  
       LDA ZP0D3
       STA XTAB1,Y
       LDA ZP0D2
       STA XTAB3,Y  
       RTS
L0644  JSR LET_CMD
L0663  LDY ARSLVL
L0940  DEC ARSLVL
       LDA XTAB1_C0,Y  
       STA FR0+5
       LDA XTAB1_A0,Y  
       STA FR0+4
       LDA XTAB1_80,Y  
       STA FR0+3
       LDA XTAB1_60,Y  
       STA FR0+2
       LDA XTAB1_40,Y  
       STA FR0+1
       LDA XTAB1_20,Y  
       STA FR0
       LDA XTAB1,Y
       STA ZP0D3
       LDA XTAB3,Y  
       STA ZP0D2
       RTS
L0768  DEC ARSLVL
       LDY ARSLVL
       LDA XTAB1_C1,Y  
       STA FR1+5
       LDA XTAB1_A1,Y  
       STA FR1+4
       LDA XTAB1_81,Y  
       STA FR1+3
       LDA XTAB1_61,Y  
       STA FR1+2
       LDA XTAB1_41,Y  
       STA FR1+1
       LDA XTAB1_21,Y  
       STA FR1
       JMP L0940  
L0625  LDA ZP0D3
       JSR CALC_VARTAB  
       LDA ZP0D2
       STA (ZP09D),Y
       INY
       LDA ZP0D3
       STA (ZP09D),Y
       INY
       LDA FR0
       STA (ZP09D),Y
       INY
       LDA FR0+1
       STA (ZP09D),Y
       INY
       LDA FR0+2
       STA (ZP09D),Y
       INY
       LDA FR0+3
       STA (ZP09D),Y
       INY
       LDA FR0+4
       STA (ZP09D),Y
       INY
       LDA FR0+5
       STA (ZP09D),Y
       RTS
;------------------------------
CALC_VARTAB ASL
            ROL
            ROL
            ROL
            TAY
            ROR
            AND #$F8
            CLC
            ADC VVTP
            STA ZP09D
            TYA
            AND #$07
            ADC VVTP+1
            STA ZP09E
            LDY #$00
            RTS
;------------------------------
NEW_BAS_PTR LDA #$00
            STA MEOLFLG
            STA PROG_CLR
            LDA MEMLO
            LDY MEMLO+1
            STA BAS_LOMEM
            STY BAS_LOMEM+1
            INY
            STA VNTP
            STY VNTP+1
            STA VNTD
            STY VNTD+1
            CLC
            ADC #$01
            BCC ?L1
            INY
?L1         STA VVTP
            STY VVTP+1
            STA STMTAB
            STY STMTAB+1
            STA STMCUR
            STY STMCUR+1
            CLC
            ADC #$03
            BCC ?L2
            INY
?L2         STA STARP
            STY STARP+1
            STA RUNSTK
            STY RUNSTK+1
            STA BASMEMTOP
            STY BASMEMTOP+1
            STA APPMHI
            STY APPMHI+1
            LDA #$00
            TAY
            STA (VNTD),Y
            STA (STMCUR),Y
            INY
            LDA #$80
            STA (STMCUR),Y
            INY
            LDA #$03
            STA (STMCUR),Y
            LDA #$0A
            STA PRINT_TAB
            JMP TRACE_OFF
;------------------------------
; ENDE PART 9
;------------------------------

;         .LI ON
;------------------------------
; TURBO-BASIC PART 10
;------------------------------
;         .LI OFF
;------------------------------
L0031  LDX #$FF
       TXS
       CLD
       LDA PROG_CLR
       BEQ L0948  
;------------------------------
;***         NEW           ***
NEW_CMD  JSR NEW_BAS_PTR  
L0948    JSR CLR_DIV_PTR
L0579    JSR IO_CL_ALL
L0623    JSR L0620
         LDA MEOLFLG
         BEQ L0950
         JSR L0596
L0950    JSR PRINT_READY
Y1182    JSR L0489
L0561    LDA PROG_CLR
         BNE NEW_CMD
         LDX #$FF
         TXS
         CLD
         JSR SET_INBUFF_580
         LDA #$5D
         STA ZP0C2
         JSR L0552
         LDA BRKKEY
         BNE L0953
         DEC BRKKEY
         BNE L0561
L0953    LDY #$00
         STY CIX
         STY LLNGTH
         STY ZP094
         STY ZP0A6
         STY ZP0B3
         STY ZP0B0
         STY ZP0B1
         LDA VNTD
         STA EXSVPR
         LDA VNTD+1
         STA ZP0AE
         JSR L0957
         JSR L0958
         JSR L0959
         LDA FR0+1
         BPL L0960
         STA ZP0A6
L0960    JSR L0957
         STY STATE_NDX
         LDA (INBUFF),Y
         CMP #$9B
         BNE L0961
         BIT ZP0A6
         BMI L0561
         JMP L0962
;------------------------------
L0961  LDA ZP094
       STA STATE_LEN
       JSR L0959  
       JSR L0957  
       LDY #>COMMAND_LIST_0
       LDA #<COMMAND_LIST_0
       JSR L0963  
       ROR ZP0EC
       BMI L0964  
       LDA ZP0AF
       CMP #$15
       BNE L0965  
       STX ZP0DA
L0964  LDY #>COMMAND_LIST_X
       LDA #<COMMAND_LIST_X
       JSR L0963  
       LDA #$36
       BCS L0966  
       ADC ZP0AF
       ADC #$02
       BCC L0965  
L0966  BIT ZP0EC
       BMI L0965  
       LDA #<COMMAND_LIST_1
       STA ZP095
       LDA #>COMMAND_LIST_1
       STA ZP096
       LDA #$15
       LDX ZP0DA
L0965  STX CIX
       JSR L0959  
       JSR CALL_ASC_SUCH
       JSR L0968  
       BCC L0969  
       LDY LLNGTH
       LDA (INBUFF),Y
       CMP #$9B
       BNE L0970  
       INY
       STA (INBUFF),Y
       DEY
       LDA #$20
L0970  ORA #$80
       STA (INBUFF),Y
       LDA #$40
       ORA ZP0A6
       STA ZP0A6
       LDY STATE_NDX
       STY CIX
       LDX #$03
       STX STATE_LEN
       INX
       STX ZP094
       LDA #$37
L0971  JSR L0959  
L1012  LDY CIX
       LDA (INBUFF),Y
       INC CIX
       CMP #$9B
       BNE L0971  
       JSR L0959  
L0969  LDA ZP094
       LDY STATE_LEN
       STA XTAB3,Y  
       LDY CIX
       DEY
       LDA (INBUFF),Y
       CMP #$9B
       BEQ L0972  
       JMP L0961  
L0972  LDY #$02
       LDA ZP094
       STA XTAB3,Y  
       JSR L0467  
       LDA #$00
       BCS L0973  
       LDY #$02
       LDA (STMCUR),Y
L0973  SEC
       SBC ZP094
       BEQ L0974  
       BCS L0975  
       EOR #$FF
       TAY
       INY
       LDX #$8A
       JSR L0468  
       LDA ZP097
       STA STMCUR
       LDA ZP098
       STA STMCUR+1
       BNE L0974  
L0975  TAY
       CLC
       ADC STMCUR
       STA STMCUR
       BCC L0976  
       INC STMCUR+1
L0976  LDX #$8A
       JSR L0495  
L0974  LDY ZP094
L0977  DEY
       LDA XTAB3,Y  
       STA (STMCUR),Y
       TYA
       BNE L0977  
       BIT ZP0A6
       BVC L0978  
       LDA ZP0B1
       ASL
       ASL
       ASL
       TAY
       LDX #$88
       JSR L0495  
       SEC
       LDA VNTD
       SBC EXSVPR
       TAY
       LDA VNTD+1
       SBC ZP0AE
       LDX #$84
       JSR L0979  
       BIT ZP0A6
       BPL L0980  
       JSR L0981  
       JMP L0561  
L0980  JSR L0982  
L0983  JMP L0561  
L0978  BPL L0983  
L0095  JSR L0497  
       JMP L0984  
L0962  JSR L0467  
       BCS L0983  
       LDY #$02
       LDA (STMCUR),Y
       TAY
       CLC
       ADC STMCUR
       STA STMCUR
       BCC L0985  
       INC STMCUR+1
L0985  LDX #$8A
       JSR L0495  
       JMP L0561  
L0958  JSR CALL_ASC_FP
       BCC ?L2
?L1    LDA #$00
       STA CIX
       LDY #$80
       BMI ?L3
?L2    JSR L0431
       BCS ?L1
       LDY FR0+1
       BMI ?L1
       LDA FR0
?L3    STY ZP0A1
       STA ZP0A0
       JSR L0959  
       LDA ZP0A1
       STA FR0+1
       JMP L0959  
L0968  LDY #$00
       STY OPSTKX
       LDA (ZP095),Y
       ASL
       TAY
       LDA L0989,Y  
       STA ZP09D
       STA ADR_482  
       LDA L0991,Y  
       STA ZP09E
       STA ADR_483  
       LDA ZP094
       STA ADR_481  
       LDA CIX
       STA ADR_480  
L0999  INC ZP09D
       BNE L0995  
       INC ZP09E
L0995  LDX #$00
       LDA (ZP09D,X)
       BMI L0996  
       CMP #$05
       BCC L0997  
       JSR L0998  
       BCC L0999  
       JMP L1000  
L0996  ASL
       TAY
       LDA L0991,Y  
       PHA
       LDA L0989,Y  
       PHA
       CPY #$12
       BCS ?L2
       PLA
       TAY
       PLA
       JSR ?L1
       BCC L0999  
       JMP L1000  
?L1    PHA
       TYA
       PHA
       RTS
?L2    LDX OPSTKX
       INX
       INX
       INX
       INX
       BEQ ?L3
       STX OPSTKX
       LDA CIX
       STA ADR_480,X  
       LDA ZP094
       STA ADR_481,X  
       LDA ZP09D
       STA ADR_482,X  
       LDA ZP09E
       STA ADR_483,X  
       PLA
       STA ZP09D
       PLA
       STA ZP09E
       JMP L0999  
?L3    JMP ERROR14_1
L0997  LDX OPSTKX
       BNE ?L1
       RTS
?L1    LDA ADR_482,X
       STA ZP09D
       LDA ADR_483,X  
       STA ZP09E
       DEX
       DEX
       DEX
       DEX
       STX OPSTKX
       BCS L1000  
       JMP L0999  
L1000  INC ZP09D
       BNE L1006  
       INC ZP09E
L1006  LDX #$00
       LDA (ZP09D,X)
       BMI L1000  
       CMP #$03
       BEQ L0997  
       BCS L1000  
       LDA CIX
       CMP LLNGTH
       BCC L1007  
       STA LLNGTH
L1007  LDX OPSTKX
       LDA ADR_480,X  
       STA CIX
       LDA ADR_481,X  
       STA ZP094
       JMP L0999  
L1010  RTS
L0998  CMP #$0F
       BNE L1008  
       INC ZP09D
       BNE L1009  
       INC ZP09E
L1009  LDX #$00
       LDA (ZP09D,X)
       CLC
       DEC ZP094
L0959  LDY ZP094
       STA XTAB3,Y  
       INC ZP094
       BNE L1010  
;------------------------------
ERROR14_1 LDA #$0E
          JMP ERROR_ROUT
;------------------------------
Y1281  LDX #$FF
       TXS
       LDA ZP094
       LDY STATE_LEN
       STA XTAB3,Y  
       JMP L0961  
Y1277  LDX #$FF
       TXS
       LDY #$04
       LDA XTAB3,Y  
       CMP #$54
       BNE L1011  
       LDY CIX
       DEY
       LDA #$9B
       STA (INBUFF),Y
       JMP L0969  
L1011  JMP L1012  
L1008  JSR L0957  
       CPY ZP0B3
       BEQ L1013  
       STY ZP0B3
       LDY #>FUNCTION_LIST
       LDA #<FUNCTION_LIST
       JSR L1014  
       BCS L1015  
       STX ZP0B2
       CLC
       LDA ZP0AF
       ADC #$10
       STA ZP0B0
L1013  LDY #$00
       LDA (ZP09D),Y
       CMP ZP0B0
       BEQ L1016  
       CMP #$44
       BNE L1017  
       LDA ZP0B0
       CMP #$56
       BCS L1017  
       CMP #$44
       BCS L1018  
L1017  SEC
       RTS
L1018  LDA ZP0B0
L1016  JSR L0959  
       LDX ZP0B2
       STX CIX
       CLC
       RTS
L1015  LDA #$00
       STA ZP0B0
       SEC
       RTS
Y1283  LDA #$C0
       BNE L1019  
Y1279  LDA #$00
       BEQ L1019  
Y1282  LDA #$80
L1019  STA ZP0D2
       JSR L0957  
       STY TVSCIX
       JSR L1020  
       BCS L1021  
       JSR L1008  
       LDA ZP0B0
       BEQ L1022  
       LDY ZP0B2
       LDA (INBUFF),Y
       CMP #$30
       BCC L1021  
L1022  INC CIX
       JSR L1020  
       BCC L1022  
       CMP #$30
       BCC L1023  
       CMP #$3A
       BCC L1022  
L1023  CMP #$24
       BEQ Y1002
       BIT ZP0D2
       BPL Y1003
       BVS Y1004
L1021  SEC
       RTS
Y1002  BIT ZP0D2
       BPL L1021  
       BVS L1021  
       INY
       BNE Y1004
Y1003  LDA (INBUFF),Y
       CMP #$28
       BNE Y1004
       INY
       LDA #$40
       ORA ZP0D2
       STA ZP0D2
Y1004  LDA TVSCIX
       STA CIX
       STY TVSCIX
       LDY VNTP+1
       LDA VNTP
       JSR L1014  
Y1008  BCS Y1005
       CPX TVSCIX
       BEQ Y1006
Y1011  JSR Y1007
       JMP Y1008
Y1005  SEC
       LDA TVSCIX
       SBC CIX
       STA CIX
       TAY
       LDX #$84
       JSR L0468  
       LDA ZP0AF
       STA ZP0D3
       LDY CIX
       DEY
       LDX TVSCIX
       DEX
       LDA ADR_580,X  
       ORA #$80
Y1009  STA (ZP097),Y
       DEX
       LDA ADR_580,X  
       DEY
       BPL Y1009
       LDY #$08
       LDX #$88
       JSR L0468  
       INC ZP0B1
       JSR CLEAR_FR0
       LDY #$07
Y1010  LDA ZP0D2,Y
       STA (ZP097),Y
       DEY
       BPL Y1010
Y1006  TYA
       PHA
       LDA ZP09D
       PHA
       LDX ZP09E
       LDA ZP0AF
       JSR CALC_VARTAB  
       LDA (ZP09D),Y
       EOR ZP0D2
       TAY
       STX ZP09E
       PLA
       STA ZP09D
       CPY #$80
       PLA
       TAY
       BCS Y1011
       BIT ZP0D2
       BVC Y1012
       BMI Y1012
       DEC TVSCIX
Y1012  LDA TVSCIX
       STA CIX
       LDA ZP0AF
       BPL Y1013
       LDA #$00
       JSR L0959  
       LDA ZP0AF
Y1013  EOR #$80
       JSR L0959
Y1014  CLC
       RTS
L1020  LDY CIX
       LDA (INBUFF),Y
Y1081  CMP #$5F
       BEQ Y1014
       CMP #$41
       BCC Y1015
       CMP #$5B
       RTS
Y1020  LDY TVSCIX
       STY CIX
Y1015  SEC
       RTS
L0794  LDY CIX
       LDA (INBUFF),Y
       SEC
       SBC #$30
       BCC Y1015
       CMP #$0A
       BCC ?L1
       CMP #$11
       BCC Y1015
       SBC #$07
       CMP #$10
       BCS Y1015
?L1    LDY #$04
?L2    ASL FR0
       ROL FR0+1
       DEY
       BNE ?L2
       ORA FR0
       STA FR0
       INC CIX
       CLC
       RTS
Y1278  JSR L0957
       STY TVSCIX
       LDA (INBUFF),Y
       CMP #$24
       BEQ ?L1
       JSR CALL_ASC_FP
       BCC ?L4
       BCS Y1020
?L1    INC CIX
       JSR L0957
       JSR CLEAR_FR0
       JSR L0794
       BCS Y1020
?L2    JSR L0794
       BCS ?L3
       LDA FR0+1
       AND #$F0
       BEQ ?L2
?L3    JSR L0124
       LDA #$0D
       .BY $2C
?L4    LDA #$0E
       JSR L0959  
       LDY ZP094
       LDX #$00
?L5    LDA FR0,X
       STA XTAB3,Y  
       INY
       INX
       CPX #$06
       BCC ?L5
       STY ZP094
       CLC
       RTS
Y1280  JSR L0957
       LDA (INBUFF),Y
       CMP #$22
       BEQ ?L1
       SEC
       RTS
?L1    LDA #$0F
       JSR L0959  
       LDA ZP094
       STA EXSVOP
?L2    JSR L0959
       INC CIX
       LDY CIX
       LDA (INBUFF),Y
       CMP #$9B
       BEQ ?L3
       CMP #$22
       BNE ?L2
       INC CIX
       INY
       LDA (INBUFF),Y
       CMP #$22
       BEQ ?L2
?L3    CLC
       LDA ZP094
       SBC EXSVOP
       LDY EXSVOP
       STA XTAB3,Y  
       CLC
       RTS
Y1284  LDA XTAB3+1
       ASL
       BCS ?L1
       LDA ZP094
       CMP #$06
?L1    RTS
L0957  LDY CIX
?L1    LDA (INBUFF),Y
       AND #$7F
       CMP #$20
       BNE ?L2
       INY
       BNE ?L1
?L2    STY CIX
?L3    LDA (INBUFF),Y
       CMP #$9B
       BEQ ?L5
       AND #$7F
       STA (INBUFF),Y
       CMP #$61
       BCC ?L4
       CMP #$7B
       BCS ?L4
       AND #$5F
       STA (INBUFF),Y
?L4    INY
       CMP #$30
       BCC ?L5
       CMP #$3A
       BCC ?L3
       CMP #$41
       BCC ?L5
       CMP #$5B
       BCC ?L3
       CMP #$5F
       BEQ ?L3
?L5    LDY CIX
       RTS
;------------------------------
; ENDE PART 10
;------------------------------

;         .LI ON
;------------------------------
; TURBO-BASIC PART 11
;------------------------------
;         .LI OFF
;------------------------------
;**  ATARI-BASIC COMMAND SET **
COMMAND_LIST_0
         .BYTE $95,'RE',$CD
         .BYTE $95,'DAT',$C1
         .BYTE $98,'INPU',$D4
         .BYTE $91,'COLO',$D2
         .BYTE $9D,'LIS',$D4
         .BYTE $96,'ENTE',$D2
         .BYTE $9A,'LE',$D4
         .BYTE $9B,'I',$C6
         .BYTE $9C,'FO',$D2
         .BYTE $97,'NEX',$D4
         .BYTE $91,'GOT',$CF
         .BYTE $91,'GO T',$CF
         .BYTE $91,'GOSU',$C2
         .BYTE $BD,'TRA',$D0
         .BYTE $90,'BY',$C5
         .BYTE $90,'CON',$D4
         .BYTE $9E,'CO',$CD
         .BYTE $9F,'CLOS',$C5
         .BYTE $90,'CL',$D2
         .BYTE $90,'DE',$C7
         .BYTE $9E,'DI',$CD
COMMAND_LIST_1
         .BYTE $90,'EN',$C4
         .BYTE $90,'NE',$D7
         .BYTE $A0,'OPE',$CE
         .BYTE $96,'LOA',$C4
         .BYTE $96,'SAV',$C5
         .BYTE $A2,'STATU',$D3
         .BYTE $A3,'NOT',$C5
         .BYTE $CF,'POIN',$D4
         .BYTE $A1,'XI',$CF
         .BYTE $A4,'O',$CE
         .BYTE $92,'POK',$C5
         .BYTE $A5,'PRIN',$D4
         .BYTE $90,'RA',$C4
         .BYTE $99,'REA',$C4
         .BYTE $A8,'RESTOR',$C5
         .BYTE $90,'RETUR',$CE
         .BYTE $A9,'RU',$CE
         .BYTE $90,'STO',$D0
         .BYTE $90,'PO',$D0
         .BYTE $A5,$BF
         .BYTE $98,'GE',$D4
         .BYTE $AB,'PU',$D4
         .BYTE $91,'GRAPHIC',$D3
         .BYTE $92,'PLO',$D4
         .BYTE $92,'POSITIO',$CE
         .BYTE $90,'DO',$D3
         .BYTE $92,'DRAWT',$CF
         .BYTE $93,'SETCOLO',$D2
         .BYTE $AC,'LOCAT',$C5
         .BYTE $94,'SOUN',$C4
         .BYTE $A6,'LPRIN',$D4
         .BYTE $90,'CSAV',$C5
         .BYTE $90,'CLOA',$C4
         .BY $9A,$00,$80,$00
         .BYTE 'ERROR- ',$A0
;------------------------------
;*** TURBO BASIC XL COMMAND SET ***
COMMAND_LIST_X 
         .BYTE $92,'DPOK',$C5  
         .BYTE $93,'MOV',$C5
         .BYTE $93,'-MOV',$C5
         .BYTE $AA,'*',$C6
         .BYTE $90,'REPEA',$D4
         .BYTE $91,'UNTI',$CC
         .BYTE $91,'WHIL',$C5
         .BYTE $90,'WEN',$C4
         .BYTE $90,'ELS',$C5
         .BYTE $90,'ENDI',$C6
         .BYTE $CF,'BPU',$D4
         .BYTE $CF,'BGE',$D4
         .BYTE $92,'FILLT',$CF  
         .BYTE $90,'D',$CF
         .BYTE $90,'LOO',$D0
         .BYTE $A8,'EXI',$D4
         .BYTE $DA,'DI',$D2
         .BYTE $96,'LOC',$CB
         .BYTE $96,'UNLOC',$CB
         .BYTE $96,'RENAM',$C5
         .BYTE $96,'DELET',$C5
         .BYTE $91,'PAUS',$C5
         .BYTE $96,'TIME$',$BD
         .BYTE $A7,'PRO',$C3
         .BYTE $B8,'EXE',$C3
         .BYTE $90,'ENDPRO',$C3
         .BYTE $91,'FCOLO',$D2
         .BYTE $AA,'*',$CC
         .BYTE $95,'-',$AD
         .BYTE $93,'RENU',$CD
         .BYTE $92,'DE',$CC
         .BYTE $DA,'DUM',$D0
         .BYTE $AA,'TRAC',$C5
         .BYTE $DB,'TEX',$D4
         .BYTE $96,'BLOA',$C4
         .BYTE $96,'BRU',$CE
         .BYTE $B8,'GO',$A3
         .BYTE $A7,$A3
         .BYTE $AA,'*',$C2
         .BYTE $92,'PAIN',$D4
         .BYTE $9F,'CL',$D3
         .BYTE $94,'DSOUN',$C4
         .BYTE $DC,'CIRCL',$C5
         .BYTE $AB,'%PU',$D4
         .BYTE $98,'%GE',$D4
         .BY $9A,$00
;------------------------------
;***  ATARI BASIC FUNCTION SET  ***
FUNCTION_LIST 
         .BY $82,$80,$AC,$A4,$BA,$BB,$9B
         .BYTE 'GOT',$CF
         .BYTE 'GOSU',$C2
         .BYTE 'T',$CF
         .BYTE 'STE',$D0
         .BYTE 'THE',$CE
         .BYTE $A3
         .BYTE '<',$BD
         .BYTE '<',$BE
         .BYTE '>',$BD
         .BYTE $BC
         .BYTE $BE
         .BYTE $BD
         .BYTE $DE
         .BYTE $AA
         .BYTE $AB
         .BYTE $AD
         .BYTE $AF
         .BYTE 'NO',$D4
         .BYTE 'O',$D2
         .BYTE 'AN',$C4
         .BYTE $A8
         .BYTE $A9
         .BYTE $BD
         .BYTE $BD
         .BYTE '<',$BD
         .BYTE '<',$BE
         .BYTE '>',$BD
         .BYTE $BC
         .BYTE $BE
         .BYTE $BD
         .BYTE $AB
         .BYTE $AD
         .BYTE $A8
         .BY $80,$80
         .BYTE $A8,$A8,$AC
         .BYTE 'STR',$A4
         .BYTE 'CHR',$A4
         .BYTE 'US',$D2
         .BYTE 'AS',$C3
         .BYTE 'VA',$CC
         .BYTE 'LE',$CE
         .BYTE 'AD',$D2
         .BYTE 'AT',$CE
         .BYTE 'CO',$D3
         .BYTE 'PEE',$CB
         .BYTE 'SI',$CE
         .BYTE 'RN',$C4
         .BYTE 'FR',$C5
         .BYTE 'EX',$D0
         .BYTE 'LO',$C7
         .BYTE 'CLO',$C7
         .BYTE 'SQ',$D2
         .BYTE 'SG',$CE
         .BYTE 'AB',$D3
         .BYTE 'IN',$D4
         .BYTE 'PADDL',$C5
         .BYTE 'STIC',$CB
         .BYTE 'PTRI',$C7
         .BYTE 'STRI',$C7
;***  TURBO BASIC FUNCTION SET  ***         
         .BYTE 'DPEE',$CB
         .BYTE $A6
         .BYTE $A1
         .BYTE 'INST',$D2
         .BYTE 'INKEY',$A4
         .BYTE 'EXO',$D2
         .BYTE 'HEX',$A4
         .BYTE 'DE',$C3
         .BYTE 'DI',$D6
         .BYTE 'FRA',$C3
         .BYTE 'TIME',$A4
         .BYTE 'TIM',$C5
         .BYTE 'MO',$C4
         .BYTE 'EXE',$C3
         .BYTE 'RN',$C4
         .BYTE 'RAN',$C4
         .BYTE 'TRUN',$C3
         .BYTE '%',$B0
         .BYTE '%',$B1
         .BYTE '%',$B2
         .BYTE '%',$B3
         .BYTE 'GO',$A3
         .BYTE 'UINST',$D2
         .BYTE 'ER',$D2
         .BYTE 'ER',$CC
;------------------------------
Y1286    .BY $00,$2B,$8C,$2C,$8B,$02,$89,$8C
         .BY $02,$8A,$8B
Y1287    .BY $03,$25,$0F,$35,$02,$26,$0F,$36
         .BY $02,$28
Y1288    .BY $03,$B0,$02,$8D,$02,$81,$02,$B4
Y1289    .BY $03,$88,$8C,$02
Y1290    .BY $03,$82,$8E
Y1291    .BY $03,$2B,$0F,$38,$8C,$8F,$2C,$02
Y1292    .BY $03,$12,$0F,$3C,$8C,$02
Y1293    .BY $03,$58,$BA,$02,$6B,$BA,$02,$60
         .BY $02,$66,$02,$67,$02,$68,$02,$69
         .BY $02,$6C,$02,$6D,$02,$B1,$02,$5E
         .BY $B2,$02,$64,$B2,$02,$65,$B2,$02
         .BY $44,$B2,$02,$D1,$B3,$02,$48,$0F,$63
Y1294    .BY $03,$3F,$D0,$D3,$2C
Y1295    .BY $03,$D0,$8C,$2C
Y1296    .BY $03,$D0,$B5,$2C
Y1297    .BY $03,$B5,$BB,$B5
Y1298    .BY $03,$59,$02,$5F,$02,$B6,$02,$B7
         .BY $02,$83
Y1299    .BY $03,$D2,$B2
Y1300    .BY $03,$85,$B9
Y1301    .BY $03,$2B,$0F,$37,$8C,$8F,$2C,$02
Y1302    .BY $03,$1D,$0F,$2F,$02,$1E,$0F,$30
         .BY $02,$1F,$0F,$31,$02,$20,$0F,$32
         .BY $02,$21,$0F,$33,$02,$22,$0F,$34
Y1303    .BY $03,$C0,$C6,$90
Y1304    .BY $03,$8C,$90
Y1305    .BY $03,$8D,$22,$0F,$2D,$8C,$90,$02
         .BY $B7,$22,$0F,$2E,$B5,$90
Y1306    .BY $03,$82,$22,$0F,$2D,$8C,$19,$8C
         .BY $BC,$90
Y1307    .BY $03,$1A,$8C,$02
Y1308    .BY $03,$C4,$12,$97
Y1309    .BY $03,$C4,$12,$AF,$90
Y1310    .BY $03,$BE
Y1311    .BY $D8,$82,$90
Y1312    .BY $03,$90
Y1313    .BY $02,$91,$02,$1C,$B8
Y1314    .BY $03
Y1315    .BY $D9,$BF,$D6,$90
Y1316    .BY $03,$14,$02,$16
Y1317    .BY $03,$BE,$90,$02
Y1318    .BY $C0,$CB,$90
Y1319    .BY $03,$1C,$8C
Y1320    .BY $03,$82,$02,$85
Y1321    .BY $03,$BF,$D6,$02
Y1322    .BY $03,$12,$D5,$02
Y1323    .BY $03,$8C
Y1324    .BY $12,$BE,$12,$C4
Y1325    .BY $12,$B5,$90
Y1326    .BY $03,$BE,$90,$02,$90
Y1327    .BY $03,$96,$02,$90
Y1328    .BY $03,$BE,$D8,$02
Y1329    .BY $03,$BE,$D8,$02,$83,$D8,$02
Y1330    .BY $03,$C1,$91,$02,$C1,$92,$02,$C1
         .BY $8C,$12,$90
Y1331    .BY $02,$96,$02,$90
Y1332    .BY $03,$B5,$12,$02
Y1333    .BY $03,$BE,$12,$82,$12,$97
Y1334    .BY $03,$8C,$12,$8C
Y1335    .BY $03,$90,$02,$8C
Y1336    .BY $12,$8C
Y1337    .BY $12,$C4,$90
Y1338    .BY $03,$C8,$D7,$90
Y1339    .BY $03,$8C,$C5,$90
Y1340    .BY $03,$86,$C3
Y1341    .BY $03,$12,$C2,$02
Y1342    .BY $03,$17,$C6,$02,$18,$C6,$02,$62
         .BY $C2,$02,$6A,$C2
Y1343    .BY $03,$8C,$C7
Y1344    .BY $03,$12,$C6,$02
Y1345    .BY $03,$82,$2B,$0F,$39,$8C,$8F,$2C
         .BY $02,$85,$2B,$0F,$3B,$8C,$2C
Y1346    .BY $03,$C8,$D7,$02
Y1347    .BY $03,$12,$C9,$02
Y1348    .BY $03,$8C,$1B,$CA,$90,$02,$8C,$90
Y1349    .BY $03,$81,$02
Y1350    .BY $84,$AE,$02,$CD,$AD,$02
Y1351    .BY $03,$AE,$02
Y1352    .BY $03,$AF,$CC
Y1353    .BY $03,$8C,$02,$B5
Y1354    .BY $03,$CD,$AD,$02
Y1355    .BY $03,$D8,$CE
Y1356    .BY $03,$CD,$02
Y1357    .BY $03,$12,$02,$15
Y1358    .BY $03,$40,$02,$41,$02,$42,$02,$43
         .BY $02,$5C
Y1359    .BY $03,$3D,$02,$3E,$02,$5B
Y1360    .BY $03,$8C,$D4
Y1361    .BY $03,$12,$0F,$3C,$D3,$02
Y1362    .BY $03,$2B,$0F,$3A
Y1363    .BY $03,$BE,$12,$92
Y1364    .BY $03
Y1365    .BY $80,$D0,$B5,$12,$0F,$3C,$B5,$8F,$2C
Y1366    .BY $03
Y1367    .BY $87,$86,$90
Y1368    .BY $03,$26,$90,$02,$25,$90,$02,$90
Y1369    .BY $03,$8C,$12,$93,$02,$93,$03
;------------------------------
L0989    .BYTE <[Y1277-1]
L0991    .BYTE >[Y1277-1]
         .WORD Y1278-1
         .WORD Y1279-1
         .WORD Y1280-1
         .WORD Y1281-1
         .WORD Y1282-1
         .WORD Y1283-1
         .WORD Y1284-1
         .WORD Y1285-1
;*
         .WORD Y1287
         .WORD Y1288,Y1289
         .WORD Y1286,Y1290
         .WORD Y1291,Y1292
         .WORD Y1316,Y1304
         .WORD Y1337,Y1336
         .WORD Y1335,Y1364
         .WORD Y1325,Y1311
         .WORD Y1314,Y1315
         .WORD Y1305,Y1348
         .WORD Y1306,Y1330
         .WORD Y1338,Y1326
         .WORD Y1324,Y1323
         .WORD Y1310,Y1333
         .WORD Y1339,Y1317
         .WORD Y1318,Y1366
         .WORD Y1312,Y1327
         .WORD Y1368,Y1303
         .WORD Y1308,Y1351
         .WORD Y1352,Y1353
         .WORD Y1293,Y1294
         .WORD Y1295,Y1296
         .WORD Y1297,Y1298
         .WORD Y1299,Y1300
         .WORD Y1367,Y1301
         .WORD Y1365,Y1302
         .WORD Y1307,Y1313
         .WORD Y1319,Y1320
         .WORD Y1328,Y1332
         .WORD Y1340,Y1341
         .WORD Y1334,Y1342
         .WORD Y1343,Y1344
         .WORD Y1345,Y1346
         .WORD Y1349,Y1350
         .WORD Y1354,Y1355
         .WORD Y1356,Y1363
         .WORD Y1362,Y1358
         .WORD Y1359,Y1360
         .WORD Y1361,Y1321
         .WORD Y1322,Y1347
         .WORD Y1357,Y1329
         .WORD Y1331,Y1309
         .WORD Y1369
;------------------------------
Y1285  JSR L1008
       LDA ZP0B0
       CMP #$1C
       BCC ?L1
       CMP #$28
       BEQ ?L1
       CMP #$2B
       BCC ?L2
       CMP #$56
       BEQ ?L2
       CMP #$57
       BEQ ?L2
       CMP #$5A
       BEQ ?L2
       CMP #$5D
       BEQ ?L2
       CMP #$61
       BEQ ?L2
?L1    SEC
       RTS
?L2    JMP L1016
;------------------------------
; ENDE PART 11
;------------------------------

;         .LI ON
;------------------------------
;TURBO-BASIC PART 12
;------------------------------
;         .LI OFF
;------------------------------
;***         LIST        ***
LIST_CMD JSR LOOP_BEGIN
         LDY #$00
         STY ZP0A0
         STY ZP0A1
         STY ZP0B9
         DEY
         STY EXSVPR
         LDA #$7F
         STA ZP0AE
         STA DSPFLG
         JSR WRITE_EOL
?L1      LDY STATE_NDX
         INY
         CPY STATE_LEN
         BCS ?L4
         LDA STATE_NDX
         PHA
         JSR LET_CMD
         PLA
         STA STATE_NDX
         LDA ZP0D2
         BPL ?L2
         JSR OPENWRITE
         JMP ?L1
?L2      JSR L0490
         STY ZP0A1
         STA ZP0A0
         LDX STATE_NDX
         CPX STATE_LEN
         BEQ ?L3
         LDY #$80
         INX
         CPX STATE_LEN
         BEQ ?L3
         JSR L0490
?L3      STA EXSVPR
         STY ZP0AE
?L4      JSR L0402
?L5      LDY #$01
         LDA (STMCUR),Y
         BMI LIST_9
         CMP ZP0AE
         BCC ?L6
         BNE LIST_9
         DEY
         LDA (STMCUR),Y
         CMP EXSVPR
         BCC ?L6
         BNE LIST_9
?L6      LDA CONSOL
         CMP #$07
         BEQ ?L7
         LDA RTCLOK+2
         AND #$0F
         BNE ?L6
?L7      JSR L0982
         LDA BRKKEY
         BEQ LIST_8
         LDY #$02
         LDA (STMCUR),Y
         CLC
         ADC STMCUR
         STA STMCUR
         BCC ?L5
         INC STMCUR+1
         BCS ?L5
LIST_8   DEC BRKKEY
LIST_9   LDA ZP0B5
         BEQ ?L10
       JSR IO_CLOSE
       LDA #$00
       STA ZP0B5
?L10   STA DSPFLG
L0422  JSR POP_1  
       JMP Y1043
SCAN_TOKEN_TABLE  
       STX ARSLVL
       STA ZP096
       STY ZP095
?L1    LDY ARSLVL
       LDA ZP0AF
       BEQ ?L4
       DEC ZP0AF
?L2    LDA (ZP095),Y
       BMI ?L3
       INY
       BNE ?L2
?L3    INY
       JSR ?L4
       JMP ?L1
?L4    CLC
       TYA
       ADC ZP095
       STA ZP095
       BCC ?L5
       INC ZP096
?L5    RTS
Y1052  LDY #$FF
       STY ZP0AF
?L1    INC ZP0AF
       LDY ZP0AF
       LDA (ZP095),Y
       PHA
       CMP #$9B
       BEQ ?L2
       AND #$7F
       BEQ ?L3
?L2    JSR WRITE_BYTE
?L3    PLA
       BPL ?L1
       RTS
Y1178  JSR L0510
Y1001  JSR Y1052
L0510  LDA #$20
       JMP WRITE_BYTE  
L0982  LDY #$00
       LDA (STMCUR),Y
       TAX
       INY
       LDA (STMCUR),Y
       JSR L0520  
       LDX LIST_FLAG
       BEQ ?L2
       LDX ZP0B9
       LDY #$04
       LDA (STMCUR),Y
       JSR Y1055
       BEQ ?L1
       CMP #$40
       BNE ?L2
?L1    DEX
       DEX
?L2    STX FR0
?L3    JSR L0510
       DEC FR0
       BPL ?L3
L0981  LDY #$02
       LDA (STMCUR),Y
       STA LLNGTH
       INY
?L1    LDA (STMCUR),Y
       STA STATE_LEN
       INY
       STY STATE_NDX
       JSR ?L2
       LDY STATE_LEN
       CPY LLNGTH
       BCC ?L1
       RTS
?L2    JSR Y1060
       CMP #$36
       BEQ Y1061
       CMP #$54
       BEQ ?L4
       JSR ADJUST_LIST_INDENT
       JSR Y1060
       CMP #$37
       BEQ ?L3
       CMP #$02
       BCS Y1061
?L3    JSR Y1065
       JSR WRITE_BYTE  
       JMP ?L3
?L4    LDY #$1E
       LDA LIST_FLAG
       BNE ?L5
       LDY #$02
?L5    STY FR0
?L6    LDA #$2D
       JSR WRITE_BYTE  
       DEC FR0
       BNE ?L6
       JMP WRITE_EOL  
Y1061  JSR Y1065
       BNE Y1068
       JSR Y1065
       .BY $2C
Y1068  BPL Y1069
       EOR #$80
       JSR WRITE_VARNAME
       CMP #$A8
       BNE Y1061
       JSR Y1065
       JMP Y1061
Y1069  CMP #$0F
       BEQ Y1070
       BCS Y1071
       PHA
       JSR FP_RAM_FR0
       DEC STATE_NDX
       PLA
       CMP #$0D
       BNE Y1072
       LDA #$24
       JSR WRITE_BYTE  
       JSR L0431  
       JSR L0803  
       ORA #$80
       STA ADR_57F,Y
       BNE Y1073
Y1072  JSR CALL_FP_ASC
Y1073  JSR Y1074
       JMP Y1061
Y1080  JSR Y1052
       JMP Y1061
Y1070  JSR Y1065
       STA ZP0AF
       LDA #$22
       JSR WRITE_BYTE  
       LDA ZP0AF
       BEQ Y1075
Y1077  JSR Y1065
       CMP #$22
       BNE Y1076
       JSR WRITE_BYTE  
       LDA #$22
Y1076  JSR WRITE_BYTE
       DEC ZP0AF
       BNE Y1077
Y1075  LDA #$22
       JSR WRITE_BYTE
       JMP Y1061
Y1071  SEC
       SBC #$10
       STA ZP0AF
       LDX #$00
       LDA #>FUNCTION_LIST
       LDY #<FUNCTION_LIST
       JSR SCAN_TOKEN_TABLE
       JSR Y1060
       CMP #$5A
       BEQ Y1078
       CMP #$5D
       BEQ Y1078
       CMP #$61
       BEQ Y1078
       CMP #$62
       BEQ Y1078
       CMP #$6A
       BEQ Y1078
       CMP #$28
       BEQ Y1079
       CMP #$3D
       BCS Y1080
       LDY #$00
       LDA (ZP095),Y
       AND #$7F
       JSR Y1081
       BCS Y1080
Y1078  JSR L0510
Y1079  JSR Y1001
       JMP Y1061
Y1065  INC STATE_NDX
Y1060  LDY STATE_NDX
       CPY STATE_LEN
       BCS Y1082
       LDA (STMCUR),Y
       RTS
Y1082  PLA
       PLA
       RTS        

ADJUST_LIST_INDENT
       PHA
       CMP #$08
       BEQ ?L2
       CMP #$3C
       BEQ ?L2
       CMP #$3E
       BEQ ?L2
       CMP #$45
       BEQ ?L2
       CMP #$4F
       BEQ ?L2
       CMP #$07
       BEQ ?L4
       JSR Y1055
       BNE ADJUST_LIST_INDENT_EXIT
?L1    DEC ZP0B9
       DEC ZP0B9
       BPL ADJUST_LIST_INDENT_EXIT
?L2    INC ZP0B9
       INC ZP0B9
       BMI ?L1
?L3    BPL ADJUST_LIST_INDENT_EXIT
?L4    LDA STATE_NDX
       PHA
       JSR L0423
       PLA
       STA STATE_NDX
       CPX #$1B
       BNE ?L2
ADJUST_LIST_INDENT_EXIT              
       PLA
L0519  STA ZP0AF
       LDX #$01
       LDA #>COMMAND_LIST_0
       LDY #<COMMAND_LIST_0
       JSR SCAN_TOKEN_TABLE
       JMP Y1001             
;------------------------------
LIST_FLAG  DTA $01
;------------------------------
;***         *L          ***
LIST_CTRL_CMD
       LDA (STMCUR),Y
       EOR #$26
       STA LIST_FLAG
       RTS
;------------------------------
Y1055  CMP #$09
       BEQ ?L1
       CMP #$3D
       BEQ ?L1
       CMP #$3F
       BEQ ?L1
       CMP #$46
       BEQ ?L1
       CMP #$51
       BEQ ?L1
       CMP #$41
?L1    RTS
;------------------------------
WRITE_VARNAME STA ZP0AF
              LDX #$00
              LDA VNTP+1
              LDY VNTP
              JSR SCAN_TOKEN_TABLE
              JMP Y1052
;------------------------------
;***          FOR          ***
;
;  $ F3BC 2.0   
FOR_CMD 
        STY ZP0B3
        LDA (STMCUR),Y
        BNE ?L1
        INY
        LDA (STMCUR),Y
?L1     EOR #$80
        STA ZP0C7
        JSR LET_CMD
        LDX BASMEMTOP
        STX ZP0C4
        LDX BASMEMTOP+1
        STX ZP0C5        
?L2     JSR POP_1
        BCS ?L3 ;ok
        BNE ?L3 ;ok
        LDY #$0C
        LDA (BASMEMTOP),Y
        CMP ZP0C7
        BNE ?L2 ;ok
        BEQ ?L4 ;ok
?L3     LDA ZP0C4
        STA BASMEMTOP
        LDA ZP0C5
        STA BASMEMTOP+1

?L4     LDA #$0D
        JSR Y1094  ;PUSHES ON STACK HERE???
        JSR L0644
        LDY #$00
        JSR Y1095
        JSR FR0_EINS
        LDX STATE_NDX
        INX
        CPX STATE_LEN
        BCS ?L5
        JSR L0644
?L5     LDY #$06
        JSR Y1095
        LDA FOR_CTRL_FLAG
        BNE Y1100
Y1102   LDA ZP0C7
        LDY #$0C
        STA (ZP0C4),Y
        LDA #$00
        BEQ Y1101
;------------------------------
;***     REPEAT + DO     ***
REPEAT_CMD
LOOP_BEGIN
EXEC_BEGIN
DO_CMD   LSR
         LDY STATE_NDX
         STY ZP0B3
Y1101    PHA
         LDA #$04
         JSR Y1094
         PLA
         LDY #$00
         STA (ZP0C4),Y
         LDA STMCUR
         INY
         STA (ZP0C4),Y
         LDA STMCUR+1
         INY
         STA (ZP0C4),Y
         LDX ZP0B3
         DEX
         TXA
         INY
         STA (ZP0C4),Y
Y1105    RTS
Y1100    LDA BASMEMTOP
         PHA
         LDA BASMEMTOP+1
         PHA
         LDA ZP0C4
         STA BASMEMTOP
         LDA ZP0C5
         STA BASMEMTOP+1
         LDA FR0
         PHA
         LDA ZP0C7
         JSR FP_VVTP_FR0
         PLA
         JSR Y1098
         BCC Y1099
         PLA
         STA BASMEMTOP+1
         PLA
         STA BASMEMTOP
         BCS Y1102
Y1099    PLA
         PLA
         LDA #$08
         LDX #$09
         JSR Y1103
         LDA (STMCUR),Y
         BNE Y1104
         INY
         LDA (STMCUR),Y
Y1104    EOR #$80
         EOR ZP0C7
         BEQ Y1105
         JMP Y1106

; For-Next Error
Y1108    LDA #$0D
         JMP ERROR_ROUT
Y1152    LDA ZP0BE
         STA STMCUR
         LDA ZP0BF
         STA STMCUR+1
         RTS
;------------------------------
;***         NEXT         ***
NEXT_CMD LDA (STMCUR),Y
         BNE ?L1
         INY
         LDA (STMCUR),Y
?L1      EOR #$80
         STA ZP0C7
?L2      JSR POP_1
         BCS Y1108
         BNE Y1108
         LDY #$0C
         LDA (BASMEMTOP),Y
         CMP ZP0C7
         BNE ?L2
         LDY #$06
         LDA (BASMEMTOP),Y
         PHA
         STA FR1
         INY
         LDA (BASMEMTOP),Y
         STA FR1+1
         INY
         LDA (BASMEMTOP),Y
         STA FR1+2
         INY
         LDA (BASMEMTOP),Y
         STA FR1+3
         INY
         LDA (BASMEMTOP),Y
         STA FR1+4
         INY
         LDA (BASMEMTOP),Y
         STA FR1+5
         LDA ZP0C7
         JSR FP_VVTP_FR0
         JSR L0265
         BCS ?L3
         JSR L0625
         PLA
         JSR Y1098
         BCC Y1098_RET
         LDA #$11
         JSR Y1112
         LDA #$08
         JMP Y1043
?L3      JMP ERROR_11
Y1098    STA ZP0EC
         LDY #$00
         LDA (BASMEMTOP),Y
         CMP FR0
         BNE ?L3
         INY
         LDA (BASMEMTOP),Y
         CMP FR0+1
         BNE ?L1
         INY
         LDA (BASMEMTOP),Y
         CMP FR0+2
         BNE ?L1
         INY
         LDA (BASMEMTOP),Y
         CMP FR0+3
         BNE ?L1
         INY
         LDA (BASMEMTOP),Y
         CMP FR0+4
         BNE ?L1
         INY
         LDA (BASMEMTOP),Y
         CMP FR0+5
         BEQ ?L2
?L1      ROR
         EOR ZP0EC
         EOR FR0
         ASL
?L2      RTS
?L3      ORA FR0
         EOR ZP0EC
         BPL ?L2
         ROR
         EOR #$80
         ASL
Y1098_RET
         RTS
Y1112    CLC
         ADC BASMEMTOP
         STA BASMEMTOP
         STA APPMHI
         BCC Y1112_RET
         INC BASMEMTOP+1
         INC APPMHI+1
Y1112_RET         
         RTS
;------------------------------
; ENDE PART 12
;------------------------------

;         .LI ON
;------------------------------
; TURBO-BASIC PART 13
;------------------------------
;         .LI OFF
;------------------------------
;***          RUN          ***
RUN_CMD INY
        CPY STATE_LEN
        BCS RUN_1
        JSR RUN_LOAD_BAS
RUN_1   LDA STMTAB
        STA STMCUR
        LDA STMTAB+1
        STA STMCUR+1
        LDA #$00
        STA FOR_CTRL_FLAG
        STA BRK_FLAG
        LDY #$03
        STY STATE_LEN
        DEY
        LDA (STMCUR),Y
        STA LLNGTH
        DEY
        LDA (STMCUR),Y
        BMI NO_PRG
        JSR CLR_DIV_PTR
;------------------------------
;***         CLR          ***
CLR_CMD
CLR_1  JSR CLR_VAR
       JSR CLR_DIM_PTR
       LDA #$00
       STA DATAZ_PTR
       STA DATAZ_PTR+1
       STA DATA_PTR
       RTS
;------------------------------
;***         END          ***
END_CMD JSR STORE_STOPLN
NO_PRG  JMP L0579
;------------------------------
;    Can we add ELSEIF?
;***      IF/ELSEIF       ***
IF_CMD 
ELSEIF_CMD
       JSR LET_CMD
       LDX ARSLVL
       LDA XTAB1_40,X  
       BEQ ?L1
       LDX STATE_NDX
       INX
       CPX STATE_LEN
       BCS ENDIF_CMD
       JMP GOTO_CMD
?L1    LDY STATE_NDX
       DEY
       LDA (STMCUR),Y
       CMP #$1B
       BEQ ELSE_1
;------------------------------
;***         ELSE         ***
ELSE_CMD  
          LDA #$07
          LDX #$41
          LDY #$40
          JMP Y1126
ELSE_1    LDA LLNGTH
          STA STATE_LEN
;------------------------------
;***         ENDIF         ***
ENDIF_CMD 
          RTS
;
;

;
;



;------------------------------
;***         *B            ***
BRK_CTRL_CMD
       LDA (STMCUR),Y
       EOR #$26
       STA BRK_FLAG
       RTS
;------------------------------
BRK_FLAG  .BY $00
;------------------------------
BRK_BAS_V LDA #$80
          STA BRKKEY
          LDY BRK_FLAG
          BEQ STOP_CMD
          JMP ERROR_ROUT
;------------------------------
;***         STOP         ***
STOP_CMD JSR STORE_STOPLN
         JSR WRITE_EOL
         LDA #<STOP_TEXT
         STA ZP095
         LDA #>STOP_TEXT
         STA ZP096
         JSR Y1052
         JMP PRT_AT_LINE
;------------------------------
STORE_STOPLN LDY #$01
             LDA (STMCUR),Y
             BMI L0620
             STA STOPLN+1
             DEY
             LDA (STMCUR),Y
             STA STOPLN
L0620        LDA #$00
             STA ZP0B4
             STA ZP0B5
             RTS
;------------------------------
STOP_TEXT    .BYTE 'STOPPED',$A0
;------------------------------
;***         CONT         ***
CONT_CMD LDY #$01
         LDA (STMCUR),Y
         BPL L0620
         LDA STOPLN
         STA ZP0A0
         LDA STOPLN+1
         STA ZP0A1
         JSR L0402
         LDY #$02
         LDA (STMCUR),Y
         STA LLNGTH
         PLA
         PLA
         JMP ZEILEN_INC
;------------------------------
;***         TRAP          ***
TRAP_CMD JSR L0728
         STA TRAPLN
         STY TRAPLN+1
         RTS
;------------------------------
;***         ON            ***
ON_CMD STY ZP0B3
       JSR L0644  
       JSR L0431  
       BCS ?L2
       LDA FR0+1
       BNE ?L2
       LDA FR0
       BEQ ?L2
       STA ZP0B9
       LDY STATE_NDX
       DEY
       LDA (STMCUR),Y
       PHA
?L1    DEC ZP0B9
       BEQ ?L3
       JSR L0429  
       CPX #$12
       BEQ ?L1
       PLA
?L2    RTS
?L3    PLA
       CMP #$62
       BEQ ?L5
       CMP #$6A
       BEQ ?L6
       PHA
       JSR L0490  
       PLA
       CMP #$17
       BEQ ?L4
       LDA #$1E
       JSR Y1101
?L4    LDA FR0
       LDY FR0+1
       JMP Y1136
?L5    LDA #$51
       JSR Y1101
       JMP Y1137
?L6    JMP GO_NR_CMD
Y1094  STA ZP0A4
       CLC
       LDA BASMEMTOP
       STA ZP0C4
       ADC ZP0A4
       TAY
       LDA BASMEMTOP+1
       STA ZP0C5
       ADC #$00
       CMP MEMTOP+1  
       BCC ?L1
       BNE ERROR2_2  
       CPY MEMTOP  
       BCC ?L1
       BNE ERROR2_2  
?L1    STA BASMEMTOP+1
       STA APPMHI+1  
       STY BASMEMTOP
       STY APPMHI  
       RTS
;------------------------------
ERROR2_2  LDA #$02
          JMP ERROR_ROUT
;------------------------------
Y1095  LDA FR0
       STA (ZP0C4),Y
       INY
       LDA FR0+1
       STA (ZP0C4),Y
       INY
       LDA FR0+2
       STA (ZP0C4),Y
       INY
       LDA FR0+3
       STA (ZP0C4),Y
       INY
       LDA FR0+4
       STA (ZP0C4),Y
       INY
       LDA FR0+5
       STA (ZP0C4),Y
       RTS
;------------------------------
CLR_DIM_PTR LDA STARP
            STA RUNSTK
            STA BASMEMTOP
            STA APPMHI
            LDA STARP+1
            STA RUNSTK+1
            STA BASMEMTOP+1
            STA APPMHI+1
            RTS
;------------------------------
CLR_VAR LDX VVTP
        STX ZP0F5
        LDY VVTP+1
        STY ZP0F6
?L1     LDX ZP0F5
        CPX STMTAB
        LDA ZP0F6
        SBC STMTAB+1
        BCS ?L3
        LDY #$00
        LDA (ZP0F5),Y
        AND #$FC
        STA (ZP0F5),Y
        LDY #$02
        LDX #$06
        LDA #$00
?L2     STA (ZP0F5),Y
        INY
        DEX
        BNE ?L2
        LDA ZP0F5
        CLC
        ADC #$08
        STA ZP0F5
        LDA ZP0F6
        ADC #$00
        STA ZP0F6
        BNE ?L1
?L3     JMP L0421
;------------------------------
CLR_DIV_PTR LDY #$00
            STY STOPLN
            STY STOPLN+1
            STY ZP0B9
            STY RADFLG
            STY DATA_PTR
            STY DATAZ_PTR
            STY DATAZ_PTR+1
            DEY
            STY TRAPLN+1
            STY BRKKEY
            JMP IO_CL_ALL
;------------------------------
;***         *F          ***
FOR_CTRL_CMD
       LDA (STMCUR),Y
       EOR #$26
       STA FOR_CTRL_FLAG
       RTS
;------------------------------
FOR_CTRL_FLAG  .BY $00
;------------------------------
Y1103     LDY #$FF
Y1126     STX Y1143+1
          STA Y1144+1
          STY Y1145+1
          LDA #$00
          STA FR0+3
          LDA STMCUR
          STA ZP0BE
          LDA STMCUR+1
          STA ZP0BF
Y1149     LDY STATE_LEN
          CPY LLNGTH
          BCS Y1146
          LDA (STMCUR),Y
          STA STATE_LEN
          INY
          LDA (STMCUR),Y
          INY
          STY STATE_NDX
Y1143     CMP #$00
          BEQ Y1147
Y1144     CMP #$00
          BEQ Y1148
Y1145     CMP #$00
          BNE Y1149
          LDA FR0+3
          BNE Y1149
Y1150     RTS
Y1147     LDA FR0+3
          BEQ Y1150
          DEC FR0+3
          JMP Y1149
Y1148     CMP #$07
          BNE ?L1
          LDY STATE_LEN
          DEY
          LDA (STMCUR),Y
          CMP #$1B
          BEQ Y1149
?L1       INC FR0+3
          BNE Y1149
Y1106     JSR Y1152
ERROR22_1 LDA #$16
          JMP ERROR_ROUT
Y1146     LDY #$01
          LDA (STMCUR),Y
          BMI Y1106
          CLC
          LDA LLNGTH
          ADC STMCUR
          STA STMCUR
          BCC ?L1
          INC STMCUR+1
?L1       LDY #$01
          LDA (STMCUR),Y
          BMI Y1106
          INY
          LDA (STMCUR),Y
          STA LLNGTH
          INY
          STY STATE_LEN
          JMP Y1149
;------------------------------
;***       WHILE         ***
WHILE_CMD JSR LOOP_BEGIN
          JSR LET_CMD
          LDX ARSLVL
          LDA XTAB1_40,X
          BNE Y1155
          JSR POP_1
          LDA #$3E
          LDX #$3F
          JMP Y1103
;------------------------------
;***       UNTIL          ***
UNTIL_CMD JSR LET_CMD
          JSR POP_1
          BCS ERROR23_1
          CMP #$3C
          BNE ERROR22_1
          LDX ARSLVL
          LDY XTAB1_40,X
          BNE Y1155
          LDA #$04
          JSR Y1112
          LDA #$3C
          JMP Y1043
Y1155     RTS
;------------------------------
;***       WEND           ***
WEND_CMD JSR POP_1
         BCS ERROR24_1
         CMP #$3E
         BNE ERROR22_1
         JSR Y1043
         LDY ZP0B2
         DEY
         STY STATE_LEN
         RTS
;------------------------------
ERROR23_1 LDA #$17
          .BY $2C
ERROR24_1 LDA #$18
          JMP ERROR_ROUT
;------------------------------
;***       POP            ***
POP_CMD
POP_1  LDA RUNSTK+1
       CMP BASMEMTOP+1
       BCC ?L1
       LDA RUNSTK
       CMP BASMEMTOP
       BCS ?L5
?L1    SEC
       LDA BASMEMTOP
       SBC #$04
       STA BASMEMTOP
       STA APPMHI  
       BCS ?L2
       DEC BASMEMTOP+1
       DEC APPMHI+1  
?L2    LDY #$03
       LDA (BASMEMTOP),Y
       STA ZP0B2
       DEY
       LDA (BASMEMTOP),Y
       STA ZP0A1
       DEY
       LDA (BASMEMTOP),Y
       STA ZP0A0
       DEY
       LDA (BASMEMTOP),Y
       BNE ?L4
       TAY
       SEC
       LDA BASMEMTOP
       SBC #$0D
       STA BASMEMTOP
       STA APPMHI  
       BCS ?L3
       DEC BASMEMTOP+1
       DEC APPMHI+1  
?L3    TYA
?L4    CLC
       RTS
?L5    SEC
       RTS
;------------------------------
;***       RETURN         ***
RETURN_CMD JSR POP_1
           BCS ERROR16_1
           CMP #$0C
           BEQ Y1043
           CMP #$1E
           BEQ Y1043
           CMP #$50
           BNE RETURN_CMD
           BEQ ERROR16_1
Y1043      LDY ZP0B2
           CMP (ZP0A0),Y
           BNE ERROR15_1
           LDA ZP0A1
           BEQ ERROR15_1
           STA STMCUR+1
           LDA ZP0A0
           STA STMCUR
           DEY
           LDA (STMCUR),Y
           STA STATE_LEN
           LDY #$02
           LDA (STMCUR),Y
           STA LLNGTH
           RTS
;------------------------------
ERROR15_1 LDA #$0F
          .BY $2C
ERROR16_1 LDA #$10
          .BY $2C
ERROR26_1 LDA #$1A
          JMP ERROR_ROUT
;------------------------------
;***       EXIT          ***
EXIT_CMD JSR POP_1
         BCS ERROR26_1
         BNE ?L1
         LDA #$08
?L1      TAX
         INX
         JMP Y1103
Y1169    LDA #$1E
         BNE Y1043
;------------------------------
;***      ENDPROC         ***
ENDPROC_CMD JSR POP_1
            BCS ERROR28_1
            CMP #$50
            BEQ Y1043
            CMP #$51
            BEQ Y1169
            CMP #$1E
            BEQ ERROR28_1
            CMP #$0C
       BNE ENDPROC_CMD
ERROR29_1   SEC
            SBC #$A4
            .BY $2C
ERROR28_1   LDA #$1C
            JMP ERROR_ROUT
;------------------------------
;***       EXEC          ***
EXEC_CMD JSR EXEC_BEGIN
Y1137    LDX #$C1
Y1172    LDY STATE_NDX
         LDA (STMCUR),Y
         BNE ?L1
         INY
         LDA (STMCUR),Y
?L1      EOR #$80
         JSR CALC_VARTAB
         TXA
         CMP (ZP09D),Y
         BNE ERROR29_1
         LDY #$03
         LDA (ZP09D),Y
         STA STMCUR+1
         DEY
         LDA (ZP09D),Y
         STA STMCUR
         LDA (STMCUR),Y
         STA LLNGTH
         INY
         LDA (STMCUR),Y
         STA STATE_LEN
         RTS
;------------------------------
;***       GO#            ***
GO_NR_CMD LDX #$C2
          BNE Y1172
;------------------------------
;***       PROC           ***
PROC_CMD  LDA #$1B
          .BY $2C
ERROR25_1 LDA #$19
          JMP ERROR_ROUT
;------------------------------
;***       LOOP           ***
LOOP_CMD JSR POP_1
         BCS ERROR25_1
         CMP #$45
         BNE ?L1
         LDA #$04
         JSR Y1112
         LDA #$45
         JMP Y1043
?L1      JMP ERROR22_1
;------------------------------
; ENDE PART 13
;------------------------------

;         .LI ON
;------------------------------
; TURBO-BASIC PART 14
;------------------------------
;         .LI OFF
;------------------------------
ERROR19_1 LDA #$13
          .BY $2C
ERROR18_1 LDA #$12
          .BY $2C
;------------------------------
;***       ERROR         ***
ERROR_LINE  LDA #$11
ERROR_ROUT  STA ZP0B9
ERROR_IO    LDA #$00
            CLD
            STA DSPFLG
            JSR STORE_STOPLN
            LDY TRAPLN+1
            BMI ?L1
            LDA TRAPLN
            LDX #$80
            STX TRAPLN+1
            LDX ZP0B9
            STX ERRSAV
            LDX #$00
            STX ZP0B9
            JMP Y1136
?L1         LDA ZP0B9
            CMP #$80
            BNE ?L2
            JMP STOP_CMD
?L2         JSR WRITE_EOL
            LDA #$37
            JSR ADJUST_LIST_INDENT
            LDX ZP0B9
            LDA #$00
            JSR L0520
            LDA ZP0B9
            CMP #$1F
            BCC ?L3
            SBC #$62
?L3         STA ZP0AF
            CMP #$4C
            BCS PRT_AT_LINE
            LDX #$00
            LDA #>ERROR_TEXTS
            LDY #<ERROR_TEXTS
            JSR SCAN_TOKEN_TABLE
            JSR Y1178
PRT_AT_LINE LDY #$01
            LDA (STMCUR),Y
            BMI ?L1
            LDA #<ERROR_TEXTS
            LDY #>ERROR_TEXTS
            JSR Y1180
            LDY #$01
            LDA (STMCUR),Y
            STA FR0+1
            DEY
            LDA (STMCUR),Y
            STA FR0
            JSR Y1181
?L1         JSR WRITE_EOL
            JSR TRACE_OFF
            JMP Y1182
;------------------------------
L0520        STA FR0+1
             STX FR0
Y1181        JSR L0124
CALL_FP_ASC1 JSR CALL_FP_ASC
Y1074        LDA INBUFF
             LDY INBUFF+1
Y1180        STA ZP095
             STY ZP096
             JMP Y1052
;------------------------------
;***     ERROR TEXTS        ***
ERROR_TEXTS .BYTE ' AT LINE',$A0    ;00 00
            .BYTE '?BLOA',$C4       ;01 01
            .BYTE 'ME',$CD          ;02 02
            .BYTE 'VALU',$C5        ;03 03
            .BYTE '>#VAR',$D3       ;04 04
            .BYTE '$LE',$CE         ;05 05
            .BYTE '?DAT',$C1        ;06 06
            .BYTE '>3276',$B7       ;07 07
            .BYTE 'INPU',$D4        ;08 08
            .BYTE 'DI',$CD          ;09 09
            .BYTE 'STAC',$CB        ;0A 10
            .BYTE 'OVERFLO',$D7     ;0B 11
            .BYTE '?LIN',$C5        ;0C 12
            .BYTE '?FO',$D2         ;0D 13
            .BYTE 'TOO LON',$C7     ;0E 14
            .BYTE '?DE',$CC         ;0F 15
            .BYTE '?GOSU',$C2       ;10 16
            .BYTE 'GARBAG',$C5      ;11 17
            .BYTE '?CH',$D2         ;12 18
            .BYTE 'ME',$CD          ;13 19
            .BYTE $A3               ;14 20
            .BYTE '?LOA',$C4        ;15 21
            .BYTE '?NES',$D4        ;16 22
            .BYTE '?WHIL',$C5       ;17 23
            .BYTE '?REPEA',$D4      ;18 24
            .BYTE '?D',$CF          ;19 25
            .BYTE '?EXI',$D4        ;1A 26
            .BYTE 'XPRO',$C3        ;1B 27
            .BYTE '?EXE',$C3        ;1C 28
            .BYTE '?PRO',$C3        ;1D 29
            .BYTE '?',$A3           ;1E 30
            .BYTE 'IS OPE',$CE      ;1F 31
            .BYTE '?DE',$D6         ;20 32
            .BYTE 'WR ONL',$D9      ;21 33
            .BYTE 'CM',$C4          ;22 34
            .BYTE 'NOT OPE',$CE     ;23 35
            .BYTE $A3               ;24 36
            .BYTE 'RD ONL',$D9      ;25 37
            .BYTE 'EO',$C6          ;26 38
            .BYTE 'TRUN',$C3        ;27 39
            .BYTE 'TIMEOU',$D4      ;28 40
            .BYTE 'NA',$CB          ;29 41
            .BYTE '!FRAM',$C5       ;2A 42
            .BYTE 'CURSO',$D2       ;2B 43
            .BYTE '!OVERRU',$CE     ;2C 44
            .BYTE 'CHKSU',$CD       ;2D 45
            .BYTE 'DON',$C5         ;2E 46
            .BYTE 'MOD',$C5         ;2F 47
            .BYTE 'NOT IMP',$CC     ;30 48
            .BYTE 'RA',$CD          ;31 49
            .BYTE $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
            .BYTE 'D?',$BA          ;3D 61 
            .BYTE '>#FILE',$D3      ;3E 62
            .BYTE 'DSK FUL',$CC     ;3F 63
            .BYTE 'FATAL I/',$CF    ;40 64
            .BYTE 'FILE',$A3        ;41 65
            .BYTE 'NAM',$C5         ;42 66
            .BYTE 'POIN',$D4        ;43 67
            .BYTE 'LOCKE',$C4       ;44 68
            .BYTE 'DCM',$C4         ;45 69
            .BYTE '>DI',$D2         ;46 70
            .BYTE '?FIL',$C5        ;47 71
            .BYTE 'POIN',$D4        ;48 72
            .BYTE '?APPN',$C4       ;49 73
            .BYTE 'BAD SECTOR',$D3  ;4A 74
;------------------------------
;***       TIME           ***
TIME_FUN LDA RTCLOK+2
         LDY RTCLOK+1
         LDX RTCLOK
         CMP RTCLOK+2
         BNE TIME_FUN
         PHA
         STX FR0+1
         STY FR0
         JSR L0124
         LDX #$05
?L1      LDA TIME_TAB,X
         STA FR1,X
         DEX
         BPL ?L1
         JSR L0287
         JSR FR0_TO_FR1
         PLA
         STA FR0
         LDA #$00
         STA FR0+1
         JSR L0124
         JSR L0265
         LDA #$00
         STA ZP0D2
         STA ZP0D3
         JMP L0125
;------------------------------
;***       TIME$          ***
TIMES_FUN JSR TIME_FUN
          DEC ARSLVL
          LDX #$05
?L1       LDA TIMES_TAB,X
          STA FR1,X
          DEX
          BPL ?L1
          JSR L0317
          LDY #$00
          LDA FR0
          CMP #$40
          BNE ?L2
          STY FR0+1
?L2       STY CIX
          LDA #$24 ;<-  Hours
          JSR ?L3
          LDA #$60 ;<-  Minues
          JSR ?L3
          LDA #$60 ;<-  Seconds
          JSR ?L3
          LDY #$06
          LDA #<ADR_580
          JMP L0804
          
          ;Can we add to PAL flag check here?  
          
          
?L3       PHA
          JSR L0262
          JSR FR0_TO_FR1
          JSR FR0_EINS
          PLA
          STA FR0+1
          JSR L0287
          LDA #$00
          LDY FR0
          CPY #$40
          BNE ?L4
          LDY FR0+1
          STA FR0+1
          TYA
?L4       TAX
          LSR
          LSR
          LSR
          LSR
          JSR ?L5
          TXA
          AND #$0F
?L5       ORA #$30
          CMP #$3A
          BCC ?L6
          ADC #$06
?L6       LDY CIX
          STA ADR_580,Y
          INC CIX
          RTS
;------------------------------
TIME_TAB  .BY $41,$02,$56,$00,$00,$00
TIMES_TAB .BY $43,$04,$32,$00,$00,$00
;------------------------------
;***       TIME$=       ***
TIMES_CMD JSR LET_CMD
          JSR L0595
          LDY #$00
          STY CIX
          STY FR1+1
          STY FR1+2
          JSR ?L3
          CMP #$18
          BCS ?L2
          STA FR1
          JSR TIMES_B8
          JSR ?L3
          CMP #$3C
          BCS ?L2
          JSR ?L4
          JSR TIMES_B8
          JSR ?L3
          CMP #$3C
          BCS ?L2
          JSR ?L4
          JSR TIMES_B7
          JSR TIMES_B6
          LDA FR1
          LDY FR1+1
          LDX FR1+2
?L1       STA RTCLOK+2
          STY RTCLOK+1
          STX RTCLOK
          CMP RTCLOK+2
          BNE ?L1
          JMP L0596
?L2       JSR L0596
          JMP ERROR18_1
?L3       JSR Y1199
          INC CIX
          BCS ?L2
          ASL
          STA FR1+3
          ASL
          ASL
          ADC FR1+3
          STA FR1+3
          JSR Y1199
          INC CIX
          BCS ?L2
          ADC FR1+3
          RTS
?L4       CLC
          ADC FR1
          STA FR1
          BCC ?L5
          INC FR1+1
          BNE ?L5
          INC FR1+2
?L5       RTS
TIMES_B6  ASL FR1
          ROL FR1+1
          ROL FR1+2
TIMES_B7  LDY FR1+2
          LDA FR1
          LDX FR1+1
          ASL FR1
          ROL FR1+1
          ROL FR1+2
          ASL FR1
          ROL FR1+1
          ROL FR1+2
          ADC FR1
          STA FR1
          TXA
          ADC FR1+1
          STA FR1+1
          TYA
          ADC FR1+2
          STA FR1+2
          RTS
TIMES_B8  JSR TIMES_B6
          LDY FR1+2
          LDA FR1
          LDX FR1+1
          ASL FR1
          ROL FR1+1
          ROL FR1+2
          ADC FR1
          STA FR1
          TXA
          ADC FR1+1
          STA FR1+1
          TYA
          ADC FR1+2
          ASL FR1
          ROL FR1+1
          ROL
          STA FR1+2
Y1201     RTS
;------------------------------
; ENDE PART 14
;------------------------------

;         .LI ON
;------------------------------
;TURBO-BASIC PART 15
;------------------------------
;         .LI OFF
;------------------------------
;***       TEXT          ***
TEXT_CMD JSR L0119
         STA ZP099
         BNE Y1201
         JSR LET_CMD
         LDX ARSLVL
         LDA XTAB3,X
         BMI ?L1
         JSR STR_FUN
?L1      JSR L0632
TEXT_2   LDA FR0+2
         ORA FR0+3
         BEQ Y1201
         LDY #$00
         STY ZP0DB
         STY ZP0DC
         LDA (FR0),Y
         BPL ?L3
         DEC ZP0DB
?L3      JSR TEXT_12
         ASL
         ASL
         STA ZP0A2
         LDA #$00
         ROL
         ASL ZP0A2
         ROL
         ADC CHBAS
         STA ZP0A3
         JSR Y1205
         BCS Y1201
?L4      LDY #$08
         STY ZP0DD
         LDY ZP0DC
         LDA (ZP0A2),Y
         EOR ZP0DB
         STA ZP0DA
         LDX ZP0ED
         LDY FR1+3
?L5      ASL ZP0DA
         LDA (ZP0DE),Y
         AND ADR_5C0,X
         BCC ?L6
         ORA ADR_5C8,X
?L6      STA (ZP0DE),Y
         DEC ZP0DD
         BEQ ?L7
         JSR Y1208
         CPY FR1+1
         BCC ?L5
?L7      JSR TEXT_13
         INC ZP0DC
         LDA ZP0DC
         CMP #$08
         BCS ?L8
         ADC ZP099
         CMP FR1
         BCC ?L4
?L8      LDA ZP09B
         ADC #$07
         STA ZP09B
         BCC ?L9
         INC ZP09C
?L9      INC FR0
         BNE ?L10
         INC FR0+1
?L10     LDA FR0+2
         BNE ?L11
         DEC FR0+3
?L11     DEC FR0+2
         JMP TEXT_2
;------------------------------
TEXT_TAB1 .BY $40,$20,$60,$00
;------------------------------
TEXT_12 TAY
        ASL
        ASL
        ROL
        ROL
        AND #$03
        TAX
        TYA
        EOR TEXT_TAB1,X
        RTS
;------------------------------
Y1219    .BY $18,$18,$0C,$18,$30,$30,$60,$60
         .BY $C0,$C0,$C0,$C0,$18,$0C,$C0,$C0
Y1223    .BY $28,$14,$14,$0A,$0A,$14,$14,$28
         .BY $28,$28,$28,$28,$28,$28,$14,$28
Y1221    .BY $00,$00,$00,$02,$03,$02,$03,$02
         .BY $03,$01,$01,$01,$00,$00,$03,$02
Y1227    .BY $00,$01,$03,$07
Y1222    .BY $00,$F0,$FC
Y1230    .BY $FE,$04,$02,$01
;------------------------------
Y1220  SEC
       RTS
Y1205  LDA DINDEX
       AND #$0F
       TAX
       LDA #$00
       STA ZP0DF
       LDA ZP099
       ASL
       ROL ZP0DF
       ASL
       ROL ZP0DF
       ADC ZP099
       BCC ?L1
       INC ZP0DF
?L1    ASL
       STA ZP0DE
       ROL ZP0DF
       LDA Y1219,X
       STA FR1
       CMP ZP099
       BEQ Y1220
       BCC Y1220
       LDY Y1221,X
       STY FR1+2
       LDA Y1222,Y
       STA ADR_5C0  
       LDA Y1223,X
       STA FR1+1
       LSR
       LSR
       LSR
       LSR
       TAX
       BEQ ?L3
?L2    ASL ZP0DE
       ROL ZP0DF
       DEX
       BNE ?L2
?L3    CLC
       LDA ZP0DE
       ADC SAVMSC  
       STA ZP0DE
       LDA ZP0DF
       ADC SAVMSC+1  
       STA ZP0DF
       LDA ZP09C
       STA FR1+4
       LDA ZP09B
       STA FR1+3
       LDY FR1+2
       STY ZP0ED
       BEQ ?L5
       AND Y1227,Y
       STA ZP0ED
?L4    LSR FR1+4
       ROR FR1+3
       DEY
       BNE ?L4
?L5    LDA FR1+4
       BNE Y1220
       LDA FR1+3
       CMP FR1+1
       BCS Y1220
       LDX FR1+2
       BNE Y1229
       LDA BAS_COLOR
       JSR TEXT_12
       STA ADR_5C8
       CLC
       RTS
Y1229  LDY Y1227,X
       STY FR1+4
       LDA Y1230,X
       STA ZP0EE
       LDA BAS_COLOR
       ORA ADR_5C0  
       EOR ADR_5C0  
?L7    STA ADR_5C8,Y
       LDX ZP0EE
?L8    ASL
       DEX
       BNE ?L8
       DEY
       BPL ?L7
       LDY FR1+4
       LDA ADR_5C0  
?L9    STA ADR_5C0,Y
       LDX ZP0EE
?L10   SEC
       ROL
       DEX
       BNE ?L10
       DEY
       BPL ?L9
       CLC
Y1235  RTS
;------------------------------
;***       PAINT          ***
PAINT_CMD JSR L0119
          STA ZP099
          BNE Y1235
          JSR Y1205
          BCS Y1235
          LDA BASMEMTOP
          STA ZP0A2
          LDA BASMEMTOP+1
          STA ZP0A3
          LDA MEMTOP
          SBC #$06
          STA ZP0E7
          LDA MEMTOP+1
          SBC #$00
          STA ZP0E8
PAINT_1   CLC
          LDA ZP0A2
          ADC #$03
          STA ZP0A2
          BCC ?L2
          INC ZP0A3
?L2       CMP ZP0E7
          LDA ZP0A3
          SBC ZP0E8
          BCC ?L3
          JMP ERROR2_2
?L3       LDX ZP0ED
          LDY FR1+3
          JSR Y1238
          BEQ ?L4
          JMP PAINT_16
?L4       JSR Y1241
?L5       JSR Y1242
          TYA
          BMI ?L6
          JSR Y1238
          BNE ?L6
          JSR Y1241
          JMP ?L5
?L6       JSR Y1208
          TYA
          LDY #$00
          STA (ZP0A2),Y
          TXA
          ASL
          ASL
          ASL
          INY
          STA (ZP0A2),Y
          LDY FR1+3
          LDX ZP0ED
?L7       JSR Y1208
          CPY FR1+1
          BCS ?L8
          JSR Y1238
          BNE ?L8
          JSR Y1241
          JMP ?L7
?L8       JSR Y1242
          TYA
          LDY #$02
          STA (ZP0A2),Y
          TXA
          DEY
          ORA (ZP0A2),Y
          STA (ZP0A2),Y
          LDY ZP099
          INY
          CPY FR1
          BCS PAINT_12
          JSR PAINT_19
          JSR PAINT_23
PAINT_9   LDY #$01
          LDA (ZP0A2),Y
          AND #$07
          CMP ZP0ED
          INY
          LDA (ZP0A2),Y
          SBC FR1+3
          BCC PAINT_11
          LDY #$00
          LDA (ZP0A2),Y
          ORA #$80
PAINT_10  STA (ZP0A2),Y
          JMP PAINT_1
PAINT_11  JSR PAINT_21
PAINT_12  LDY ZP099
          DEY
          CPY FR1
          BCS PAINT_15
          JSR PAINT_21
          JSR PAINT_23
PAINT_13  LDY #$01
          LDA (ZP0A2),Y
          AND #$07
          CMP ZP0ED
          INY
          LDA (ZP0A2),Y
          SBC FR1+3
          BCC ?L14
          LDY #$00
          LDA (ZP0A2),Y
          AND #$7F
          BPL PAINT_10
?L14      JSR PAINT_19
PAINT_15  LDY #$01
          LDA (ZP0A2),Y
          AND #$07
          TAX
          INY
          LDA (ZP0A2),Y
          TAY
          JSR Y1208
PAINT_16  JSR Y1208
          STX ZP0ED
          STY FR1+3
          SEC
          LDA ZP0A2
          SBC #$03
          STA ZP0A2
          BCS ?L17
          DEC ZP0A3
?L17      CMP BASMEMTOP
          BNE ?L18
          LDA ZP0A3
          CMP BASMEMTOP+1
          BEQ PAINT_20
?L18      LDY #$00
          LDA (ZP0A2),Y
          BPL PAINT_13
          BMI PAINT_9
PAINT_19  INC ZP099
TEXT_13   CLC
          LDA ZP0DE
          ADC FR1+1
          STA ZP0DE
          BCC PAINT_20
          INC ZP0DF
PAINT_20  RTS
PAINT_21  DEC ZP099
          SEC
          LDA ZP0DE
          SBC FR1+1
          STA ZP0DE
          BCS ?L22
          DEC ZP0DF
?L22      RTS
PAINT_23  LDY #$00
          LDA (ZP0A2),Y
          AND #$7F
          STA FR1+3
          INY
          LDA (ZP0A2),Y
          LSR
          LSR
          LSR
          STA ZP0ED
          RTS
Y1208     CPX FR1+4
          INX
          BCC ?L1
          LDX #$00
          INY
?L1       RTS
Y1242     DEX
          BPL ?L1
          LDX FR1+4
          DEY
?L1       RTS
Y1241     LDA (ZP0DE),Y
          AND ADR_5C0,X
          ORA ADR_5C8,X
          STA (ZP0DE),Y
          RTS
Y1238     LDA (ZP0DE),Y
          ORA ADR_5C0,X
          EOR ADR_5C0,X
          BEQ ?L1
          LDA ADR_5C8
          RTS
?L1       LDA ADR_5C8
          BEQ ?L2
          LDA #$00
          RTS
?L2       LDA #$01
          RTS
;------------------------------
;***       CLS           ***
CLS_CMD JSR CRS_HOME
        LDA DSPFLG
        PHA
        STX DSPFLG
        JSR IOCBNR_J_N
        LDY #$7D
        JSR WRITE_BYTE2
        PLA
        STA DSPFLG
        JMP L0641
;------------------------------
;***       TRACE         ***
TRACE_CMD   LDA (STMCUR),Y
            CMP #$26
            BEQ TRACE_OFF
            LDA #$4C
            LDX #<TRACE_PRINT
            LDY #>TRACE_PRINT
            BNE TRACE_STORE
TRACE_OFF   LDA #$A0
            LDX #$02
            LDY #$B1
TRACE_STORE STA L0984
            STX L0984+1
            STY L0984+2
            RTS
TRACE_PRINT LDA #$5B
            JSR WRITE_BYTE
            LDY #$00
            LDA (STMCUR),Y
            TAX
            INY
            LDA (STMCUR),Y
            JSR L0520
            LDA #$5D
            JSR WRITE_BYTE
            LDY #$02
            LDA (STMCUR),Y
            JMP Y1266
Y1268       JSR PAINT_21
            LDA #$0C
            JMP ERROR_ROUT
;------------------------------
;***       GOSUB         ***
GOSUB_CMD JSR EXEC_BEGIN
;------------------------------
;***       GOTO          ***
GOTO_CMD     JSR L0490
Y1136        STA ZP0A0
             STY ZP0A1
             JSR L0402
             BCS Y1268
             PLA
             PLA
             LDA BRKKEY
             BEQ BREAK_KEY
L0984        LDY #$02
             LDA (STMCUR),Y
Y1266        STA LLNGTH
             INY
?L1          CPY LLNGTH
             BCS ZEILEN_INC
             LDA (STMCUR),Y
             STA STATE_LEN
             INY
             LDA (STMCUR),Y
             INY
             STY STATE_NDX
             JSR JUMP_CMD_TAB
             LDY STATE_LEN
             LDA BRKKEY
             BNE ?L1
BREAK_KEY    JMP BRK_BAS_V
JUMP_CMD_TAB ASL
             STA COMMAND_PTR+1
COMMAND_PTR  JMP (COMMANDS_TAB)
ZEILEN_INC   LDY #$01
             LDA (STMCUR),Y
             BMI ?L2
             CLC
             LDA LLNGTH
             ADC STMCUR
             STA STMCUR
             BCC ?L1
             INC STMCUR+1
?L1          LDA (STMCUR),Y
             BPL L0984
             JMP END_CMD
?L2          JMP L0950
;------------------------------
; ENDE PART 15
;------------------------------

