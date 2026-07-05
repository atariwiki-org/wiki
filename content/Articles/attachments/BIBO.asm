; --------------------------------
; * BIBO-ASSEMBLER V1.0 13/12/86 *
; * (c)1986 E.Reuss / Compy-Shop *
; * (c)2008 by ABBUC             *
; * Sourcefile for XASM 3.0.1    *
; * Disassembled & fixed for     *
; * relocation by Ghost in 2008  * 
; --------------------------------

; Please note your changes below.
; Last update: 02 Mar 2013
; Ghost/ Build 001: 
;   + added pseudo opcode .HS for SynAssembler 
;    compatiblity
;   + added CONF_SETCOLOR config entry 
;     enable(1) or disable(2) orignal BIBO color settings 
; Ghost/ Build 002:
;   + bugfix: monitor command . fixed
; Ghost/ Build 003:
;   + bugfix: VIMIRQ for key press set correctly 
;
;				ORG $0580
;				dta $00

                ORG $9500               ; compile for origin (original  bibo $9500)
                                        ; exe-tailer will be set to 
                                        ; label start ! - see end of this source
; --------------------------------
; Index to string table 
IDX_SYNTAXERR      EQU     $7
IDX_BADADRESS      EQU     $10
IDX_UNDEFLABEL     EQU     $11
IDX_MEMFULL        EQU     $8
IDX_ED2_INUSE      EQU     $B
IDX_CANTMERGE      EQU     $C
IDX_OUTOFRANGE     EQU     $D
IDX_BADLOCALLABEL  EQU     $14
IDX_BADINSTRUCTION EQU     $16
IDX_BRANCH2LONG    EQU     $1A
IDX_MEMSTORAGE     EQU     $1B
IDX_BADLABEL       EQU     $17
IDX_DUPLABEL       EQU     $18
IDX_LOC_O_OF_RANGE EQU     $19 
IDX_LABELNOTFOUND  EQU     $1F
IDX_NESTEDINCUDE   EQU     $20
IDX_FILETYPEERR    EQU     $F
IDX_SOURCEDATAERR  EQU     $9
IDX_COPYRIGHT      EQU     $4
IDX_CANT_MERGE     EQU     $12
IDX_PRINT_DEZ      EQU     $13

CONST_LINENUM_INC  EQU     $A
CONST_BEGIN_OBJ_CODE EQU   $4000       ; default if no .or pseudo op is given, 

; --------------------------------
CONF_SETCOLOR      EQU     0           ; 0 to disable reset of back/front color
; --------------------------------

start
                LDA     #<start-1
                STA     $2E5            ; set MEMTOP to $94FF
                LDA     #>start-1
                STA     $2E6
                LDX     #$FF
                TXS                     ; FLUSH STACK
                JSR     init            ; init leftmrgn, rightmrgn, tabmap
                LDA     $580            ; if $580!=00 it's not the first start
                BNE     warmstartbibo   ; of biboass => warmstart

command_new                            ; no, its the first start
                LDX     #0
                TXA                     ; complete init necessary

loop2                                  ; CODE XREF seg0009521j
                STA     $80,X
                STA     $500,X          ; clear mem
                STA     $580,X          ; signal first start and asm not in inc mode
                INX     
                BPL     loop2
                STX     $580            ; set to $FF to signal that bibo is started
                LDA     $2E7            ; cpy MEMLO to zero page 80,81 == LOWMEM
                STA     $80
                LDA     $2E8
                STA     $81
                LDA     $2E5            ; cpy MEMTOP to zero page 84,85,86,87
                STA     $86
                STA     $84
                LDA     $2E6
                STA     $87
                STA     $85
                JSR     saveVIMMEDIRQ
                JSR     copyLOWMEMptr
                LDA     #0
                STA     $5F9            ; set line number to 0
                STA     $5FA            ; line number to 0 high byte
                LDA     #CONST_LINENUM_INC
                STA     $5FB            ; set auto line # inc. to 10
                LDX     #IDX_COPYRIGHT  ; fourth msg = copyright msg ..4 words (=ptr)
                JSR     printbibomsg    ; see ptr_copyright_t

warmstartbibo                          ; CODE XREF seg0009513j
                JSR     restorVIMMEDIRQ
                LDA     #0
                STA     $58B            ; flag for read only channel ($FF current channel read only)
                STA     $58C            ; input set to keyboard(==0). From disk (==$FF) see command_ent
                JSR     closeallchannel

initassembler2                         ; CODE XREF print+35j seg000B0FBj
                                        ; ...
                LDA     #<called_by_brk
                STA     $206
                LDA     #>called_by_brk
                STA     $207            ; set VBREAK to $B624 (called if BRK is reached by CPU)
                JSR     init
                LDA     #0
                STA     $58F            ; flag for auto line number ($FF auto,$00 no auto)??#
                LDA     $592            ; message switch(0=Edit>, 1=Inc>, 2=Ed.2>, 3=Mon>)
                CMP     #3              ; 3==Monitor, 0==Assembler
                BNE     initassembler   ; ok, init assembler
                JMP     initass_or_mon
;----------------------------------------------------------------------------

initassembler                          ; CODE XREF seg000957Bj seg00095B4j
                JSR     prnmsg_setcolor

editorloop                             ; CODE XREF seg000958Ej seg00095BFj
                                        ; ...
                JSR     waitinputline   ; wait for the return key is pressed
                LDY     #$FF
                STY     $C3             ; set assembler pass counter to $FF
                INY                     ; and y register to 0
                JSR     getchr_src_400  ; read from input buffer into accu
                BCS     editorloop      ; if 00 was read, loop
                CMP     #'A'            ; check if its a line number
                BCC     jmpchecklineno  ; if lower than ASCII "A", branch..maybe a linenumber
                LDA     #<bibcmds
                STA     $94
                LDA     #>bibcmds       ; original 0xBB58 into zero page 94,95
                STA     $95             ; begin of the command/jmp table (LIS,ASM..)
                LDA     #0
                STA     $9A
                LDA     #4              ; pointer to input buffer 0x400 in $9A,$9B
                STA     $9B
                JSR     startcomp_cmd
                BNE     syntaxerror
                LDX     #0
                JSR     asm_command
                JSR     asm_command
                JSR     cmd_to_stack    ; push cmd address onto stack and rts
                JMP     initassembler
;----------------------------------------------------------------------------

syntaxerror                            ; CODE XREF seg00095A7j checklinenumber+17j
                                        ; ...
                LDY     #IDX_SYNTAXERR              ; print "Syntax" error
                JMP     mainerrorhndler ; handle error
;----------------------------------------------------------------------------

jmpchecklineno                         ; CODE XREF seg0009592j
                JSR     checklinenumber
                JMP     editorloop
;----------------------------------------------------------------------------

command_dos                            ; call dos
                LDA     #2
                STA     $52             ; LMARGN set to 2
                JMP     ($A)            ; jump to DOS
;----------------------------------------------------------------------------

command_bib                            ; jump into 4k or 16k bibomon (if installed -)
                LDA     $C000
                CMP     #$68            ; check magic for bibomon 4k or 16k
                BNE     bibomonnotinsta
                JMP     $C001           ; start bibomon at $c001
;----------------------------------------------------------------------------

bibomonnotinsta                        ; CODE XREF seg00095CEj
                RTS                     ; 4k or 16k is not installed so return to edit>
;----------------------------------------------------------------------------

badadress_error                        ; CODE XREF addr_frm_param+3j
                                        ; addr_frm_param+35j
                                        ; ...
                LDY     #IDX_BADADRESS   ; print "Bad address" error
                JMP     mainerrorhndler

;----------------------------------------------------------------------------

;               S u b r o u t i n e

addr_frm_param                         ; CODE XREF seg00096F7p seg000A085p
                                        ; ...
                JSR     getvalidchar
                BCS     badadress_error ; if char is 00
                JSR     checkparampos

calc_addr_init                         ; CODE XREF copy_af_2_ad+1B2p
                LDX     #0
                STX     $B7             ; lowbyte address (eg. lda $1122 => $22)..is calc. in add_address
                STX     $B8             ; highbyte address (e.g lda $1122 => $11)
                STX     $583
                STX     $58D

calc_address                           ; CODE XREF addr_frm_param+8Cj
                                        ; addr_frm_param+9Cj
                LDX     #0
                STX     $584            ; signals add_address, $584 > 0 signals subtract_add
                JSR     get_param_chr   ; load parameter in accu
                BCS     error           ; error
                CMP     #'+'
                BEQ     is_plus_char
                CMP     #'-'
                BEQ     is_minus_char
                LDY     $583
                BEQ     chk_type        ; if it is a normal address e.g. dec or hex value1
                CMP     #','
                BEQ     is_c_space_brac
                CMP     #' '
                BEQ     is_c_space_brac
                CMP     #')'
                BNE     badadress_error

is_c_space_brac                        ; CODE XREF addr_frm_param+2Dj
                                        ; addr_frm_param+31j
                JSR     checkparampos

error                                  ; CODE XREF addr_frm_param+1Cj
                LDY     $58D
                RTS     
;----------------------------------------------------------------------------

is_minus_char                          ; CODE XREF addr_frm_param+24j
                INC     $584            ; $584 > 0 signals minus address

is_plus_char                           ; CODE XREF addr_frm_param+20j
                JSR     get_param_chr

chk_type                               ; CODE XREF addr_frm_param+29j
                CMP     #'$'
                BEQ     hex_addr_2_9c9d ; if it is a hex address
                CMP     #$27            ; $27 is '
                BEQ     asciival        ; e.g. LDA #'K
                CMP     #'*'            ; with offset  e.g. beq *+10
                BEQ     addr_with_offse
                CMP     #'%'            ; as dual value e.g. %00001000
                BEQ     address_dual
                CMP     #'0'
                BCC     label_address   ; small than "0", branch
                CMP     #$3A
                BCC     dec_address     ; if it is low than 10, it is a digit 0..9, => decimal address

label_address                          ; CODE XREF addr_frm_param+56j
                JSR     chk_local_label ; check for local label, OK than is carry == 1
                BCC     badadress_error ; if carry is not set error
                JSR     calcsymboladdr  ; label to address ($9C, $9D)
                BCC     add9c_2_b7      ; no error than add to 9c,9d to b7,b8
                DEC     $58D
                LDA     $C3             ; load pass counter (0=pass 1)
                BEQ     add9c_2_b7      ; pass1 then add 9c,9d to b7,b8

undeflabelerr                            ; CODE XREF seg000A5CFj seg000A6A5j
                LDY     #IDX_UNDEFLABEL  ; print "Undefined label" erro
                JMP     mainerrorhndler ; handle error
;----------------------------------------------------------------------------

hex_addr_2_9c9d                        ; CODE XREF addr_frm_param+46j
                JSR     addr2_9c9d

add9c_2_b7                             ; CODE XREF addr_frm_param+64j
                                        ; addr_frm_param+6Bj
                                        ; ...
                LDX     #$9C

add_address                            ; CODE XREF addr_frm_param+A1j
                                        ; addr_frm_param+ABj
                                        ; ...
                INC     $583
                LDA     $584            ; $584 != 0 signals "-" address
                BNE     subtract_addr
                CLC                     ; OK..add $9c,$9d to $B7,$B8
                LDA     $B7             ; load $b7
                ADC     0,X             ; add zeropage address $9c to accu
                STA     $B7             ; store lowbyte of address in b7
                LDA     $B8             ; load high byte of address
                ADC     1,X             ; add zero page address $9d to accu
                STA     $B8             ; and store high byte in b8
                JMP     calc_address    ; if there is a "+".. calc next address and add to $b7,$b8
;----------------------------------------------------------------------------

subtract_addr                          ; CODE XREF addr_frm_param+7Dj
                SEC     
                LDA     $B7             ; load address
                SBC     0,X             ; subtract "-" address from lowbyte
                STA     $B7             ; and store in $B7
                LDA     $B8
                SBC     1,X             ; same for the high byte
                STA     $B8
                JMP     calc_address    ; check if there is more to do, eg. another "-"..
;----------------------------------------------------------------------------

addr_with_offse                        ; CODE XREF addr_frm_param+4Ej
                LDX     #$BB            ; $BB,$BC is the current pos in object code
                BNE     add_address     ; use X=$BB for add $00,X => add zeropage $BB to accu...

dec_address                            ; CODE XREF addr_frm_param+5Aj
                JSR     locallabelvalue ; dec val as hex into $A0 and $A1
                JSR     checkparampos
                LDX     #$A0            ; load X=$A0..used in to add 0,X => zeroage $a0 is added to $B7..
                BNE     add_address

asciival                               ; CODE XREF addr_frm_param+4Aj
                JSR     get_param_chr
                BCS     jmp_bad_add_err
                STA     $9C
                LDA     #0
                STA     $9D
                BEQ     add9c_2_b7

address_dual                           ; CODE XREF addr_frm_param+52j
                LDA     #0
                STA     $92
                STA     $93             ; clear only because 93 is added!!..but not further used in this routine
                LDX     #7              ; 8 dual digits to handle

nextdualdigit                          ; CODE XREF addr_frm_param+D5j
                JSR     get_param_chr
                BCS     add2addr_92
                CMP     #$30
                BCC     enddualval      ; value < "0"
                CMP     #$32
                BCS     enddualval      ; value >= "2"
                AND     #1              ; no, than let 0 or 1 be alive -)
                ROR     @               ; move 0 or 1 into carry
                ROL     $92             ; move carry at pos 0 in $92
                DEX     
                BPL     nextdualdigit   ; next digit

add2addr_92                            ; CODE XREF addr_frm_param+C5j
                                        ; addr_frm_param+DEj
                LDX     #$92            ; use X=$92 to add to addres (adc $00,X..zeroage address $92 is added to $B7..)
                BNE     add_address

enddualval                             ; CODE XREF addr_frm_param+C9j
                                        ; addr_frm_param+CDj
                JSR     checkparampos
                JMP     add2addr_92     ; jump to add $92 to $B7 and $93 to $B8
;----------------------------------------------------------------------------

jmp_bad_add_err                        ; CODE XREF addr_frm_param+B0j
                                        ; addr2_9c9d+9j
                JMP     badadress_error
; End of function addr_frm_param


;----------------------------------------------------------------------------

;               S u b r o u t i n e

addr2_9c9d                             ; CODE XREF addr_frm_param+72p
                LDX     #0
                STX     $9C
                STX     $9D
                JSR     char2hex9c      ; copy param into 9c, 9d
                BCC     jmp_bad_add_err ; carry clear, than error

addr2_9c9d_loop                        ; CODE XREF addr2_9c9d+Ej
                JSR     char2hex9c
                BCS     addr2_9c9d_loop ; transfer next byte into 9c old 9c is rotated into 9d
                RTS     
; End of function addr2_9c9d


;----------------------------------------------------------------------------

;               S u b r o u t i n e

char2hex9c                             ; CODE XREF addr2_9c9d+6p
                                        ; addr2_9c9d+Bp ...
                JSR     get_param_chr
                EOR     #$30
                CMP     #$A
                BCC     lownibble2_9c   ; branch if < 10  ASCII(00..09)
                ADC     #$88
                CMP     #$FA
                BCS     lownibble2_9c   ; branch if >= FA (FA..FF)
                JSR     checkparampos   ; error?
                LDX     #0
                RTS     
;----------------------------------------------------------------------------

lownibble2_9c                          ; CODE XREF char2hex9c+7j
                                        ; char2hex9c+Dj
                LDX     #3
                ASL     @               ; shift lower nibble into high nibble
                ASL     @
                ASL     @
                ASL     @

rollaccu_9c                            ; CODE XREF char2hex9c+21j
                ASL     @               ; shift bit 7 into carry
                ROL     $9C             ; roll it into 9c
                ROL     $9D             ; old bit 7 is rolled into 9d
                DEX     
                BPL     rollaccu_9c     ; 4 times to roll val into $9c
                SEC                     ; set carry
                INX                     ; set x back to 0
                RTS     
; End of function char2hex9c

;----------------------------------------------------------------------------
command_val
                JSR     findparambegin
                JSR     addr_frm_param
                LDX     #IDX_CANT_MERGE     ; print message can't merge
                JSR     printbibomsg

command_val2
                LDX     $B7
                STX     $9E
                LDY     $B8
                STY     $9F             ; store line numer in 9e, 9f
                JSR     to_hexstring
                LDX     #IDX_PRINT_DEZ            ; print "   DEZ="
                JSR     printbibomsg
                JSR     print_line_no
                JMP     printnewline
;----------------------------------------------------------------------------

command_lis                            ; check if lis is with parameter
                LDY     $97
                CPY     $C7             ; compare with length of command (3==3)
                BEQ     lis_withoutpara ; yes, without parameter

skipspace3                             ; CODE XREF seg0009721j
                INY     
                LDA     $3FF,Y
                CMP     #$20            ; check for space
                BEQ     skipspace3      ; if space than skip
                CMP     #'@'            ; check for "at"-undocumented in handbook
                BCS     at_as_parameter
                DEX     
                DEX     
                BMI     lis_withoutpara
                BEQ     oneparameter
                JSR     oneormoreparam
                LDX     #$8A
                JSR     twoparameter

loop_lis                               ; CODE XREF seg0009742j lis_withoutpara+10j
                LDA     $B9             ; B9,BA is current pos in src
                CMP     $A7             ; a7,a8 is the end of the src
                LDA     $BA
                SBC     $A8
                BCS     end_of_src      ; check if end of source ist reached
                JSR     print_src_line  ; print line of src code
                BEQ     loop_lis

end_of_src                             ; CODE XREF seg000973Dj
                RTS     
;----------------------------------------------------------------------------

at_as_parameter                        ; CODE XREF seg0009725j
                STY     $97             ; store current position in commandline
                JSR     sub_FFFFF6C0_9AA1
                BCS     callrts
                JSR     loc_FFFFF6C0_9782
                JMP     nextparam

;----------------------------------------------------------------------------

;               S u b r o u t i n e

lis_withoutpara                        ; CODE XREF seg0009719j seg0009729j
                                        ; ...
                LDA     $84             ; save begin of source in
                STA     $B9             ; $ba and $b9
                LDA     $85             ; =>list complete source code
                STA     $BA

nextparam                              ; CODE XREF seg000974Fj lis_withoutpara+28j
                LDA     $86
                STA     $A7
                LDA     $87
                STA     $A8
                BNE     loop_lis

oneparameter                           ; CODE XREF seg000972Bj
                LDX     $97             ; load position in command line

skipspace2                             ; CODE XREF lis_withoutpara+1Aj
                INX     
                LDA     $3FF,X
                CMP     #$20            ; check for space
                BEQ     skipspace2
                LDY     $C8
                LDA     $3FF,Y
                CMP     #','
                BNE     oneormoreparam
                JSR     oneormoreparam
                JMP     nextparam
; End of function lis_withoutpara


;----------------------------------------------------------------------------

;               S u b r o u t i n e

oneormoreparam                         ; CODE XREF seg000972Dp lis_withoutpara+23j
                                        ; ...
                LDX     #$88
                JSR     sub_FFFFF6C0_9AA8

loc_FFFFF6C0_9782                      ; CODE XREF seg000974Cp
                LDA     $A5
                STA     $B9
                LDA     $A6
                STA     $BA
                BCC     callrts
; End of function oneormoreparam


;----------------------------------------------------------------------------

;               S u b r o u t i n e

print_src_line                         ; CODE XREF seg000973Fp seg0009E3Dp
                                        ; ...
                JSR     printnewline    ; print new line $9B on screen
; End of function print_src_line


;----------------------------------------------------------------------------

;               S u b r o u t i n e

printsrcline                           ; CODE XREF sub_FFFFF6C0_A4D1+8p
                LDA     #0
                STA     $C0
                LDA     #$FF
                STA     $2FE            ; DISPLYFLG != 0=>ctrlcode is displayed as ATASCII
                JSR     ldacharfromsrc  ; load # of chars in line (see srcdoc.txt "source code structure")
                JSR     ldacharfromsrc  ; load lowbyte of line number
                STA     $9E             ; and store it in $9e
                JSR     ldacharfromsrc  ; load highbyte of line number

loc_FFFFF6C0_97A3                      ; store it in $9f
                STA     $9F
                JSR     print_line_no   ; print line # in ASCII (5 digits)
                LDA     #0
                STA     $C4             ; number of chars in source line counter (max $FF)
                STA     $BF
                LDA     #' '            ; print space as separator from line # to source

printchar                              ; CODE XREF printsrcline+2Fj
                                        ; printsrcline+39j
                JSR     print

getnext                                ; CODE XREF printsrcline+46j
                JSR     nextcharfromsrc ; next char from src in accu
                CMP     #'-'            ; check for separator '-'
                BEQ     expandminus     ; yes than expand - to a line of -
                DEC     $C4             ; dec max number of chars in line counter
                CMP     #0              ; check max number of chars in source line (max $FF)
                BNE     printchar       ; not max reached than print char of source
                STA     $C0
                STA     $2FE            ; DISPLYFLG==0 => interpret ctrlcodes

callrts                                ; CODE XREF seg000974Aj oneormoreparam+Dj
                RTS     
;----------------------------------------------------------------------------

expandminus                            ; CODE XREF printsrcline+29j
                BIT     $C4             ; is '-' not on 1. position???
                BMI     printchar       ; yes than print only one '-' on screen
                LDY     #$1E            ; 30 '-' chars as separator
                STY     $C0             ; store in c0

printlineloop                          ; CODE XREF printsrcline+44j
                JSR     printminus
                DEC     $C0
                BNE     printlineloop   ; print line of minus
                BEQ     getnext
; End of function printsrcline


;----------------------------------------------------------------------------

;               S u b r o u t i n e

printminus                             ; CODE XREF printsrcline+3Fp
                                        ; seg0009B5Cp ...
                LDA     #'-'            ; prints a "-" on the current position in the editor
                JMP     print
; End of function printminus


;----------------------------------------------------------------------------

;               S u b r o u t i n e

ldacharfromsrc                         ; CODE XREF printsrcline+9p
                                        ; printsrcline+Cp ...
                LDY     #0
                STY     $C2
                LDA     ($B9),Y         ; load char from source
; End of function ldacharfromsrc


;----------------------------------------------------------------------------

;               S u b r o u t i n e

inc_src_ptr                            ; CODE XREF nextcharfromsrc+18j
                                        ; nextcharfromsrc+1Cj
                                        ; ...
                INC     $B9             ; 16 bit increment of
                BNE     b9isnot0        ; the pointer to the source code
                INC     $BA

b9isnot0                               ; CODE XREF inc_src_ptr+2j
                RTS     
; End of function inc_src_ptr


;----------------------------------------------------------------------------

;               S u b r o u t i n e

nextcharfromsrc                        ; CODE XREF printsrcline+24p
                                        ; seg0009DF8p ...
                LDY     #0
                LDA     $C2             ; load number of spaces to print to the next real char
                BNE     printtabspace
                LDA     ($B9),Y         ; load next char from source code
                PHA     
                CMP     #'"'            ; check for string begin or end mark '"'
                BNE     noquotationmark ; no string begin or end, than branch
                LDA     $C0             ; toggle string '"' flag
                EOR     #$80            ; str begin => $c0==$80
                STA     $C0             ; string end => $c0 ==$00

noquotationmark                        ; CODE XREF nextcharfromsrc+Bj
                BIT     $C0             ; bit 7 to n
                BPL     noorendofstring ; if n-flag == 0 => no string or end of string
                PLA     
                JMP     inc_src_ptr
;----------------------------------------------------------------------------

noorendofstring                        ; CODE XREF nextcharfromsrc+15j
                PLA     
                BPL     inc_src_ptr     ; if not negativ (bit 7 is 0) it's normal char
                AND     #$7F            ; else it is a space marked with bit 7 set
                STA     $C2             ; so set bit 7 to 0 and store number ob tabspace
                JSR     inc_src_ptr     ; inc source pointer source pointer b9,ba

printtabspace                          ; CODE XREF nextcharfromsrc+4j
                DEC     $C2             ; dec # of spaces to print
                LDA     #$20            ; print a space after return
                RTS     
; End of function nextcharfromsrc


;----------------------------------------------------------------------------

;               S u b r o u t i n e

cmd_to_stack                           ; CODE XREF seg00095B1p copy_af_2_ad+156j
                LDY     #1
                LDA     ($98),Y         ; load data from jmptable highbyte
                PHA                     ; and push it onto stack
                DEY     
                LDA     ($98),Y         ; load lowbyte from jmptable
                PHA                     ; push it onto stack
                RTS                     ; load address+1 from stack (exec of cmd)
; End of function cmd_to_stack


;----------------------------------------------------------------------------

;               S u b r o u t i n e

startcomp_cmd                          ; CODE XREF seg00095A4p copy_af_2_ad+13Ap
                                        ; ...
                LDY     #0
                JSR     charfromopcode  ; load char from (94,95) opcodes/pseudo ops ..eg. A874
                STA     $96             ; store #$0f in $96 .. length of table entry
                JSR     charfromopcode  ; load next char from a875
                STA     $97             ; store #$03 in $97...length of cmd/opcode to compare

cmp_cmd_or_opc                         ; CODE XREF startcomp_cmd+43j
                                        ; startcomp_cmd+47j
                LDY     #0

compareloop                            ; CODE XREF startcomp_cmd+25j
                LDA     ($94),Y         ; load first real char from opcode
                BEQ     inc9495_setY2FF ; is it zero,load next char from 94 and inc 94,95, set Y=FF
                CMP     ($9A),Y         ; compare with input buffer
                BEQ     buff_charis00   ; char is equal then branch
                CPY     #1
                BNE     next_cmd_or_opc
                LDA     ($9A),Y
                CMP     #'.'            ; check if it is a command abbreviation e.g. "L." for LIS
                BEQ     cmd_abbreviatio
                BNE     next_cmd_or_opc

buff_charis00                          ; CODE XREF startcomp_cmd+14j
                INY     
                CPY     $97             ; max chars to compare (e.g. 03 for command/opcodes)
                BNE     compareloop     ; e.g 3 not reached than compare next char
                BEQ     set98_99_2_data

cmd_abbreviatio                        ; CODE XREF startcomp_cmd+1Ej
                INY     

set98_99_2_data                        ; CODE XREF startcomp_cmd+27j
                CLC                     ; comand was identified
                LDA     $94             ; the pointer to the routinepointer
                ADC     $97             ; is stored in $98,$99
                STA     $98             ; see routine "cmd_to_stack"
                LDA     $95
                ADC     #0
                STA     $99
                STY     $97
                LDY     #0              ; clear Y, set zero flag and return
                RTS     
;----------------------------------------------------------------------------

next_cmd_or_opc                        ; CODE XREF startcomp_cmd+18j
                                        ; startcomp_cmd+20j
                CLC     
                LDA     $94
                ADC     $96             ; offset to set pointer(94,95) to next struct
                STA     $94             ; store pointer
                BCC     cmp_cmd_or_opc
                INC     $95             ; handle high byte increment
                BNE     cmp_cmd_or_opc

inc9495_setY2FF                        ; CODE XREF startcomp_cmd+10j
                JSR     increase94_95
                LDY     #$FF
                RTS     
; End of function startcomp_cmd


;----------------------------------------------------------------------------

;               S u b r o u t i n e

charfromopcode                         ; CODE XREF startcomp_cmd+2p
                                        ; startcomp_cmd+7p
                LDA     ($94),Y         ; load bytes from opcode table (a874...)
; End of function charfromopcode


;----------------------------------------------------------------------------

;               S u b r o u t i n e

increase94_95                          ; CODE XREF startcomp_cmd+49p
                INC     $94             ; inc pointer to opcodes
                BNE     notinc95
                INC     $95             ; inc of highbyte

notinc95                               ; CODE XREF increase94_95+2j
                RTS     
; End of function increase94_95


;----------------------------------------------------------------------------

;               S u b r o u t i n e

asm_command                            ; CODE XREF seg00095ABp seg00095AEp
                                        ; ...
                STX     $C0

loopcmd                                ; CODE XREF asm_command+Bj
                JSR     get_param_chr
                BCS     iszero
                EOR     #$30
                CMP     #$A
                BCS     loopcmd
                JSR     locallabelvalue
                LDX     $C0
                LDA     $A0
                STA     $88,X
                INX     
                LDA     $A1
                STA     $88,X
                INX     

iszero                                 ; CODE XREF asm_command+5j
                RTS     
; End of function asm_command


;----------------------------------------------------------------------------

;               S u b r o u t i n e

locallabelvalue                        ; CODE XREF addr_frm_param+A3p
                                        ; asm_command+Dp ...
                JSR     checkparampos
                LDA     #0
                STA     $A0
                STA     $A1
                STA     $58E

dec_value                              ; CODE XREF locallabelvalue+2Ej
                LDA     #$A             ; base 10 for dec
                STA     $A2             ; stored in A2
                LDX     #0
                JSR     get_param_chr
                EOR     #$30            ; ascii - $30
                CMP     #$A             ; check for hex
                BCS     greateq_hex_a   ; end or error >9

convertloop                            ; CODE XREF locallabelvalue+25j
                ADC     $A0
                PHA     
                TXA     
                ADC     $A1
                TAX     
                PLA     
                DEC     $A2
                BNE     convertloop
                STA     $A0
                STX     $A1
                INC     $58E
                BNE     dec_value

greateq_hex_a                          ; CODE XREF locallabelvalue+19j
                LDX     #0
                RTS     
; End of function locallabelvalue


;----------------------------------------------------------------------------

;               S u b r o u t i n e

getvalidchar                           ; CODE XREF addr_frm_paramp
                                        ; getvalidchar+5j ...
                JSR     get_param_chr
                BCS     returnimmediate ; char is eg. 00
                BEQ     getvalidchar    ; if z=0 continue search

returnimmediate                        ; CODE XREF getvalidchar+3j
                RTS     
; End of function getvalidchar


;----------------------------------------------------------------------------

;               S u b r o u t i n e

get_param_chr                          ; CODE XREF addr_frm_param+19p
                                        ; addr_frm_param+41p
                                        ; ...
                LDY     $C8             ; begin position of first param in Y
; End of function get_param_chr


;----------------------------------------------------------------------------

;               S u b r o u t i n e

getchr_src_400                         ; CODE XREF seg000958Bp checklinenumber+2p
                                        ; ...
                LDA     $400,Y          ; 0x400 is the input buffer
                STA     $C4
                BEQ     charis00
                INY     
                STY     $C8             ; store current position in string
                CMP     #$20            ; set n flag if char is < or > as space
                CLC                     ; clear the carry
                RTS                     ; return accu contains the char
;----------------------------------------------------------------------------

charis00                               ; CODE XREF getchr_src_400+5j
                LDA     #$20            ; exchange 00 with space
                CMP     #$20            ; set zero and carry flag
                RTS     
; End of function getchr_src_400


;----------------------------------------------------------------------------

;               S u b r o u t i n e

checkparampos                          ; CODE XREF addr_frm_param+5p
                                        ; addr_frm_param+37p
                                        ; ...
                PHA                     ; put char on stack
                LDA     $C4             ; load original char, see getvalidchar
                BEQ     is00            ; if it is 00?
                LDA     $C8             ; load position in parameter string
                BEQ     is00            ; if it is 0 than
                DEC     $C8             ; else go one back in param string

is00                                   ; CODE XREF checkparampos+3j
                                        ; checkparampos+7j
                PLA                     ; restore char in accu
                RTS     
; End of function checkparampos


;----------------------------------------------------------------------------

;               S u b r o u t i n e

saveVIMMEDIRQ                          ; CODE XREF seg000953Ep
                LDA     $216            ; save VIMMEDIRQ
                STA     $5FC            ; into $5FC, $5Fd
                LDA     $217
                STA     $5FD
                RTS     
; End of function saveVIMMEDIRQ


;----------------------------------------------------------------------------

;               S u b r o u t i n e

copyLOWMEMptr                          ; CODE XREF seg0009541p seg000A0A5p
                                        ; ...
                LDA     $80             ; copy LOWMEM to 82,83
                STA     $82
                LDA     $81
                STA     $83
                LDX     #$36            ; clear 37 bytes

loop4                                  ; CODE XREF copyLOWMEMptr+10j
                LDA     #0
                STA     $5C0,X          ; from $5c0 ...
                DEX     
                BPL     loop4
                RTS     
; End of function copyLOWMEMptr


;----------------------------------------------------------------------------

;               S u b r o u t i n e

init                                   ; CODE XREF seg000950Dp seg000956Ep
                LDX     #4

loop1                                  ; CODE XREF init+9j seg0009923u
                LDA     tabmap,X         ; init the TABMAP (2a3..)
                STA     $2A3,X          ; with data from $9923
                DEX     
                BPL     loop1
                LDA     #2
                STA     $52             ; LMARGN to 2
                LDA     #$27
                STA     $53             ; RMARGN to $27
                RTS     
; End of function init

;----------------------------------------------------------------------------
tabmap          dta    0 ;            ; data for TABMAP ($02a3)
                dta  $80 ; €
                dta  $44 ; D
                dta    5 ;  
                dta  $55 ; U

;----------------------------------------------------------------------------

;               S u b r o u t i n e

checklinenumber                        ; CODE XREF seg00095BCp
                LDY     #0
                JSR     getchr_src_400
                JSR     locallabelvalue
                LDA     $58E            ; load number of digits in line num
                BEQ     syntax_error    ; 0 => error, no line number
                CMP     #6              ; check num of digits in line number
                BCS     syntax_error    ; not more than 5 digits are allowed in a line number
                LDA     $A1             ; load high byte of line number
                CMP     #$FA            ; and check for limit of dec 64000 as max line number
                BCC     validlinenumber ; <64000 => valid line number

syntax_error                           ; CODE XREF checklinenumber+Bj
                                        ; checklinenumber+Fj
                JMP     syntaxerror
;----------------------------------------------------------------------------

validlinenumber                        ; CODE XREF checklinenumber+15j
                LDA     $58E            ; load num of digits in line number
                CMP     $C7             ; how many chars where typed in
                BNE     more_than_linen ; not equal, more than the line number as input
                LDA     $A0             ; low byte line number
                STA     $88
                LDA     $A1             ; high byte line number
                STA     $89
                JMP     loc_FFFFF6C0_9A5C
;----------------------------------------------------------------------------

more_than_linen                        ; CODE XREF checklinenumber+1Fj
                LDA     $C4
                CMP     #$20
                BEQ     loc_FFFFF6C0_995D ; branch if last char was a space
                JSR     checkparampos

loc_FFFFF6C0_995D                      ; CODE XREF checklinenumber+30j
                                        ; seg0009FB0p
                LDY     $C8             ; load current pos in input buffer
                LDA     $400,Y          ; 0x400 is the input buffer
                CMP     #'-'            ; if char an "-"
                BEQ     char_was_minus
                LDA     #1
                STA     $BF
                STA     $C0
                TAX     

loc_FFFFF6C0_996D                      ; CODE XREF checklinenumber+60j
                                        ; checklinenumber+66j
                                        ; ...
                INX     

loc_FFFFF6C0_996E                      ; CODE XREF checklinenumber+74j
                STA     $480,X
                JSR     get_param_chr
                BCS     loc_FFFFF6C0_99A7
                PHP     
                PHA     
                CMP     #'"'
                BNE     loc_FFFFF6C0_9982
                LDA     $BF
                EOR     #$80
                STA     $BF

loc_FFFFF6C0_9982                      ; CODE XREF checklinenumber+52j
                PLA     
                BIT     $BF
                BPL     loc_FFFFF6C0_998B
                PLP     
                JMP     loc_FFFFF6C0_996D
;----------------------------------------------------------------------------

loc_FFFFF6C0_998B                      ; CODE XREF checklinenumber+5Dj
                AND     #$7F
                PLP     
                BNE     loc_FFFFF6C0_996D
                LDA     $480,X
                BMI     loc_FFFFF6C0_9998
                LDA     #$80
                INX     

loc_FFFFF6C0_9998                      ; CODE XREF checklinenumber+6Bj
                ADC     #1
                CMP     #$C0
                BCC     loc_FFFFF6C0_996E
                LDA     #$81
                BNE     loc_FFFFF6C0_996D

char_was_minus                         ; CODE XREF checklinenumber+3Cj
                LDX     #3
                STA     $480,X          ; store char at fourth position

loc_FFFFF6C0_99A7                      ; CODE XREF checklinenumber+4Cj
                LDA     #0
                STA     $C7
                INX     
                STA     $480,X          ; store 00 at next position in buffer
                INX     
                STX     $C6             ; store index to next position in $C6
                STX     $480            ; in first byte of buffer
                LDA     $A0             ; load line number low
                STA     $481            ; store it in second byte
                STA     $5F9
                LDA     $A1             ; load high byte line number
                STA     $482            ; store as third byte
                STA     $5FA
                LDX     #$A0
                JSR     sub_FFFFF6C0_9AA8
                BCC     loc_FFFFF6C0_99DC
                LDX     #1

loc_FFFFF6C0_99CE                      ; CODE XREF checklinenumber+AFj
                LDA     $A5,X
                STA     $A3,X
                LDA     $A7,X
                STA     $A5,X
                DEX     
                BPL     loc_FFFFF6C0_99CE
                JSR     sub_FFFFF6C0_9A76

loc_FFFFF6C0_99DC                      ; CODE XREF checklinenumber+A2j
                SEC     
                LDX     #$FF

loc_FFFFF6C0_99DF                      ; CODE XREF checklinenumber+C0j
                LDA     $85,X
                SBC     $C7,X
                STA     $8F,X
                STA     $91,X
                INX     
                BEQ     loc_FFFFF6C0_99DF
                LDA     $8E
                CMP     $80
                LDA     $8F
                SBC     $81
                BCC     memfullerror
                LDY     #0

loc_FFFFF6C0_99F6                      ; CODE XREF checklinenumber+E4j
                                        ; checklinenumber+E8j
                LDA     $84
                CMP     $A5
                LDA     $85
                SBC     $A6
                BCS     loc_FFFFF6C0_9A12
                LDA     ($84),Y
                STA     ($90),Y
                INC     $84
                BNE     loc_FFFFF6C0_9A0A
                INC     $85

loc_FFFFF6C0_9A0A                      ; CODE XREF checklinenumber+DEj
                INC     $90
                BNE     loc_FFFFF6C0_99F6
                INC     $91
                BNE     loc_FFFFF6C0_99F6

loc_FFFFF6C0_9A12                      ; CODE XREF checklinenumber+D6j
                LDA     #4
                STA     $8B
                STA     $8D
                CLC     
                LDA     #$80
                STA     $8A
                ADC     ($8A),Y
                STA     $8C
                DEC     $8C
                JSR     copy_8a_2_90
                LDA     $8E
                STA     $84
                LDA     $8F
                STA     $85
                RTS     
; End of function checklinenumber


;----------------------------------------------------------------------------

;               S u b r o u t i n e

copy_8a_2_90                           ; CODE XREF checklinenumber+FBp
                                        ; copy_8a_2_90+7j ...
                LDA     ($8A),Y         ; copy buffer $0480+Y
                STA     ($90),Y         ; to $94xx
                JSR     increase_8a_90
                BCC     copy_8a_2_90    ; copy loop
                RTS     
; End of function copy_8a_2_90


;----------------------------------------------------------------------------

;               S u b r o u t i n e

increase_8a_90                         ; CODE XREF copy_8a_2_90+4p
                                        ; sub_FFFFF6C0_9C90+F4p
                                        ; ...
                INC     $90             ; increase 16 bit point (90,91)
                BNE     skip_highb_inc
                INC     $91

skip_highb_inc                         ; CODE XREF increase_8a_90+2j
                LDA     $8A
                CMP     $8C
                LDA     $8B
                SBC     $8D
                INC     $8A             ; increase source buffer pointer
                BNE     skip_highb_inc2
                INC     $8B

skip_highb_inc2                        ; CODE XREF increase_8a_90+10j
                RTS     
; End of function increase_8a_90

;----------------------------------------------------------------------------

memfullerror                           ; CODE XREF checklinenumber+CAj
                                        ; seg0009C84j ...
                LDY     #IDX_MEMFULL              ; print "Memory full"
                JMP     mainerrorhndler ; handle error
;----------------------------------------------------------------------------
synterror         JMP     syntaxerror               
command_del     
                DEX
                DEX
                BMI     synterror
                BNE     loc_FFFFF6C0_9A5C
;----------------------------------------------------------------------------

loc_FFFFF6C0_9A5C                      ; CODE XREF checklinenumber+29j
                LDA     $88
                STA     $8A
                LDA     $89
                STA     $8B
                LDX     #$88
                JSR     sub_FFFFF6C0_9AA8
                LDA     $A5
                STA     $A3
                LDA     $A6
                STA     $A4
                LDX     #$8A
                JSR     twoparameter

;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_9A76                      ; CODE XREF checklinenumber+B1p
                                        ; seg0009DB8p
                LDY     #0

loc_FFFFF6C0_9A78                      ; CODE XREF sub_FFFFF6C0_9A76+20j
                LDA     $84             ; compare begin of source code
                CMP     $A3
                LDA     $85
                SBC     $A4
                BCS     loc_FFFFF6C0_9A98 ; >= than branch
                LDA     $A3
                BNE     loc_FFFFF6C0_9A88
                DEC     $A4

loc_FFFFF6C0_9A88                      ; CODE XREF sub_FFFFF6C0_9A76+Ej
                DEC     $A3
                LDA     $A7
                BNE     loc_FFFFF6C0_9A90
                DEC     $A8

loc_FFFFF6C0_9A90                      ; CODE XREF sub_FFFFF6C0_9A76+16j
                DEC     $A7
                LDA     ($A3),Y
                STA     ($A7),Y
                BCC     loc_FFFFF6C0_9A78

loc_FFFFF6C0_9A98                      ; CODE XREF sub_FFFFF6C0_9A76+Aj
                LDA     $A7
                STA     $84
                LDA     $A8
                STA     $85
                RTS     
; End of function sub_FFFFF6C0_9A76


;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_9AA1                      ; CODE XREF seg0009747p
                JSR     memtop2a7a8
                LDA     #$FF            ; load accu with FF
                BNE     loc_FFFFF6C0_9AB9 ; and jump to
; End of function sub_FFFFF6C0_9AA1


;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_9AA8                      ; CODE XREF oneormoreparam+2p
                                        ; checklinenumber+9Fp
                                        ; ...
                JSR     memtop2a7a8
                JMP     twoparameter
; End of function sub_FFFFF6C0_9AA8


;----------------------------------------------------------------------------

;               S u b r o u t i n e

memtop2a7a8                            ; CODE XREF sub_FFFFF6C0_9AA1p
                                        ; sub_FFFFF6C0_9AA8p
                LDA     $84             ; copy MEMTOP a7,a8
                STA     $A7             ; MEMTOP is the begin of the source code
                LDA     $85
                STA     $A8
                RTS     
; End of function memtop2a7a8


;----------------------------------------------------------------------------

;               S u b r o u t i n e

twoparameter                           ; CODE XREF seg0009732p seg0009A73p
                                        ; ...
                LDA     #0

loc_FFFFF6C0_9AB9                      ; CODE XREF sub_FFFFF6C0_9AA1+5j
                STA     $582            ; store accu in 582 - $FF

loc_FFFFF6C0_9ABC                      ; CODE XREF twoparameter+30j
                                        ; twoparameter+59j ...
                LDA     $A8
                STA     $A6
                LDA     $A7
                STA     $A5             ; store begin of source in $A5,$a6
                CMP     $86
                LDA     $A6
                SBC     $87             ; compare with end of source
                BCS     equal_or_greate ; >= than branch
                LDY     #0
                LDA     ($A5),Y
                ADC     $A7
                STA     $A7
                BCC     loc_FFFFF6C0_9AD8
                INC     $A8

loc_FFFFF6C0_9AD8                      ; CODE XREF twoparameter+1Dj
                BIT     $582            ; 7th bit into as n flag
                BMI     loc_FFFFF6C0_9B01; if n==1 branch
                INY     
                LDA     ($A5),Y
                CMP     0,X
                INY     
                LDA     ($A5),Y
                SBC     1,X
                BCC     loc_FFFFF6C0_9ABC
                BNE     loc_FFFFF6C0_9AF2
                DEY     
                LDA     ($A5),Y
                CMP     0,X
                BEQ     returndirect

loc_FFFFF6C0_9AF2                      ; CODE XREF twoparameter+32j
                                        ; twoparameter+66j
                LDA     $A5
                STA     $A7
                LDA     $A6
                STA     $A8

equal_or_greate                        ; CODE XREF twoparameter+13j
                BIT     $582            ; 7th bit into n-flag
                BMI     returndirect    ; if n==1 => return
                CLC                     ; else, clear carry and return

returndirect                           ; CODE XREF twoparameter+39j
                                        ; twoparameter+46j
                RTS     
;----------------------------------------------------------------------------

loc_FFFFF6C0_9B01                      ; CODE XREF twoparameter+24j
                LDY     #3
                LDX     $97

loc_FFFFF6C0_9B05                      ; CODE XREF twoparameter+5Dj
                LDA     $3FF,X
                BEQ     loc_FFFFF6C0_9B16
                CMP     #' '
                BEQ     loc_FFFFF6C0_9B16
                CMP     ($A5),Y
                BNE     loc_FFFFF6C0_9ABC
                INX     
                INY     
                BNE     loc_FFFFF6C0_9B05

loc_FFFFF6C0_9B16                      ; CODE XREF twoparameter+51j
                                        ; twoparameter+55j
                LDA     ($A5),Y
                BEQ     loc_FFFFF6C0_9B1C
                BPL     loc_FFFFF6C0_9ABC

loc_FFFFF6C0_9B1C                      ; CODE XREF twoparameter+61j
                CLC     
                BCC     loc_FFFFF6C0_9AF2

command_num
                LDA     #$FF
                STA     $58F
                LDA     #$A
                BNE     loc_FFFFF6C0_9B2A

command_inc
                LDA     #1

loc_FFFFF6C0_9B2A                      ; CODE XREF twoparameter+6Fj
                DEX     
                DEX     
                BMI     loc_FFFFF6C0_9B36
                LDA     $89
                BNE     syntaxerr_
                LDA     $88
                BEQ     syntaxerr_

loc_FFFFF6C0_9B36                      ; CODE XREF twoparameter+75j
                STA     $5FB
                CPX     #2
                BNE     locret_FFFFF6C0_9B4C
                LDA     $8A
                SEC     
                SBC     $88
                STA     $5F9
                LDA     $8B
                SBC     #0
                STA     $5FA

locret_FFFFF6C0_9B4C                   ; CODE XREF twoparameter+84j
                RTS     
;----------------------------------------------------------------------------

syntaxerr_                             ; CODE XREF twoparameter+79j
                                        ; twoparameter+7Dj
                JMP     syntaxerror
; End of function twoparameter

;----------------------------------------------------------------------------

command_siz                            ; CODE XREF seg000A094j seg000A0A8j
                LDX     #IDX_SOURCEDATAERR  ; print bibio message "Source Data"
                JSR     printbibomsg
                LDX     $84             ; MEMTOP (source code begin) into x,y
                LDY     $85             ; (from main, inc or ed2 mode!)
                JSR     to_hexstring    ; plot as hex
                JSR     printminus      ; print minus between the two hex adr
                LDX     $86             ; end of source code in x,y
                LDY     $87             ; from main, inc or ed2 mode!)
                JSR     to_hexstring    ; and print this adr as hex string
                LDA     $592            ; load status (0==assembler)
                BEQ     siz_in_asm_mode
                CMP     #1              ; 1==Inc> mode of biboass
                BEQ     siz_in_inc_mode ; if inc mode than branch
                JSR     printminus      ; else it is the ed2 mode of biboass
                LDX     $5A0            ; end of source in ed2 mode
                LDY     $5A1            ; (from the main editor!)
                JMP     siz_in_ed2_mode ; jmp to print adr in hex
;----------------------------------------------------------------------------

siz_in_inc_mode                        ; CODE XREF seg0009B6Dj
                JSR     printminus
                LDX     $5AC            ; end of source code in inc mode
                LDY     $5AD            ; (from the main editor!)

siz_in_ed2_mode                        ; CODE XREF seg0009B78j
                JSR     to_hexstring

siz_in_asm_mode                        ; CODE XREF seg0009B69j
                LDX     #$A
                JSR     printbibomsg    ; print "Symbol Data" on screen
                LDX     $80             ; pointer to the begin of symbol data
                LDY     $81
                JSR     to_hexstring    ; print begin of symbold data in hex on screen
                JSR     printminus
                LDX     $82             ; pointer to the end of symbol data
                LDY     $83
                JSR     to_hexstring    ; print end of symbol data as adr on screen
                JMP     printnewline
;----------------------------------------------------------------------------

command_ed2                            ; load status of biboass (0=ass)
                LDA     $592
                BNE     not_in_assmode  ; if not in ass mode branch
                LDA     $86             ; store end of main editor src
                STA     $5A0
                LDA     $87             ; in $5a0, $5a1
                STA     $5A1
                LDA     #0              ; set line number to 0
                STA     $5F9            ; "
                STA     $5FA            ; "
                LDA     #2              ; load 2 == ed2 mode

;----------------------------------------------------------------------------

;               S u b r o u t i n e

chg_editormode                         ; CODE XREF seg000AD88p
                STA     $592            ; alter bibo status to value in accu(e.g 2==ed2, 1=inc..)
                LDA     $84             ; save main editor src begin
                STA     $5A2
                STA     $86             ; store it as end of ed2 src
                LDA     $85
                STA     $5A3            ; same for the high byte
                STA     $87
                RTS     
; End of function chg_editormode

;----------------------------------------------------------------------------

not_in_assmode                         ; CODE XREF seg0009BA3j
                LDY     #IDX_ED2_INUSE   ; print error "ED2 already used"
                JMP     mainerrorhndler ; handle that error
;----------------------------------------------------------------------------

command_mer                            ; load bibo status and
                LDA     $592
                CMP     #2              ; check if biboass is in ED2 (==2) mode?
                BNE     mergeerror      ; no, not in ed2 mode. => ERROR
                JSR     restore_end_src ; yes, already ed2 mode
                JMP     merge_ed2_ed1   ; merge ed2 and Editor>

;----------------------------------------------------------------------------

;               S u b r o u t i n e

restore_end_src                        ; CODE XREF seg0009BD7p command_ret+3Bj
                LDA     #0              ; set bibostatus to main editor(ass=0)
                STA     $592
                LDA     $5A0            ; load end of source (main editor)
                STA     $86             ; and store it in the correct zero page
                LDA     $5A1            ; adress for biboass mode Editor>
                STA     $87
                RTS     
; End of function restore_end_src

;----------------------------------------------------------------------------

mergeerror                             ; CODE XREF seg0009BD5j
                LDY     #IDX_CANTMERGE  ; print error "Can't merge"
                JMP     mainerrorhndler ; handle error

;----------------------------------------------------------------------------

;               S u b r o u t i n e

command_ret                            ; CODE XREF copy_af_2_ad+6Cp
                LDA     $592            ; load status
                CMP     #2              ; is biboass in ed2> mode?
                BEQ     ed2restore      ; yes

ret2editor                             ; CODE XREF copy_af_2_ad+81p
                LDA     $5B0            ; was bibo invoked before?
                BEQ     firststart      ; 0 => no, first start
                LDA     #0              ; yes, invoked before
                STA     $592            ; set status to biboass assembler
                LDA     $86             ; restore MEMTOP
                STA     $84             ; (86,87)=>(84,85)
                LDA     $87
                STA     $85
                LDA     $5AC            ; restore end of source to 86,87
                STA     $86
                LDA     $5AD
                STA     $87
                LDA     $5AE
                STA     $B9
                LDA     $5AF
                STA     $BA
                DEC     $5B0            ; signal ass that .in is finished

firststart                             ; CODE XREF command_ret+Aj
                RTS     
;----------------------------------------------------------------------------

ed2restore                             ; CODE XREF command_ret+5j
                LDA     $5A2            ; begin of source (main editor) in ed2 mode
                STA     $84
                LDA     $5A3            ; restore to 84,85
                STA     $85
                JMP     restore_end_src
; End of function command_ret

;----------------------------------------------------------------------------

merge_ed2_ed1                          ; CODE XREF seg0009BDAj seg0009C8Dj
                                        ; ...
                LDX     #0
                BEQ     loc_FFFFF6C0_9C3B ; clear X and jmp to

command_ren
                JSR     asm_command

loc_FFFFF6C0_9C37                      ; CODE XREF seg0009C41j
                CPX     #6
                BEQ     loc_FFFFF6C0_9C43

loc_FFFFF6C0_9C3B                      ; CODE XREF seg0009C32j
                LDA     data_9C7E,X
                STA     $88,X
                INX     
                BNE     loc_FFFFF6C0_9C37

loc_FFFFF6C0_9C43                      ; CODE XREF seg0009C39j
                LDX     #$8C
                JSR     sub_FFFFF6C0_9AA8

loc_FFFFF6C0_9C48                      ; CODE XREF seg0009C72j seg0009C76j
                LDA     $A5             ; check if its the end of the source
                CMP     $86
                LDA     $A6
                SBC     $87
                BCS     return_immediat
                LDY     #0
                LDA     ($A5),Y
                PHA     
                INY     
                LDA     $88
                STA     ($A5),Y
                ADC     $8A
                STA     $88
                INY     
                LDA     $89
                STA     ($A5),Y
                ADC     $8B
                CMP     #$FA
                BCS     error_outofrang
                STA     $89
                PLA     
                ADC     $A5
                STA     $A5
                BCC     loc_FFFFF6C0_9C48
                INC     $A6
                BNE     loc_FFFFF6C0_9C48

return_immediat                        ; CODE XREF seg0009C50j
                RTS     
;----------------------------------------------------------------------------

error_outofrang                        ; CODE XREF seg0009C69j
                LDY     #IDX_OUTOFRANGE             ; print "out of range" error
                JMP     mainerrorhndler ; handle error
;----------------------------------------------------------------------------
data_9C7E
                dta   $A ;  
                dta    0 ;  
                dta   $A ;  
                dta    0 ;  
                dta    0 ;  
                dta    0 ;  
;----------------------------------------------------------------------------

error_memfull                          ; CODE XREF sub_FFFFF6C0_9C90+5Fj
                JMP     memfullerror
;----------------------------------------------------------------------------

errorinsyntax                          ; CODE XREF sub_FFFFF6C0_9C90+5j
                                        ; sub_FFFFF6C0_9C90+3Cj
                                        ; ...
                JMP     syntaxerror
;----------------------------------------------------------------------------

command_cop
                JSR     sub_FFFFF6C0_9C90
                JMP     merge_ed2_ed1

;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_9C90                      ; CODE XREF seg0009C8Ap seg0009DA1p
                JSR     asm_command
                CPX     #4
                BCC     errorinsyntax
                BNE     loc_FFFFF6C0_9CA1
                LDA     $8A
                STA     $8C
                LDA     $8B
                STA     $8D

loc_FFFFF6C0_9CA1                      ; CODE XREF sub_FFFFF6C0_9C90+7j
                LDX     #$8A
                JSR     sub_FFFFF6C0_9AA8
                LDA     $A5
                STA     $5A4
                LDA     $A6
                STA     $5A5
                LDX     #$8C
                JSR     sub_FFFFF6C0_9AA8
                SEC     
                LDA     $A7
                STA     $5A6
                SBC     $5A4
                STA     $5A8
                LDA     $A8
                STA     $5A7
                SBC     $5A5
                STA     $5A9

loc_FFFFF6C0_9CCC                      ; CODE XREF sub_FFFFF6C0_9C90+7Cj
                BCC     errorinsyntax
                BNE     loc_FFFFF6C0_9CD5
                LDA     $5A8
                BEQ     errorinsyntax

loc_FFFFF6C0_9CD5                      ; CODE XREF sub_FFFFF6C0_9C90+3Ej
                LDA     $84
                SBC     $5A8
                STA     $5AA
                LDA     $85
                SBC     $5A9
                STA     $5AB
                LDA     $5AA
                CMP     $80
                LDA     $5AB
                SBC     $81
                BCC     error_memfull
                LDX     #$88
                JSR     sub_FFFFF6C0_9AA8
                LDA     $5A4
                CMP     $A5
                LDA     $5A5
                SBC     $A6
                BCS     loc_FFFFF6C0_9D33
                LDA     $A5
                CMP     $5A6
                LDA     $A6
                SBC     $5A7
                BCC     loc_FFFFF6C0_9CCC
                LDA     $5A4
                SBC     $5A8
                STA     $5A4
                LDA     $5A5
                SBC     $5A9
                STA     $5A5
                SEC     
                LDA     $5A6
                SBC     $5A8
                STA     $5A6
                LDA     $5A7
                SBC     $5A9
                STA     $5A7

loc_FFFFF6C0_9D33                      ; CODE XREF sub_FFFFF6C0_9C90+70j
                LDA     $84             ; begin of source lowbyte
                STA     $8A
                LDA     $85             ; begin of source high byte
                STA     $8B
                LDA     $5AA
                STA     $84
                STA     $90
                LDA     $5AB
                STA     $85
                STA     $91
                LDA     $A6
                STA     $8D
                LDA     $A5
                STA     $8C
                BNE     loc_FFFFF6C0_9D55
                DEC     $8D

loc_FFFFF6C0_9D55                      ; CODE XREF sub_FFFFF6C0_9C90+C1j
                DEC     $8C
                LDY     #0
                LDA     $8C
                CMP     $8A
                LDA     $8D
                SBC     $8B
                BCC     loc_FFFFF6C0_9D66
                JSR     copy_8a_2_90

loc_FFFFF6C0_9D66                      ; CODE XREF sub_FFFFF6C0_9C90+D1j
                LDA     $5A4
                STA     $8A
                LDA     $5A5
                STA     $8B
                LDA     $5A7
                STA     $8D
                LDA     $5A6
                STA     $8C
                BNE     loc_FFFFF6C0_9D7E
                DEC     $8D

loc_FFFFF6C0_9D7E                      ; CODE XREF sub_FFFFF6C0_9C90+EAj
                DEC     $8C

loc_FFFFF6C0_9D80                      ; CODE XREF sub_FFFFF6C0_9C90+10Ej
                LDA     ($8A),Y
                STA     ($90),Y
                JSR     increase_8a_90
                LDA     $88
                STA     ($90),Y
                JSR     increase_8a_90
                LDA     $89
                STA     ($90),Y

loc_FFFFF6C0_9D92                      ; CODE XREF sub_FFFFF6C0_9C90+109j
                JSR     increase_8a_90
                LDA     ($8A),Y
                STA     ($90),Y
                BNE     loc_FFFFF6C0_9D92
                JSR     increase_8a_90
                BCC     loc_FFFFF6C0_9D80
                RTS     
; End of function sub_FFFFF6C0_9C90

;----------------------------------------------------------------------------
command_mov     JSR     sub_FFFFF6C0_9C90
                LDA     $5A4
                STA     $A3
                LDA     $5A5
                STA     $A4
                LDA     $5A6
                STA     $A7
                LDA     $5A7
                STA     $A8
                JSR     sub_FFFFF6C0_9A76
                JMP     merge_ed2_ed1

;----------------------------------------------------------------------------

;               S u b r o u t i n e

findparambegin                         ; CODE XREF seg00096F4p seg0009DD0p
                                        ; ...
                LDX     $97             ; load idx in X
                CPX     $C7             ; check length of command
                BEQ     noparam         ; no parameter than branch

skipspace4                             ; CODE XREF findparambegin+Cj
                INX     
                LDA     $3FF,X          ; load char from input buffer
                CMP     #' '            ; and skip spaces between cmd and param
                BEQ     skipspace4
                DEX     

noparam                                ; CODE XREF findparambegin+4j
                STX     $C8             ; store pos in command string in c8
                RTS     
; End of function findparambegin

;----------------------------------------------------------------------------

command_fin
                JSR     findparambegin
                LDA     $84             ; store source begin (84,85) in (B9,BA)
                STA     $B9
                LDA     $85
                STA     $BA

loc_FFFFF6C0_9DDB                      ; CODE XREF seg0009DFDj seg0009E20j
                                        ; ...
                LDA     #0
                STA     $C0
                LDA     $B9
                STA     $8A
                CMP     $86
                LDA     $BA
                STA     $8B
                SBC     $87
                BCS     locret_FFFFF6C0_9E43
                JSR     ldacharfromsrc
                JSR     ldacharfromsrc
                JSR     ldacharfromsrc

loc_FFFFF6C0_9DF6                      ; CODE XREF seg0009E02j seg0009E33j
                LDX     $C8
                JSR     nextcharfromsrc
                CMP     #0
                BEQ     loc_FFFFF6C0_9DDB
                CMP     $400,X
                BNE     loc_FFFFF6C0_9DF6
                LDA     $401,X
                BEQ     loc_FFFFF6C0_9E35
                LDA     $C2
                STA     $8C
                LDA     $B9
                STA     $8E
                LDA     $BA
                STA     $8F

loc_FFFFF6C0_9E15                      ; CODE XREF seg0009E25j
                INX     
                LDA     $400,X
                BEQ     loc_FFFFF6C0_9E35
                JSR     nextcharfromsrc
                CMP     #0
                BEQ     loc_FFFFF6C0_9DDB
                CMP     $400,X
                BEQ     loc_FFFFF6C0_9E15
                LDA     $8C
                STA     $C2
                LDA     $8E
                STA     $B9
                LDA     $8F
                STA     $BA
                BNE     loc_FFFFF6C0_9DF6

loc_FFFFF6C0_9E35                      ; CODE XREF seg0009E07j seg0009E19j
                LDA     $8A
                STA     $B9
                LDA     $8B
                STA     $BA
                JSR     print_src_line
                JMP     loc_FFFFF6C0_9DDB
;----------------------------------------------------------------------------

locret_FFFFF6C0_9E43                   ; CODE XREF seg0009DEBj
                RTS     

;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_9E44                      ; CODE XREF seg0009E7Ep seg0009E91p
                LDX     #0

loc_FFFFF6C0_9E46                      ; CODE XREF sub_FFFFF6C0_9E44+15j
                LDA     $400,Y
                BEQ     err_syntax_erro
                CMP     $588
                BEQ     loc_FFFFF6C0_9E5C
                STA     ($AB,X)
                INC     $AB
                BNE     loc_FFFFF6C0_9E58
                INC     $AC

loc_FFFFF6C0_9E58                      ; CODE XREF sub_FFFFF6C0_9E44+10j
                INY     
                BNE     loc_FFFFF6C0_9E46
                RTS     
;----------------------------------------------------------------------------

loc_FFFFF6C0_9E5C                      ; CODE XREF sub_FFFFF6C0_9E44+Aj
                LDA     #0
                STA     ($AB,X)
                CLC     

locret_FFFFF6C0_9E61                   ; CODE XREF seg0009EB8j
                RTS     
;----------------------------------------------------------------------------

err_syntax_erro                        ; CODE XREF sub_FFFFF6C0_9E44+5j
                                        ; seg0009E87j
                JMP     syntaxerror
; End of function sub_FFFFF6C0_9E44

;----------------------------------------------------------------------------

command_rep
                LDY     #0
                STY     $C2
                STY     $589
                LDY     $97
                STY     $C8
                JSR     getvalidchar
                STA     $588
                LDA     #0
                STA     $AB
                LDA     #5
                STA     $AC
                JSR     sub_FFFFF6C0_9E44
                JSR     getchr_src_400
                CMP     $588
                BNE     err_syntax_erro
                LDA     #$40
                STA     $AB
                LDA     #5
                STA     $AC
                JSR     sub_FFFFF6C0_9E44
                LDA     #$3F
                JSR     find_char_bf
                BCS     loc_FFFFF6C0_9EA0
                LDA     #$FF
                STA     $589

loc_FFFFF6C0_9EA0                      ; CODE XREF seg0009E99j
                LDA     $84
                STA     $B9
                LDA     $85
                STA     $BA

loc_FFFFF6C0_9EA8                      ; CODE XREF seg0009ECAj seg0009EEDj
                                        ; ...
                LDA     #0
                STA     $C0
                LDA     $B9
                STA     $8A
                CMP     $86
                LDA     $BA
                STA     $8B
                SBC     $87
                BCS     locret_FFFFF6C0_9E61
                JSR     ldacharfromsrc
                JSR     ldacharfromsrc
                JSR     ldacharfromsrc

loc_FFFFF6C0_9EC3                      ; CODE XREF seg0009ECFj seg0009F00j
                LDX     #0
                JSR     nextcharfromsrc
                CMP     #0
                BEQ     loc_FFFFF6C0_9EA8
                CMP     $500,X
                BNE     loc_FFFFF6C0_9EC3
                LDA     $501,X
                BEQ     loc_FFFFF6C0_9F02
                LDA     $C2
                STA     $8C
                LDA     $B9
                STA     $8E
                LDA     $BA
                STA     $8F

loc_FFFFF6C0_9EE2                      ; CODE XREF seg0009EF2j
                INX     
                LDA     $500,X
                BEQ     loc_FFFFF6C0_9F02
                JSR     nextcharfromsrc
                CMP     #0
                BEQ     loc_FFFFF6C0_9EA8
                CMP     $500,X
                BEQ     loc_FFFFF6C0_9EE2
                LDA     $8C
                STA     $C2
                LDA     $8E
                STA     $B9
                LDA     $8F
                STA     $BA
                BNE     loc_FFFFF6C0_9EC3

loc_FFFFF6C0_9F02                      ; CODE XREF seg0009ED4j seg0009EE6j
                LDA     $8A
                STA     $B9
                LDA     $8B
                STA     $BA
                JSR     ldacharfromsrc
                JSR     ldacharfromsrc
                STA     $A0
                JSR     ldacharfromsrc
                STA     $A1
                LDA     #0
                STA     $C2
                STA     $C0
                LDX     #4
                STX     $C8

loc_FFFFF6C0_9F21                      ; CODE XREF seg0009F2Cj
                JSR     nextcharfromsrc
                STA     $400,X
                CMP     #0
                BEQ     loc_FFFFF6C0_9F2E
                INX     
                BNE     loc_FFFFF6C0_9F21

loc_FFFFF6C0_9F2E                      ; CODE XREF seg0009F29j
                STA     $C0
                LDX     #3
                STX     $92

loc_FFFFF6C0_9F34                      ; CODE XREF seg0009F49j
                INC     $92

loc_FFFFF6C0_9F36                      ; CODE XREF seg0009F77j
                LDX     $92
                LDY     #0

loc_FFFFF6C0_9F3A                      ; CODE XREF seg0009F4Dj
                LDA     $500,Y
                BEQ     loc_FFFFF6C0_9F4F
                LDA     $400,X
                BEQ     loc_FFFFF6C0_9F7D
                CMP     $500,Y
                BEQ     loc_FFFFF6C0_9F4B
                BNE     loc_FFFFF6C0_9F34

loc_FFFFF6C0_9F4B                      ; CODE XREF seg0009F47j
                INX     
                INY     
                BNE     loc_FFFFF6C0_9F3A

loc_FFFFF6C0_9F4F                      ; CODE XREF seg0009F3Dj
                LDY     #0

loc_FFFFF6C0_9F51                      ; CODE XREF seg0009F5Bj
                LDA     $400,X
                STA     $480,Y
                BEQ     loc_FFFFF6C0_9F5D
                INX     
                INY     
                BNE     loc_FFFFF6C0_9F51

loc_FFFFF6C0_9F5D                      ; CODE XREF seg0009F57j
                LDX     $92
                LDY     #0

loc_FFFFF6C0_9F61                      ; CODE XREF seg0009F6Bj
                LDA     $540,Y
                STA     $400,X
                BEQ     loc_FFFFF6C0_9F6D
                INX     
                INY     
                BNE     loc_FFFFF6C0_9F61

loc_FFFFF6C0_9F6D                      ; CODE XREF seg0009F67j
                LDY     #0
                STX     $92

loc_FFFFF6C0_9F71                      ; CODE XREF seg0009F7Bj
                LDA     $480,Y
                STA     $400,X
                BEQ     loc_FFFFF6C0_9F36
                INX     
                INY     
                BNE     loc_FFFFF6C0_9F71

loc_FFFFF6C0_9F7D                      ; CODE XREF seg0009F42j
                LDA     $589
                BEQ     loc_FFFFF6C0_9FB0
                LDA     $8A
                STA     $B9
                LDA     $8B
                STA     $BA
                JSR     print_src_line
                LDA     $8A
                STA     $B9
                LDA     $8B
                STA     $BA
                JSR     getbytestatus_k
                PHA     
                LDA     #$9C
                JSR     print
                LDA     #$1C
                JSR     print
                PLA     
                CMP     #$4E
                BEQ     loc_FFFFF6C0_9FC0
                CMP     #$20
                BEQ     loc_FFFFF6C0_9FC0
                CMP     #$1B
                BEQ     locret_FFFFF6C0_9FC6

loc_FFFFF6C0_9FB0                      ; CODE XREF seg0009F80j
                JSR     loc_FFFFF6C0_995D
                SEC     
                LDA     $A5
                SBC     $C6
                STA     $B9
                LDA     $A6
                SBC     #0
                STA     $BA

loc_FFFFF6C0_9FC0                      ; CODE XREF seg0009FA6j seg0009FAAj
                JSR     print_src_line
                JMP     loc_FFFFF6C0_9EA8
;----------------------------------------------------------------------------

locret_FFFFF6C0_9FC6                   ; CODE XREF seg0009FAEj
                RTS     
;----------------------------------------------------------------------------

command_sym                            ; CODE XREF copy_af_2_ad+69j
                LDA     #0              ; lists all symbols with adr
                STA     $C5
                LDX     #$15            ; print "Symbol table"
                JSR     printbibomsg
                LDY     #2

loc_FFFFF6C0_9FD2                      ; CODE XREF seg000A025j
                STY     $BD
                LDA     $5C0,Y
                STA     $AD
                LDA     $5C1,Y
                BEQ     loc_FFFFF6C0_A01F
                STA     $AE

loc_FFFFF6C0_9FE0                      ; CODE XREF seg000A01Dj
                LDY     #2
                LDA     ($AD),Y
                STA     $9C
                TAX     
                INY     
                LDA     ($AD),Y
                STA     $9D
                TAY     
                JSR     print_pseudo_bl
                JSR     printspace
                LDY     #4
                LDA     ($AD),Y
                AND     #$3F
                STA     $587

loc_FFFFF6C0_9FFC                      ; CODE XREF seg000A005j
                INY     
                LDA     ($AD),Y
                JSR     print
                DEC     $587
                BNE     loc_FFFFF6C0_9FFC
                LDY     #4
                LDA     ($AD),Y
                BMI     loc_FFFFF6C0_A028

loc_FFFFF6C0_A00D                      ; CODE XREF seg000A035j
                JSR     printnewline
                LDY     #1
                LDA     ($AD),Y
                PHA     
                DEY     
                LDA     ($AD),Y
                STA     $AD
                PLA     
                STA     $AE
                BNE     loc_FFFFF6C0_9FE0

loc_FFFFF6C0_A01F                      ; CODE XREF seg0009FDCj
                LDY     $BD
                INY     
                INY     
                CPY     #$36
                BNE     loc_FFFFF6C0_9FD2
                RTS     
;----------------------------------------------------------------------------

loc_FFFFF6C0_A028                      ; CODE XREF seg000A00Bj
                AND     #$3F
                CLC     
                ADC     #5
                TAY     
                LDA     #1
                STA     $587

loc_FFFFF6C0_A033                      ; CODE XREF seg000A080j
                LDA     ($AD),Y
                BEQ     loc_FFFFF6C0_A00D
                AND     #$7F
                PHA     
                DEC     $587
                BEQ     loc_FFFFF6C0_A045
                JSR     printspace
                JMP     loc_FFFFF6C0_A053
;----------------------------------------------------------------------------

loc_FFFFF6C0_A045                      ; CODE XREF seg000A03Dj
                JSR     printnewline
                JSR     printspace
                JSR     printspace
                LDA     #4
                STA     $587

loc_FFFFF6C0_A053                      ; CODE XREF seg000A042j
                LDA     #'.'
                JSR     print
                LDX     #1
                PLA     
                STA     $9E
                LDA     #0
                STA     $9F
                TYA     
                PHA     
                JSR     line_no_loop
                LDA     #'-'
                JSR     print
                PLA     
                TAY     
                INY     
                LDA     ($AD),Y
                CLC     
                ADC     $9C
                PHA     
                LDA     $9D
                ADC     #0
                JSR     tostring
                PLA     
                JSR     tostring
                INY     
                BNE     loc_FFFFF6C0_A033

command_him                            ; set the HIMEM pointer
                JSR     findparambegin
                JSR     addr_frm_param
                LDA     $B7
                STA     $86
                STA     $84
                LDA     $B8
                STA     $87
                STA     $85
                JMP     command_siz
;----------------------------------------------------------------------------

command_lom                            ; set the LOMEM pointer
                JSR     findparambegin
                JSR     addr_frm_param
                LDA     $B7
                STA     $80
                LDA     $B8
                STA     $81
                JSR     copyLOWMEMptr
                JMP     command_siz
;----------------------------------------------------------------------------

command_run
                JSR     findparambegin
                JSR     addr_frm_param
                LDA     $B7
                STA     $A3
                LDA     $B8
                STA     $A4
                JMP     VIMIRQ_redirect

;----------------------------------------------------------------------------

;               S u b r o u t i n e

chk_local_label                        ; CODE XREF addr_frm_param+5Cp
                                        ; nocomment_1pp
                LDX     #0
                CMP     #'.'            ; check for local label
                BNE     charlabel       ; no, than no local label
                STA     $505            ; store '.' in $0505
                JSR     get_param_chr   ; get next char from parm string
                CMP     #'0'            ; check value >=0
                BCC     nolocallabel2   ; < 0 than branch
                CMP     #$3A
                BCS     nolocallabel2   ; >= ""==$3A  than branch
                JSR     locallabelvalue ; param is value 0..9 (in ASCII)..value is in $a0,$a1
                LDA     $A1
                BNE     nolocallabel2   ; must be 0 if it is a local label..(see biboass manual)
                LDA     $A0
                CMP     #100            ; only 0 to 99 local labels are allowed
                BCS     nolocallabel2   ; if >= 100 error
                ORA     #$80            ; set bit 7 (e.g. local label 1 => $81)
                STA     $506            ; store in $506
                INX     
                BNE     nolocallabel2

chars_A_to_z                           ; CODE XREF chk_local_label+38j
                                        ; chk_local_label+40j
                                        ; ...
                CPX     #32             ; max 32 chars space from 505
                BEQ     nomorespaceleft ; skip if it's a space
                STA     $505,X          ; copy char in $505,X
                INX     

nomorespaceleft                        ; CODE XREF chk_local_label+2Bj
                JSR     get_param_chr
                BCS     char_was_00     ; branch if 00 was read
                CMP     #'.'
                BEQ     chars_A_to_z
                CMP     #'0'            ; "0" == $30
                BCC     nolocallabel2   ; branch if lower than "0"
                CMP     #':'            ; "" == $3A
                BCC     chars_A_to_z    ; branch if lower or equal 39 => it a value 0..9

charlabel                              ; CODE XREF chk_local_label+4j
                CMP     #'A'
                BCC     nolocallabel2   ; chars lower than A
                CMP     #'{'            ; chars A...z
                BCC     chars_A_to_z    ; yes

nolocallabel2                          ; CODE XREF chk_local_label+Ej
                                        ; chk_local_label+12j
                                        ; ...
                JSR     checkparampos

char_was_00                            ; CODE XREF chk_local_label+34j
                STX     $504            ; store number of chars (X) starting at $505. So $500 looks like 00,00,00,00,numbofchars,char_0,..,char_numbofchars-1
                CPX     #1              ; if x==1 set carry and zeroflag
                LDX     #0              ; set zero flag
                RTS     
; End of function chk_local_label


;----------------------------------------------------------------------------

;               S u b r o u t i n e

calcsymboladdr                         ; CODE XREF addr_frm_param+61p
                                        ; nocomment_1p+5p ...
                SEC     
                LDA     $505            ; load first char from buffer, see routine chk_local_label
                CMP     #'.'            ; check for local label
                BEQ     islocallabel    ; yes, than branch
                SBC     #$40            ; -$40 ...now build hash
                ASL     @               ; *2
                ADC     #$C0            ; + $c0
                STA     $AD             ; store as lowbyte $AD
                LDA     #5              ; load 05
                ADC     #0              ; add carry (if necessary)
                STA     $AE             ; and store as highbyte

copylabel                              ; CODE XREF calcsymboladdr+44j
                LDY     #0
                LDA     ($AD),Y         ; use calculated pointer and load  lowbyte
                STA     $AF             ; store lowbyte pointer to symbol data ($AF)
                INY     
                LDA     ($AD),Y
                BEQ     labelnotfound
                STA     $B0             ; store high byte pointer to symbol data
                LDX     $504            ; load num of chars of current symbol
                LDY     #4
                LDA     ($AF),Y         ; load num of chars from symbol data
                AND     #$3F
                CMP     $500,Y          ; compare with length of current symbol
                INY     
                BCS     numofcharsequal
                TAX                     ; not equal, than use length from symbol data

numofcharsequal                        ; CODE XREF calcsymboladdr+2Fj
                                        ; calcsymboladdr+3Fj
                LDA     ($AF),Y         ; load char from symboldata
                CMP     $500,Y          ; and compare with current label
                BCC     charnotequal    ; char are not equal, branch
                BNE     labelnotfound   ; if zero flag is not set..error
                DEX                     ; ok char was equal, check next char
                BEQ     charsareequal   ; all chars are equal, branch
                INY                     ; ok, next char to check
                BNE     numofcharsequal ; and loop

charnotequal                           ; CODE XREF calcsymboladdr+37j
                                        ; calcsymboladdr+57j
                JSR     copy_af_2_ad
                BCC     copylabel       ; carry is allways set in copy_af_2_ad

labelnotfound                          ; CODE XREF calcsymboladdr+1Ej
                                        ; calcsymboladdr+39j
                                        ; ...
                SEC     
                LDX     #0
                RTS     
;----------------------------------------------------------------------------

charsareequal                          ; CODE XREF calcsymboladdr+3Cj
                LDY     #4
                LDA     ($AF),Y         ; load num of symbol chars from symbol data
                AND     #$3F
                CMP     $504            ; compare with current symbol length
                BEQ     foundit
                BCS     labelnotfound
                BCC     charnotequal

foundit                                ; CODE XREF calcsymboladdr+53j
                LDY     #2
                LDA     ($AF),Y         ; load low byte of address from symbol data
                STA     $9C             ; store in $9C
                INY     
                LDA     ($AF),Y         ; load high byte of address in symbol data
                STA     $9D             ; and store it in $9D
; End of function calcsymboladdr


;----------------------------------------------------------------------------

;               S u b r o u t i n e

copy_af_2_ad                           ; CODE XREF calcsymboladdr+41p
                LDA     $AF
                STA     $AD
                LDA     $B0
                STA     $AE
                CLC     
                RTS     
;----------------------------------------------------------------------------

islocallabel                           ; CODE XREF calcsymboladdr+6j
                LDA     $B5             ; load pointer to symbol data of current real label
                STA     $AD             ; and store in AD, AE
                LDA     $B6
                BEQ     badlocallabel   ; high byte must be != 00
                STA     $AE
                CLC     
                LDY     #4
                LDA     ($AD),Y         ; load number chars of the symbol
                BPL     labelnotfound   ; bit 7 must be 0
                AND     #$3F            ; mask out upper two bits
                ADC     #5              ; add to number of symbol chars the number of header bytes to jump to the local labels (symboldata header of 5 bytes..$00,$00,$lb,$hb,$numofsymchars)
                TAY                     ; use this value as index Y

nextlocallabel                         ; CODE XREF copy_af_2_ad+2Bj
                LDA     ($AD),Y         ; and read it
                BEQ     labelnotfound   ; if it is zero => error
                CMP     $506            ; chk if its the desired local label ..see routine chk_local_label
                BEQ     foundlocallabel ; if read label is == ($506) local label is found
                INY     
                INY     
                BNE     nextlocallabel

foundlocallabel                        ; CODE XREF copy_af_2_ad+27j
                INY     
                LDA     ($AD),Y         ; load lowbyte local value
                CLC     
                LDY     #2
                ADC     ($AD),Y         ; add lowbyte address to low byte
                STA     $9C             ; store as lowbyte address $9c
                INY     
                LDA     ($AD),Y         ; now the high byte
                ADC     #0
                STA     $9D             ; store high byte of address in $9d
                CLC                     ; signal no error
                RTS     
;----------------------------------------------------------------------------

badlocallabel                          ; CODE XREF copy_af_2_ad+10j
                LDY     #IDX_BADLOCALLABEL ; print "Bad local label"
                JMP     mainerrorhndler
;----------------------------------------------------------------------------

stop_asm                               ; CODE XREF copy_af_2_ad+B6j
                LDX     #$22            ; print "asm stopped"
                JSR     printbibomsg
                JMP     closeallchannel
;----------------------------------------------------------------------------

pseudo_op_en
                JSR     chk_end_asm

end_src_reached                        ; CODE XREF copy_af_2_ad+C4j
                LDA     $5B0            ; 0=main editor src, 1=include src Opcode .in
                BNE     call_ret_cmd    ; inc => ret from inc and set $580 to 0, return to asm_loop2
                JSR     chk_obj_counter ; only called if bibo in asm mode and end of src reached
                LDA     $C3             ; pass counter, 0 is pass 1
                BNE     finishpass2     ; end pass2 and print symbol table
                INC     $C3             ; set c3 to 1 => pass 2
                JMP     asm_pass2       ; and process pass 2
;----------------------------------------------------------------------------

finishpass2                            ; CODE XREF copy_af_2_ad+5Aj
                JSR     closechannel5
                BIT     $C5             ; check if .LI ON is set ($00 in C5)
                BPL     jmp_sym_cmd     ; yes (N=0) than print out symbol table
                RTS     
;----------------------------------------------------------------------------

jmp_sym_cmd                            ; CODE XREF copy_af_2_ad+66j
                JMP     command_sym
;----------------------------------------------------------------------------

call_ret_cmd                           ; CODE XREF copy_af_2_ad+53j
                JSR     command_ret
                JMP     asm_loop2
;----------------------------------------------------------------------------

asm_pass2                              ; CODE XREF copy_af_2_ad+5Ej
                LDX     #$1E            ; print "Pass 2>" on screen
                JSR     printbibomsg
                JMP     asm_loop1       ; process pass 2
;----------------------------------------------------------------------------

command_asm
                LDX     #0
                STX     $C3             ; set pass counter to 0 => pass 1
                JSR     copyLOWMEMptr   ; lowmem to 82,83
                JSR     ret2editor      ; init zeropage + adr
                LDX     #$1D            ; print out "pass one"
                JSR     printbibomsg

asm_loop1                              ; CODE XREF copy_af_2_ad+77j
                LDA     $84             ; copy begin of src into b9,ba
                STA     $B9
                LDA     $85
                STA     $BA
                LDA     #0              ; clear with 0
                STA     $C5             ; bit 7 set to 1 signals .LI OFF
                STA     $585            ; set signal open channel to closed
                STA     $586            ; no channels open (=0)
                STA     $590            ; marker for pseudo op .NO ($FF if no code should be written into memory) see also pseudo_op_no and pseudo_op_ob
                STA     $CA             ; no channel open (=0)
                LDA     #<CONST_BEGIN_OBJ_CODE
                STA     $BB             ; BB,BC => 4000 .. end of obj code
                STA     $B3             ; B3,B4 => 4000 start of obj code
                LDA     #>CONST_BEGIN_OBJ_CODE
;                LDA     #$40            ; init with $40 see BC,BD..
                STA     $BC
                STA     $B4
                LDA     #$FF            ; init $c9 with FF
                STA     $C9             ; C9,CA => 00FF
                JSR     setnew_or       ; in this case b1,b2 with 00,40=>$4000 (.OR $4000)

asm_loop2                              ; CODE XREF copy_af_2_ad+6Fj
                                        ; copy_af_2_ad+16Dj ...
                LDA     $D01F           ; load CONSOLE register
                AND     #4              ; check if Option Key is pressed
                BEQ     stop_asm        ; yes, than stop
                LDA     $B9             ; copy pos in src($b9,ba => $a9,aa)
                STA     $A9
                CMP     $86             ; if equal than set carry flag
                LDA     $BA
                STA     $AA
                SBC     $87
                BCS     end_src_reached ; check if current src ptr (b9,ba) and src end(86,87) are equal
                JSR     ldacharfromsrc  ; skip numofchars in source line(see readme)
                JSR     ldacharfromsrc  ; load line number lowbyte
                STA     $9E             ; store lowbyte line number
                JSR     ldacharfromsrc  ; load highbyte line number
                STA     $9F             ; store highbyte line number
                LDA     $C3             ; load asm pass counter
                BEQ     pass0_li_off    ; if pass 1 ($c3==0) branch
                BIT     $C5             ; check bit 7 - see pseudo_op_li
                BMI     pass0_li_off    ; if .LI OFF branch (bit 7 == 1, $C5 == $80)
                JSR     printnewline

pass0_li_off                           ; CODE XREF copy_af_2_ad+D5j
                                        ; copy_af_2_ad+D9j
                LDX     #0
                STX     $587

looptill00                             ; CODE XREF copy_af_2_ad+EBj
                JSR     nextcharfromsrc
                INX     
                STA     $3FF,X          ; copy rest of sourceline into buffer
                TAY     
                BNE     looptill00      ; copy loop until 00
                STA     $C0             ; store 00 in $C0, because a25fTAY the Y is also 0
                STA     $400,X          ; store 00 in last pos in buffer
                LDA     #$20            ; clear last input buffer entry with space
                STA     $3FF,X
                LDX     #0
                JSR     getchr_src_400  ; load char from $0400,Y into $c4
                BCS     next_src_line   ; if carry is set => 00 was read
                BEQ     nextparamchar   ; z flag is set if space was read
                CMP     #'*'            ; ok, char was read than check for comment type *
                BEQ     next_src_line   ; than skip source line
                CMP     #';'            ; check for comment type ;
                BEQ     next_src_line   ; than skip source line
                CMP     #'-'            ; check for separator -
                BEQ     next_src_line   ; than skip source line
                JSR     nocomment_1p    ; check for (local) label

nextparamchar                          ; CODE XREF copy_af_2_ad+FEj
                                        ; copy_af_2_ad+114j
                JSR     get_param_chr   ; read next param char(and return in accu and $C4) from $0400,Y (Y is load from $c8)
                BCS     next_src_line   ; if carry is set 00 was read
                BEQ     nextparamchar   ; z flag 1, => space $20 was read, loop nextparamchar
                CMP     #'='            ; check for eq alternative "="
                BEQ     go_pseudo_op_eq
                CMP     #';'            ; check for comment
                BEQ     next_src_line   ; yes, than skip line
                STA     $A0             ; opcode buffer 1
                JSR     get_param_chr
                STA     $A1             ; opcode buffer 2
                JSR     get_param_chr
                STA     $A2             ; opcode buffer 3
                LDA     #<MNEMONICS
                STA     $94             ; 94,95 pointer to (pseudo) opcodes
                LDA     #>MNEMONICS            ; load 94,95 a874
                STA     $95             ; pointer to the opcodes
                LDA     #$A0            ; load 9a,9b mit 00a0 => pointer to opcode buffer A0..A2
                STA     $9A             ; 9a,9b pointing to the cmd/opcode input buffer
                LDA     #0
                STA     $9B
                JSR     startcomp_cmd   ; check for cmd
                BEQ     chk_op_main     ; check for opcode (jmp..)
                JSR     startcomp_cmd
                BEQ     impl_add_mode   ; check if it is implicit addressing mode (CLI...)
                JSR     startcomp_cmd
                BEQ     chk_branch_opc  ; check for brances (BNE,BEQ,BCC..)
                JSR     startcomp_cmd
                BEQ     jmp_cmd_2_stack ; check for pseudo opcodes (.LI...)

badinstrerror                          ; CODE XREF seg000A5AFj
                LDY     #IDX_BADINSTRUCTION  ; print error "bad instruction" on screen
                JMP     mainerrorhndler ; handle error
;----------------------------------------------------------------------------

go_pseudo_op_eq                        ; CODE XREF copy_af_2_ad+118j
                JMP     pseudo_op_eq
;----------------------------------------------------------------------------

jmp_cmd_2_stack                        ; CODE XREF copy_af_2_ad+14Cj
                JMP     cmd_to_stack
;----------------------------------------------------------------------------

impl_add_mode                          ; CODE XREF copy_af_2_ad+142j
                LDA     ($98),Y         ; load opcode from table
                PHA     
                JSR     get_param_chr   ; check next 2 chars of param
                BNE     jmpbadadrerror
                JSR     get_param_chr   ; if only spaces found it is an implicit menemonic
                BNE     jmpbadadrerror  ; e.g. an "CLI  A" will compile without error.."CLI A" will cause an error
                PLA                     ; restore opcode

jmp_store_obj_v                        ; CODE XREF copy_af_2_ad+17Bj
                                        ; copy_af_2_ad+1E2j ...
                JSR     store_obj_val   ; save opcode

next_src_line                          ; CODE XREF copy_af_2_ad+FCj
                                        ; copy_af_2_ad+102j ...
                JSR     chk_end_asm
                JMP     asm_loop2
;----------------------------------------------------------------------------

jmpbadadrerror                         ; CODE XREF copy_af_2_ad+15Fj
                                        ; copy_af_2_ad+164j
                JMP     badaddresserror
;----------------------------------------------------------------------------

chk_branch_opc                         ; CODE XREF copy_af_2_ad+147j
                LDA     ($98),Y
                JSR     store_obj_val
                JSR     addr_frm_param
                BMI     jmp_store_obj_v
                LDY     $B8
                CLC     
                LDA     $B7
                SBC     $BB
                STA     $B7
                BPL     loc_FFFFF6C0_A2FE
                INY     

loc_FFFFF6C0_A2FE                      ; CODE XREF copy_af_2_ad+186j
                TYA     
                SBC     $BC
                BNE     branch2longerr  ; error if branch is too long (>+/-128bytes)
                JMP     storelowb_objc
;----------------------------------------------------------------------------

branch2longerr                         ; CODE XREF copy_af_2_ad+18Cj
                LDY     #IDX_BRANCH2LONG  ; print error "Branch too long"
                JMP     mainerrorhndler ; handle error
;----------------------------------------------------------------------------

chk_op_main                            ; CODE XREF copy_af_2_ad+13Dj
                JSR     get_param_chr   ; check first char of param
                BCS     accu_or_implici ; next char is $00 => accu address mode
                BNE     chk_param_opcod ; next char is no space, than check more complex param
                JSR     get_param_chr   ; else read next char
                BEQ     accu_or_implici ; space, than is zero flag==1 -> accu addressing mode eg. CLC

chk_param_opcod                        ; CODE XREF copy_af_2_ad+19Bj
                STA     $C1             ; save parameter char in $C1
                CMP     #'#'            ; lowbyte
                BEQ     chk_again
                CMP     #'/'            ; highbyte
                BEQ     chk_again
                CMP     #'('            ; more complex - ind..indx
                BEQ     chk_again
                DEC     $C8             ; read pos length of last command -1

chk_again                              ; CODE XREF copy_af_2_ad+1A6j
                                        ; copy_af_2_ad+1AAj ...
                JSR     calc_addr_init
                LDA     $C1
                CMP     #'#'
                BEQ     immediate       ; immediate addressing mode?
                CMP     #'/'
                BEQ     highbyteimm     ; only highbyte?
                CMP     #'('
                BEQ     complexaddr_mod ; more complex addressing mode
                JSR     get_param_chr
                BEQ     adr_mod_z_a     ; zeropage or absolute addressing mode
                CMP     #','
                BNE     badaddresserror
                JSR     get_param_chr
                CMP     #'X'
                BEQ     adr_mod_z_ax    ; zeropage idx or absolute idx (X register)
                CMP     #'Y'
                BEQ     adr_mod_zi_ai   ; zeropage idx or absolute idx (Y register)

badaddresserror                        ; CODE XREF copy_af_2_ad+170j
                                        ; copy_af_2_ad+1CAj ...
                LDY     #IDX_BADADRESS   ; print error "Bad address"
                JMP     mainerrorhndler ; handle error
;----------------------------------------------------------------------------

accu_or_implici                        ; CODE XREF copy_af_2_ad+199j
                                        ; copy_af_2_ad+1A0j
                LDY     #6              ; offset to accu/impl address mode (e.g. CLC)
                LDA     ($94),Y         ; load opcode
                BEQ     badaddresserror ; beep ..address error
                JMP     jmp_store_obj_v ; and opcode in object code mem
;----------------------------------------------------------------------------

highbyteimm                            ; CODE XREF copy_af_2_ad+1BDj
                LDA     $B8             ; copy highbyte into
                STA     $B7             ; lowbyte

immediate                              ; CODE XREF copy_af_2_ad+1B9j
                LDY     #3              ; immediate addressing mode..#

loadaddressmode                        ; CODE XREF copy_af_2_ad+1FCj
                                        ; copy_af_2_ad+207j ...
                LDA     ($94),Y         ; get address mode (depends on Y)
                BEQ     badaddresserror
                JSR     store_obj_val   ; and store it as object code

storelowb_objc                         ; CODE XREF copy_af_2_ad+18Ej
                LDA     $B7
                JMP     jmp_store_obj_v ; store lowbyte of param
;----------------------------------------------------------------------------

adr_mod_z_a                            ; CODE XREF copy_af_2_ad+1C6j
                LDY     #5              ; zero page addressing mode
                JSR     load_opc_58d
                BEQ     loadaddressmode
                LDY     #4              ; absolute addressing mode
                BNE     load_add_mode

adr_mod_z_ax                           ; CODE XREF copy_af_2_ad+1D1j
                LDY     #9              ; zeropage index addressing mode
                JSR     load_opc_58d
                BEQ     loadaddressmode
                LDY     #$A             ; absolute index X addressing mode
                BNE     load_add_mode

adr_mod_zi_ai                          ; CODE XREF copy_af_2_ad+1D5j
                LDY     #$D             ; zeropage index Y ...($XX,Y)
                JSR     load_opc_58d
                BEQ     loadaddressmode
                LDY     #$B             ; absolute index Y ...($XXXX,Y)
                BNE     load_add_mode

complexaddr_mod                        ; CODE XREF copy_af_2_ad+1C1j
                JSR     get_param_chr
                CMP     #')'
                BEQ     zp_addr_mode_ch ; ($00) or ($00),Y
                CMP     #','
                BNE     badaddresserror
                JSR     get_param_chr
                CMP     #'X'
                BNE     badaddresserror
                JSR     get_param_chr
                CMP     #')'
                BNE     badaddresserror
                LDY     #7              ; zero page indexed indirect..($XX,X)

jmp_load_opcode                        ; CODE XREF copy_af_2_ad+250j
                JSR     load_opcode
                BNE     abs_x_add_mode
                BEQ     loadaddressmode

abs_x_add_mode                         ; CODE XREF copy_af_2_ad+236j
                LDY     #$E             ; load absolute index indirect add mode ($0000,X)
                BNE     load_add_mode   ; load addressing mode

zp_addr_mode_ch                        ; CODE XREF copy_af_2_ad+21Dj
                JSR     get_param_chr
                BEQ     zp_indi_add_mod ; space after ")"..maybe zeropage indirect ($XX)
                CMP     #','            ; if not, next it must be ","
                BNE     jmpbadaddresser ; else => error
                JSR     get_param_chr
                CMP     #'Y'
                BNE     jmpbadaddresser
                LDY     #8              ; zeropage ind index Y ..($XX),Y
                BNE     jmp_load_opcode ; load the opcode

zp_indi_add_mod                        ; CODE XREF copy_af_2_ad+241j
                LDY     #$C             ; load zero page indirect..($XX)
                LDA     ($94),Y
                BEQ     jmpbadaddresser
                CMP     #'l'
                BEQ     stor_addr_parm
                LDA     $B8
                BNE     jmpbadaddresser
                LDA     ($94),Y
                JSR     store_obj_val
                LDA     $B7
                JMP     jmp_store_obj_v
; End of function copy_af_2_ad

;----------------------------------------------------------------------------

load_add_mode                          ; CODE XREF copy_af_2_ad+200j
                                        ; copy_af_2_ad+20Bj ...
                LDA     ($94),Y         ; load addressing mode
                BEQ     jmpbadaddresser

stor_addr_parm                         ; CODE XREF copy_af_2_ad+25Aj
                JSR     store_obj_val   ; store addressing mode
                LDA     $B7             ; store lowbyte of param
                JSR     store_obj_val
                LDA     $B8             ; store highbyte of param
                JMP     jmp_store_obj_v
;----------------------------------------------------------------------------

jmpbadaddresser                        ; CODE XREF copy_af_2_ad+245j
                                        ; copy_af_2_ad+24Cj ...
                JMP     badaddresserror

;----------------------------------------------------------------------------

;               S u b r o u t i n e

load_opc_58d                           ; CODE XREF copy_af_2_ad+1F9p
                                        ; copy_af_2_ad+204p ...
                LDA     $58D
                BMI     error_opcode
; End of function load_opc_58d


;----------------------------------------------------------------------------

;               S u b r o u t i n e

load_opcode                            ; CODE XREF copy_af_2_ad+233p
                LDA     ($94),Y         ; load opcode
                BEQ     error_opcode    ; 00 => error
                LDA     $B8             ; load highbyte of address
                BEQ     return_ok

error_opcode                           ; CODE XREF load_opc_58d+3j
                                        ; load_opcode+2j
                LDA     #$FF

return_ok                              ; CODE XREF load_opcode+6j
                RTS     
; End of function load_opcode


;----------------------------------------------------------------------------

;               S u b r o u t i n e

store_obj_val                          ; CODE XREF copy_af_2_ad+167p
                                        ; copy_af_2_ad+175p ...
                CPX     $C3             ; load pass counter (0 = pass1)
                BEQ     pass1_as        ; branch if pass 1
                PHA     
                BIT     $C5             ; load LI on off status
                BMI     list_off_as     ; branch if .li is off
                LDA     $587
                BEQ     loc_FFFFF6C0_A41B
                CMP     #4
                BNE     loc_FFFFF6C0_A41E
                STX     $587
                JSR     printnewline

loc_FFFFF6C0_A41B                      ; CODE XREF store_obj_val+Cj
                JSR     load_obj_adr_xy

loc_FFFFF6C0_A41E                      ; CODE XREF store_obj_val+10j
                JSR     printspace
                INC     $587

list_off_as                            ; CODE XREF store_obj_val+7j
                BIT     $585            ; check if object code should be written to disk
                BMI     writetochannel5 ; if so, than bit 7 == 1 and branch
                BIT     $590            ; check if bit 7 is set
                BMI     dontwriteobjcod ; if it is no obj code is written into memory
                LDA     $B4             ; target lowbyte
                CMP     $85
                BCS     loc_FFFFF6C0_A43A
                CMP     $83
                BCC     loc_FFFFF6C0_A440
                BCS     save_val_in_mem

loc_FFFFF6C0_A43A                      ; CODE XREF store_obj_val+2Fj
                CMP     $87
                BCC     memstorageerr
                BCS     save_val_in_mem

loc_FFFFF6C0_A440                      ; CODE XREF store_obj_val+33j
                CMP     $81
                BCS     memstorageerr

save_val_in_mem                        ; CODE XREF store_obj_val+35j
                                        ; store_obj_val+3Bj
                PLA                     ; get value from stack
                STA     ($B3,X)         ; and store in object mem

saveobjectloop                         ; CODE XREF store_obj_val+5Cj
                                        ; seg000A49Ej
                BIT     $C5             ; if .LI OFF then
                BMI     skipprintout2
                JSR     tostring        ; else print it out

pass1_as                               ; CODE XREF store_obj_val+2j
                JSR     print_or_ta

skipprintout2                          ; CODE XREF store_obj_val+46j
                INC     $B3             ; inc pointer to object code low byte
                BNE     skipb4inc
                INC     $B4             ; if b3 is 0 than increase high byte

skipb4inc                              ; CODE XREF store_obj_val+50j
                INC     $BB             ; increaste end of object code..why?
                BNE     skipbcinc
                INC     $BC             ; high byte

skipbcinc                              ; CODE XREF store_obj_val+56j
                RTS     
;----------------------------------------------------------------------------

dontwriteobjcod                        ; CODE XREF store_obj_val+29j
                PLA     
                JMP     saveobjectloop
; End of function store_obj_val


;----------------------------------------------------------------------------

;               S u b r o u t i n e

print_or_ta                            ; CODE XREF store_obj_val+4Bp
                                        ; seg000A705p ...
                BIT     $C9
                BPL     skipprintout
                LDA     $C3             ; load pass counter
                BNE     skipprintout    ; branch if pass 2 (C3!=00)
                LDX     $BB
                LDY     $BC             ; load object code address to x,y
                JSR     to_hexstring    ; and print it $XXXX
                LDX     $B3             ; target low byte
                LDY     $B4             ; target high byte
                LDA     #'('
                JSR     print
                JSR     to_hexstring    ; print target address ($XXXX)
                LDA     #')'
                JSR     print
                JSR     printminus      ; print "-"
                LDX     #0
                STX     $C9

skipprintout                           ; CODE XREF print_or_ta+2j
                                        ; print_or_ta+6j
                RTS     
; End of function print_or_ta

;----------------------------------------------------------------------------

writetochannel5                        ; CODE XREF store_obj_val+24j
                LDA     #$50            ; channel number 5
                STA     $581            ; and store in $581
                BIT     $CA             ; check bit 7
                BPL     loc_FFFFF6C0_A49A ; if it is 0, branch
                JSR     sub_FFFFF6C0_A831
                LDA     #0
                STA     $CA             ; clear $CA...bit 7 = 0

loc_FFFFF6C0_A49A                      ; CODE XREF seg000A491j
                PLA     
                JSR     putchar
                JMP     saveobjectloop
;----------------------------------------------------------------------------

memstorageerr                          ; CODE XREF store_obj_val+39j
                                        ; store_obj_val+3Fj
                LDY     #IDX_MEMSTORAGE  ; print error "Memory storage"
                JMP     mainerrorhndler ; handle error

;----------------------------------------------------------------------------

;               S u b r o u t i n e

load_obj_adr_xy                        ; CODE XREF store_obj_val+18p
                                        ; seg000A6FBp
                LDX     $BB             ; load current pos in object memory
                LDY     $BC
; End of function load_obj_adr_xy


;----------------------------------------------------------------------------

;               S u b r o u t i n e

print_pseudo_bl                        ; CODE XREF seg0009FEDp seg000A691p
                LDA     $C3
                BEQ     clear_x_and_rts ; if pass 1 (C3==0) than branch
                BIT     $C5             ; check if .LI is OFF ($C5 == $80)
                BMI     clear_x_and_rts ; than branch
                JSR     to_hexstring    ; print objectcode address as hex on screen
                LDA     #':'
                JSR     print           ; print ':'
                INC     $587

clear_x_and_rts                        ; CODE XREF print_pseudo_bl+2j
                                        ; print_pseudo_bl+6j
                LDX     #0
                RTS     
; End of function print_pseudo_bl


;----------------------------------------------------------------------------

;               S u b r o u t i n e

chk_end_asm                            ; CODE XREF copy_af_2_ad+4Dp
                                        ; copy_af_2_ad+16Ap ...
                BIT     $C5             ; check .LI OFF or ON bit 7 of $C5
                BMI     callrts2        ; if bit 7 == 1 (.LI OFF) than RTS
                LDA     $C3             ; load current pass (1 is 0 and 2 is 1)
                BEQ     callrts2        ; if pass 1 than RTS
                LDY     $587            ; no, pass two and LI is ON
                LDX     PASSTABLE,Y
                JSR     printspaceloop
; End of function chk_end_asm


;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_A4D1                      ; CODE XREF seg000B0F5p
                LDA     $A9
                STA     $B9
                LDA     $AA
                STA     $BA
                JSR     printsrcline

callrts2                               ; CODE XREF chk_end_asm+2j
                                        ; chk_end_asm+6j
                RTS     
; End of function sub_FFFFF6C0_A4D1

;----------------------------------------------------------------------------
PASSTABLE       dta   $F ;  
                dta $A
                dta    7 ;  
                dta    4 ;  
                dta    1 ;  

;----------------------------------------------------------------------------

;               S u b r o u t i n e

nocomment_1p                           ; CODE XREF copy_af_2_ad+10Cp
                JSR     chk_local_label ; chks local label or copies label to $505,X
                BCC     badlabelerror
                JSR     calcsymboladdr  ; calc hash value from frist char of label (if hash points to zero SEC)
                BCC     copy_ad_2_b5    ; if pass1 than error
                JMP     cpy_ptr_2_hash
;----------------------------------------------------------------------------

badlabelerror                          ; CODE XREF nocomment_1p+3j
                LDY     #IDX_BADLABEL  ; print error "Bad Label"
                JMP     mainerrorhndler ; and handle that error
;----------------------------------------------------------------------------

copy_ad_2_b5                           ; CODE XREF nocomment_1p+8j
                CPX     $C3             ; load pass counter (pass1 == 0)
                BEQ     duplabelerror   ; if pass1 than error
                LDA     $AD
                STA     $B5
                LDA     $AE
                STA     $B6
                RTS     
;----------------------------------------------------------------------------

duplabelerror                          ; CODE XREF nocomment_1p+14j
                LDY     #IDX_DUPLABEL  ; print error "Duplicate label"
                JMP     mainerrorhndler ; handle error
; End of function nocomment_1p


;----------------------------------------------------------------------------

;               S u b r o u t i n e

cpy_ptr_2_hash                         ; CODE XREF nocomment_1p+Aj
                                        ; chk_obj_counter+1Cp
                LDA     $505            ; load first char
                CMP     #'.'
                BEQ     locallabel
                LDY     #1              ; loop counter set to 2

copyloop                               ; CODE XREF cpy_ptr_2_hash+20j
                LDA     ($AD),Y
                STA     $500,Y
                LDA     $82,Y           ; load pointer to symbol data (current pos)
                STA     ($AD),Y
                STA     $BD,Y
                STA     $B5,Y           ; save as pointer to last real label
                LDA     $BB,Y           ; load pointer to current object code
                STA     $502,Y          ; save in low high in 502, 503
                DEY                     ; loop counter -1
                BPL     copyloop        ; branch if not $FF
                CLC     
                LDA     $504            ; load number of chars of the symbol
                ADC     #5              ; add number of bytes of symbol header

cpy_500_2_symbo                        ; CODE XREF cpy_ptr_2_hash+83j
                TAX                     ; X is byte counter for loop9
                CLC     
                ADC     $82             ; add lowbyte of current pos in symbol data
                STA     $82             ; store as new current pointer to symbol data
                BCC     skip
                INC     $83             ; if necessary handle high byte

skip                                   ; CODE XREF cpy_ptr_2_hash+2Ej
                LDA     $82             ; check if symbol data runs into1 source code
                CMP     $84             ; begin source code low byte
                LDA     $83
                SBC     $85             ; begin of sourc code high byte
                BCS     jmpmemfullerror ; >= than error no more memory for symbol data
                LDY     #0

loop9                                  ; CODE XREF cpy_ptr_2_hash+45j
                LDA     $500,Y          ; copy input
                STA     ($BD),Y         ; to symbol memory
                INY     
                DEX                     ; dec byte counter see address $A52E
                BNE     loop9
                RTS     
;----------------------------------------------------------------------------

jmpmemfullerror                        ; CODE XREF cpy_ptr_2_hash+3Aj
                JMP     memfullerror
;----------------------------------------------------------------------------

locallabel                             ; CODE XREF cpy_ptr_2_hash+5j
                LDY     #4
                LDA     ($AD),Y
                BMI     reallabel       ; if its a real label no EOR necessary
                ORA     #$80            ; ok, local label => toggle bit 7
                STA     ($AD),Y         ; store in symbol data
                BNE     dont_dec_82_83

reallabel                              ; CODE XREF cpy_ptr_2_hash+4Fj
                LDA     $82             ; 82,83 end of symbol data
                BNE     nozero82
                DEC     $83             ; if 82 zero than dec 83

nozero82                               ; CODE XREF cpy_ptr_2_hash+59j
                DEC     $82             ; dec 82

dont_dec_82_83                         ; CODE XREF cpy_ptr_2_hash+55j
                LDY     #2              ; index to lowbyte of address in symbol data
                LDA     $506            ; load local label
                STA     $500            ; and store at first pos in buffer
                SEC     
                LDA     $BB             ; load lowbyte end of object code
                SBC     ($AD),Y         ; subract lowbyte of address from symbol data
                STA     $501            ; store diff in $501
                INY     
                LDA     $BC             ; load high byte end of object code
                SBC     ($AD),Y         ; subtract high byte of address from symbol data
                BNE     locoutofrerror  ; local out of range error
                STA     $502            ; store 0 in $502
                LDA     $82             ; load lowbyte end of symbol data
                STA     $BD
                LDA     $83             ; load high byte end of symbol data
                STA     $BE
                LDA     #3
                BNE     cpy_500_2_symbo

locoutofrerror                         ; CODE XREF cpy_ptr_2_hash+74j
                LDY     #IDX_LOC_O_OF_RANGE  ; print error "Local out of range"
                JMP     mainerrorhndler ; handle the error
; End of function cpy_ptr_2_hash

;----------------------------------------------------------------------------

pseudo_op_ob                           ; clear accu
                LDA     #0
                BEQ     en_di_code_gen  ; enable code generation (obj code will be stored in memory)

pseudo_op_no                           ; mark in $590 that no object code will be stored till now
                LDA     #$FF

en_di_code_gen                         ; CODE XREF seg000A592j
                STA     $590            ; $FF => no obj code will be stored, $00 => obj code will be stored in mem
                JMP     next_src_line   ; process next source line
;----------------------------------------------------------------------------

pseudo_op_li                           ; CODE XREF seg000A5A7j
                JSR     get_param_chr   ; load char from first parameter
                BCS     jmpbadinsterr   ; error .. no N or F found in param
                CMP     #'F'            ; check .LI OFF - search for char F or N in parameter string
                BEQ     lis_on_or_off   ; if char 'F' is found
                CMP     #'N'            ; check .LI ON
                BNE     pseudo_op_li    ; if  char is not 'N' than search again
                CLC                     ; clear carry

lis_on_or_off                          ; CODE XREF seg000A5A3j
                ROR     $C5             ; move carry in bit 7 of $C5
                JMP     asm_loop2       ; jmp back to assembler routine
;----------------------------------------------------------------------------

jmpbadinsterr                          ; CODE XREF seg000A59Fj
                JMP     badinstrerror
;----------------------------------------------------------------------------

pseudo_op_or
                JSR     addr_frm_param
                BNE     undeflableerr   ; calc address from parameter into b7,b8
                JSR     chk_obj_counter ; check if bc,bd and b1,b2 equal. if so than is accu==0
                PHA     
                JSR     settarget_to_or ; set new address b7,b8 to target b3,b4 and bb,bc
                JSR     setnew_or       ; copy $BB,$BC to $B1,$B2
                PLA     
                BEQ     jmp_ignsrcline
                LDA     $C3             ; check for pass 2 ?
                BNE     jmp_ignsrcline  ; called if pass 2 ($C3 == 1)
                LDA     #$FF
                STA     $C9

jmp_ignsrcline                         ; CODE XREF seg000A5C2j seg000A5C6j
                JMP     next_src_line
;----------------------------------------------------------------------------

undeflableerr                          ; CODE XREF seg000A5B5j seg000A5E2j
                JMP     undeflabelerr

;----------------------------------------------------------------------------

;               S u b r o u t i n e

settarget_to_or                        ; CODE XREF seg000A5BBp
                LDX     $B7             ; low byte new address
                STX     $BB             ; end of obj code low
                STX     $B3             ; target low
                LDY     $B8             ; highbyte new address
                STY     $BC             ; end of obj code high
                STY     $B4             ; target high
                RTS     
; End of function settarget_to_or

;----------------------------------------------------------------------------

pseudo_op_ta
                JSR     addr_frm_param
                BNE     undeflableerr
                LDX     $B7
                STX     $B3             ; target lowbyte
                LDY     $B8
                STY     $B4             ; target highbyte
                JMP     next_src_line
;----------------------------------------------------------------------------

pseudo_op_as                           ; .AS ..stores string. Load Y with 0..does mean do not invert chars
                LDY     #0

next_frm_str                           ; CODE XREF seg000A5FCj
                STY     $9C             ; store invert/not invert
                JSR     getvalidchar
                BCS     jmpbadadderror
                LDY     #$80            ; load invert (bit 7 == 1) to Y
                CMP     #'-'            ; check for inverted chars
                BEQ     next_frm_str    ; store #$80 in $9c for invertion
                STA     $588            ; next found char is the delimiter e.g '

string_as_loop                         ; CODE XREF seg000A610j
                JSR     get_param_chr   ; get next string char
                BCS     jmpbadadderror
                CMP     $588            ; check if end marker found
                BEQ     ignoresrcline   ; yes, than next source line
                ORA     $9C             ; if "-" (see $a5fa)was found before than set bit 7 and invert the current char
                JSR     store_obj_val
                JMP     string_as_loop
;jmpbadadderror2  jmp jmpbadadderror              
;----------------------------------------------------------------------------

ignoresrcline                          ; CODE XREF seg000A609j seg000A630j
                JMP     next_src_line
;----------------------------------------------------------------------------

pseudo_op_at
                LDY     #0

next_frm_atstr                         ; CODE XREF seg000A623j
                STY     $9C             ; store invert/not invert
                JSR     getvalidchar
                BCS     jmpbadadderror
                LDY     #$80            ; set bit 7 to 1..inverted chars
                CMP     #'-'            ; minus => atascii will be inverted ($9c==$80)
                BEQ     next_frm_atstr
                STA     $588            ; store char as end marker (delimiter)

atstr_loop                             ; CODE XREF seg000A648j
                JSR     get_param_chr
                BCS     jmpbadadderror
                CMP     $588            ; check for end marker
                BEQ     ignoresrcline   ; yes, than next source line
                ORA     $9C             ; invert if - was found before
                TAY                     ; convert ascii => atascii
                ROL     @
                ROL     @
                ROL     @
                ROL     @
                AND     #3              ; mask out bits 2 .. 7
                STA     $9D
                TYA     
                LDY     $9D
                AND     #$9F
                ORA     pseu_at_tabl,Y         ; using this table
                JSR     store_obj_val   ; and store the atstring in memory
                JMP     atstr_loop      ; get next atstring val

;----------------------------------------------------------------------------
pseu_at_tabl    dta  $40 ; @
                dta    0 ;  
                dta  $20 ;  
                dta  $60 ; `
;----------------------------------------------------------------------------

pseudo_op_hx
                JSR     getvalidchar
                BCS     jmpbadadderror
                JSR     checkparampos

next_hx_loop                           ; CODE XREF seg000A666j
                JSR     char2hex9c      ; convert first(high) hex ascii nibble
                BCC     end_of_hx       ; end_or_error found (if c=0)
                JSR     char2hex9c      ; convert second (low) hex ascii nibble
                BCC     jmpbadadderror  ; if c==0 then error
                LDA     $9C             ; load hex val created by char2hex9c and
                JSR     store_obj_val   ; store it in memory
                JMP     next_hx_loop
;----------------------------------------------------------------------------

end_of_hx                              ; CODE XREF seg000A65Aj
                JSR     get_param_chr
                BNE     jmpbadadderror  ; error?
                JMP     next_src_line   ; no, than next line of source
;----------------------------------------------------------------------------

jmpbadadderror                         ; CODE XREF seg000A5F6j seg000A604j
                                        ; ...
                JMP     badaddresserror
;----------------------------------------------------------------------------

pseudo_op_eq                           ; CODE XREF copy_af_2_ad+153j
                LDY     $400
                CPY     #'.'
                BEQ     labelnotfnderr
                CPY     #' '
                BNE     calc_eq_label

labelnotfnderr                         ; CODE XREF seg000A679j
                LDY     #IDX_LABELNOTFOUND ; print error "Label not found"
                JMP     mainerrorhndler ; yep, and handle it
;----------------------------------------------------------------------------

calc_eq_label                          ; CODE XREF seg000A67Dj
                JSR     addr_frm_param
                BNE     jmpundeflabeler
                LDA     $C3
                BEQ     calc_eq_pass1   ; pass 1, than branch ($C3==0)
                LDX     $B7
                LDY     $B8
                JSR     print_pseudo_bl ; print start address on screen
                JMP     next_src_line
;----------------------------------------------------------------------------

calc_eq_pass1                          ; CODE XREF seg000A68Bj
                LDY     #2
                LDA     $B7
                STA     ($BD),Y
                INY     
                LDA     $B8
                STA     ($BD),Y
                JMP     next_src_line
;----------------------------------------------------------------------------

jmpundeflabeler                        ; CODE XREF seg000A687j seg000A6F9j
                JMP     undeflabelerr
;----------------------------------------------------------------------------

pseudo_op_da                           ; CODE XREF seg000A6DCj
                JSR     getvalidchar
                BCS     jmpbadadderror
                STA     $588
                CMP     #'#'            ; low byte marker
                BEQ     low_or_high_da
                CMP     #'/'            ; high byte marker
                BEQ     low_or_high_da
                CMP     #'"'            ; string marker (begin/end)
                BEQ     string_da
                JSR     checkparampos

low_or_high_da                         ; CODE XREF seg000A6B2j seg000A6B6j
                JSR     addr_frm_param
                LDA     $588            ; store value (or string delimiter), depends on the data
                CMP     #'#'
                BEQ     lowbyte_da      ; lowbyte marker found
                CMP     #'/'
                BEQ     highbyte_da     ; highbyte marker found
                LDA     $B7
                JSR     store_obj_val   ; store lowbyte

highbyte_da                            ; CODE XREF seg000A6CBj
                LDA     $B8             ; load high byte in accu and store

store_a_in_mem                         ; CODE XREF seg000A6E3j
                JSR     store_obj_val

istheremoredata                        ; CODE XREF seg000A6EEj
                JSR     get_param_chr
                CMP     #','            ; check if there is more data
                BEQ     pseudo_op_da    ; yes than loop
                JMP     next_src_line   ; no, ok than process next source line
;----------------------------------------------------------------------------

lowbyte_da                             ; CODE XREF seg000A6C7j
                LDA     $B7             ; load low byte and store
                JMP     store_a_in_mem
;----------------------------------------------------------------------------

string_da                              ; CODE XREF seg000A6BAj seg000A6F3j
                JSR     get_param_chr
                BCS     jmpbadadderror
                CMP     $588            ; check for string delimiter
                BEQ     istheremoredata ; found, than look for other data
                JSR     store_obj_val   ; store val in mem
                JMP     string_da       ; loop for string data
;----------------------------------------------------------------------------

pseudo_op_bl
                JSR     addr_frm_param
                BNE     jmpundeflabeler
                JSR     load_obj_adr_xy ; load current obj address in x,y - prints address on screen
                JSR     get_param_chr
                CMP     #','            ; check for second parameter = fill value
                BEQ     second_param    ; yes than branch
                JSR     print_or_ta
                CLC     
                LDA     $B7
                ADC     $BB
                STA     $BB
                LDA     $B8
                ADC     $BC
                STA     $BC
                CLC     
                LDA     $B7
                ADC     $B3
                STA     $B3
                LDA     $B8
                ADC     $B4
                STA     $B4
                LDA     #0
                STA     $C1
                LDA     $C3
                BEQ     goto_nextsrclin
                BIT     $585            ; check if data should be written to disk
                BPL     goto_nextsrclin ; no, than branch

loop8                                  ; CODE XREF seg000A745j
                LDA     $B7
                BNE     writetodevice
                LDA     $B8
                BEQ     goto_nextsrclin
                DEC     $B8

writetodevice                          ; CODE XREF seg000A731j
                DEC     $B7
                LDA     #$50            ; channel 5
                STA     $581
                LDA     $C1
                JSR     putchar
                JMP     loop8
;----------------------------------------------------------------------------

goto_nextsrclin                        ; CODE XREF seg000A728j seg000A72Dj
                                        ; ...
                JMP     next_src_line
;----------------------------------------------------------------------------

second_param                           ; CODE XREF seg000A703j
                LDA     $B7
                STA     $A3
                STA     $A5
                LDA     $B8
                STA     $A4
                STA     $A6
                JSR     addr_frm_param
                BNE     jmpbadaddrerr2
                LDA     $B8
                BNE     jmpbadaddrerr2

loc_FFFFF6C0_A760                      ; CODE XREF seg000A775j
                LDA     $A3
                BNE     loc_FFFFF6C0_A76A
                LDA     $A4
                BEQ     loc_FFFFF6C0_A778
                DEC     $A4

loc_FFFFF6C0_A76A                      ; CODE XREF seg000A762j
                DEC     $A3
                LDA     $B7
                STA     $C1
                LDX     #0
                JSR     store_obj_val
                JMP     loc_FFFFF6C0_A760
;----------------------------------------------------------------------------

loc_FFFFF6C0_A778                      ; CODE XREF seg000A766j
                LDA     $A5
                STA     $B7
                LDA     $A6
                STA     $B8
                JMP     next_src_line
;----------------------------------------------------------------------------

jmpbadaddrerr2                         ; CODE XREF seg000A75Aj seg000A75Ej
                JMP     badaddresserror

;----------------------------------------------------------------------------

;               S u b r o u t i n e

set504_505_506                         ; CODE XREF chk_obj_counter+16p
                                        ; sub_FFFFF6C0_A831p
                LDA     #$40            ; set first char to 40
                STA     $505            ; set read char to 40, that causes a 0 see routine calcsymboladdr
                LDA     $586
                AND     #$1F
                ORA     #$40
                STA     $506
                LDA     #2
                STA     $504
                RTS     
; End of function set504_505_506


;----------------------------------------------------------------------------

;               S u b r o u t i n e

setnew_or                              ; CODE XREF copy_af_2_ad+AEp
                                        ; seg000A5BEp
                LDA     $BB             ; low byte end of object code
                STA     $B1             ; store as new start object code
                LDA     $BC             ; high byte end object code
                STA     $B2             ; store as new high byte object code
                RTS     
; End of function setnew_or


;----------------------------------------------------------------------------

;               S u b r o u t i n e

chk_obj_counter                        ; CODE XREF copy_af_2_ad+55p
                                        ; seg000A5B7p
                LDA     $BB
                CMP     $B1
                BNE     notequal        ; if end of objectcode != start of obj code
                LDA     $BC
                CMP     $B2
                BNE     notequal        ; same for high byte
                LDA     #0              ; if end and start equal set accu=0 and return
                RTS     
;----------------------------------------------------------------------------

notequal                               ; CODE XREF chk_obj_counter+4j
                                        ; chk_obj_counter+Aj
                INC     $586
                LDA     $C3             ; check for pass 1 or 2
                BNE     if585_CA_2FF    ; if pass 2 than branch ($C3 ==1)
                JSR     set504_505_506
                JSR     calcsymboladdr
                JSR     cpy_ptr_2_hash
                LDY     #2
                SEC     
                LDA     $BB
                SBC     $B1
                STA     ($BD),Y
                INY     
                LDA     $BC
                SBC     $B2
                STA     ($BD),Y
                LDY     $BC
                LDX     $BB
                BNE     printbeg_code
                DEY     

printbeg_code                          ; CODE XREF chk_obj_counter+33j
                DEX     
                JSR     to_hexstring
                LDA     #'('
                JSR     print
                LDY     $B4
                LDX     $B3
                BNE     printend_code
                DEY     

printend_code                          ; CODE XREF chk_obj_counter+43j
                DEX     
                JSR     to_hexstring
                LDA     #')'
                JSR     print
                JSR     printnewline
                LDA     #1
                RTS     
;----------------------------------------------------------------------------

if585_CA_2FF                           ; CODE XREF chk_obj_counter+14j
                LDA     $585            ; check if channel is closed
                BPL     channelisclosed ; yes
                LDA     #$FF            ; no, than set CA to -1
                STA     $CA

channelisclosed                        ; CODE XREF chk_obj_counter+58j
                LDA     #0
                RTS     
; End of function chk_obj_counter

;----------------------------------------------------------------------------

pseudo_op_of                           ; load pass counter (pass 1 => C3==0)
                LDA     $C3
                BEQ     jmpasmloop2     ; branch if pass 1. Only in pass2 the object data will be written into file
                LDA     $585
                BPL     ch_is_closed    ; if not negativ, the channel is closed
                JSR     closechannel5   ; else close channel 5
                DEC     $586            ; set to 0

ch_is_closed                           ; CODE XREF seg000A80Cj
                INC     $586
                DEC     $585            ; set 585 negativ..save object file to disk
                LDA     #8
                LDX     #$50            ; open channel 5
                JSR     closeandopen581
                LDA     #$FF
                STA     $CA             ; set $CA to -1
                JSR     putchar
                JSR     putchar
                JMP     next_src_line
;----------------------------------------------------------------------------

jmpasmloop2                            ; CODE XREF seg000A807j
                JMP     asm_loop2

;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_A831                      ; CODE XREF seg000A493p
                JSR     set504_505_506
                JSR     calcsymboladdr
                LDA     #$50
                STA     $581            ; set channel to 5
                LDA     $B3
                JSR     putchar
                LDA     $B4
                JSR     putchar
                LDA     $B3
                CLC     
                ADC     $9C
                STA     $AB
                LDA     $B4
                ADC     $9D
                STA     $AC
                LDA     $AB
                BNE     ab_not_0
                DEC     $AC             ; ok, than high byte -1

ab_not_0                               ; CODE XREF sub_FFFFF6C0_A831+24j
                DEC     $AB             ; lowbyte -1
                LDA     $AB
                JSR     putchar
                LDA     $AC
                JSR     putchar
                RTS     
; End of function sub_FFFFF6C0_A831


;----------------------------------------------------------------------------

;               S u b r o u t i n e

closechannel5                          ; CODE XREF copy_af_2_ad+61p
                                        ; seg000A80Ep
                LDX     #$50
                STX     $581
                JSR     closechannel581
                LDA     #0
                STA     $585            ; set 0 to signal that channel is closed
                RTS     
; End of function closechannel5

;----------------------------------------------------------------------------
MNEMONICS       dta   $F ;  
                dta    3 ;  
_JMP            dta  $4A ; J          ; opcodes structs (see opcodes.txt)
                dta  $4D ; M
                dta  $50 ; P
                dta    0 ;  
                dta  $4C ; L
                dta    0 ;  
                dta    0 ;  
                dta    0 ;  
                dta    0 ;  
                dta    0 ;  
                dta    0 ;  
                dta    0 ;  
                dta  $6C ; l
                dta    0 ;  
                dta  $7C ; |
_jsr             dta b($4A,$53,$52)
                dta 0
                dta $20
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
_lda            dta b($4C,$44,$41)
                dta $A9
                dta $AD
                dta $A5
                dta 0
                dta $A1
                dta $B1
                dta $B5
                dta $BD
                dta $B9
                dta $B2
                dta 0
                dta 0
_ldx            dta b($4C,$44,$58)
                dta $A2
                dta $AE
                dta $A6
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta $BE
                dta 0
                dta $B6
                dta 0
_ldy            dta b($4C,$44,$59)
                dta $A0
                dta $AC
                dta $A4
                dta 0
                dta 0
                dta 0
                dta $B4
                dta $BC
                dta 0
                dta 0
                dta 0
                dta 0
_sta            dta b($53,$54,$41)
                dta 0
                dta $8D
                dta $85
                dta 0
                dta $81
                dta $91
                dta $95
                dta $9D
                dta $99
                dta $92
                dta 0
                dta 0
_stx            dta b($53,$54,$58)
                dta 0
                dta $8E
                dta $86
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta $96
                dta 0
_sty            dta b($53,$54,$59)
                dta 0
                dta $8C
                dta $84
                dta 0
                dta 0
                dta 0
                dta $94
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
_adc            dta b($41,$44,$43)
                dta $69
                dta $6D
                dta $65
                dta 0
                dta $61
                dta $71
                dta $75
                dta $7D
                dta $79
                dta $72
                dta 0
                dta 0
_and            dta b($41,$4E,$44)
                dta $29
                dta $2D
                dta $25
                dta 0
                dta $21
                dta $31
                dta $35
                dta $3D
                dta $39
                dta $32
                dta 0
                dta 0
_asl            dta b($41,$53,$4C)
                dta 0
                dta $E
                dta 6
                dta $A
                dta 0
                dta 0
                dta $16
                dta $1E
                dta 0
                dta 0
                dta 0
                dta 0
_bit            dta b($42,$49,$54)
                dta 0
                dta $2C
                dta $24
                dta 0
                dta 0
                dta 0
                dta $34
                dta $3C
                dta 0
                dta 0
                dta 0
                dta 0
_cmp            dta b($43,$4D,$50)
                dta $C9
                dta $CD
                dta $C5
                dta 0
                dta $C1
                dta $D1
                dta $D5
                dta $DD
                dta $D9
                dta $D2
                dta 0
                dta 0
_cpx            dta b($43,$50,$58)
                dta $E0
                dta $EC
                dta $E4
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
_cpy            dta b($43,$50,$59)
                dta $C0
                dta $CC
                dta $C4
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
_dec            dta b($44,$45,$43)
                dta 0
                dta $CE
                dta $C6
                dta 0
                dta 0
                dta 0
                dta $D6
                dta $DE
                dta 0
                dta 0
                dta 0
                dta 0
_eor            dta b($45,$4F,$52)
                dta $49
                dta $4D
                dta $45
                dta 0
                dta $41
                dta $51
                dta $55
                dta $5D
                dta $59
                dta $52
                dta 0
                dta 0
_inc            dta b($49,$4E,$43)
                dta 0
                dta $EE
                dta $E6
                dta 0
                dta 0
                dta 0
                dta $F6
                dta $FE
                dta 0
                dta 0
                dta 0
                dta 0
_lsr            dta b($4C,$53,$52)
                dta 0
                dta $4E
                dta $46
                dta $4A
                dta 0
                dta 0
                dta $56
                dta $5E
                dta 0
                dta 0
                dta 0
                dta 0
_ora            dta b($4F,$52,$41)
                dta 9
                dta $D
                dta 5
                dta 0
                dta 1
                dta $11
                dta $15
                dta $1D
                dta $19
                dta $12
                dta 0
                dta 0
_rol            dta b($52,$4F,$4C)
                dta 0
                dta $2E
                dta $26
                dta $2A
                dta 0
                dta 0
                dta $36
                dta $3E
                dta 0
                dta 0
                dta 0
                dta 0
_ror            dta b($52,$4F,$52)
                dta 0
                dta $6E
                dta $66
                dta $6A
                dta 0
                dta 0
                dta $76
                dta $7E
                dta 0
                dta 0
                dta 0
                dta 0
_sbc            dta b($53,$42,$43)
                dta $E9
                dta $ED
                dta $E5
                dta 0
                dta $E1
                dta $F1
                dta $F5
                dta $FD
                dta $F9
                dta $F2
                dta 0
                dta 0
_stz            dta b($53,$54,$5A)
                dta 0
                dta $9C
                dta $64
                dta 0
                dta 0
                dta 0
                dta $74
                dta $9E
                dta 0
                dta 0
                dta 0
                dta 0
_trb            dta b($54,$52,$42)
                dta 0
                dta $1C
                dta $14
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
_tsb            dta b($54,$53,$42)
                dta 0
                dta $C
                dta 4
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta 0
                dta    0 ;  
                dta    4 ;  
                dta    3 ;  
_brk            dta b($42,$52,$4B)
                dta 0
_clc            dta b($43,$4C,$43)
                dta $18
_cld            dta b($43,$4C,$44)
                dta $D8
_cli            dta b($43,$4C,$49)
                dta $58
_clv            dta b($43,$4C,$56)
                dta $B8
_dea            dta b($44,$45,$41)
                dta $3A
_dex            dta b($44,$45,$58)
                dta $CA
_dey            dta b($44,$45,$59)
                dta $88
_ina            dta b($49,$4E,$41)
                dta $1A
_inx            dta b($49,$4E,$58)
                dta $E8
_iny            dta b($49,$4E,$59)
                dta $C8
_nop            dta b($4E,$4F,$50)
                dta $EA
_pha            dta b($50,$48,$41)
                dta $48
_php            dta b($50,$48,$50)
                dta 8
_phx            dta b($50,$48,$58)
                dta $DA
_phy            dta b($50,$48,$59)
                dta $5A
_pla            dta b($50,$4C,$41)
                dta $68
_plp            dta b($50,$4C,$50)
                dta $28
_plx            dta b($50,$4C,$58)
                dta $FA
_ply            dta b($50,$4C,$59)
                dta $7A
_rti            dta b($52,$54,$49)
                dta $40
_rts            dta b($52,$54,$53)
                dta $60
_sec            dta b($53,$45,$43)
                dta $38
_sed            dta b($53,$45,$44)
                dta $F8
_sei            dta b($53,$45,$49)
                dta $78
_tax            dta b($54,$41,$58)
                dta $AA
_tay            dta b($54,$41,$59)
                dta $A8
_tsx            dta b($54,$53,$58)
                dta $BA
_txa            dta b($54,$58,$41)
                dta $8A
_txs            dta b($54,$58,$53)
                dta $9A
_tya            dta b($54,$59,$41)
                dta $98
                dta    0 ;  
                dta    4 ;  
                dta    3 ;  
_bcc            dta b($42,$43,$43)
                dta $90
_bcs            dta b($42,$43,$53)
                dta $B0
_beq            dta b($42,$45,$51)
                dta $F0
_bmi            dta b($42,$4D,$49)
                dta $30
_bne            dta b($42,$4E,$45)
                dta $D0
_bpl            dta b($42,$50,$4C)
                dta $10
_bra            dta b($42,$52,$41)
                dta $80
_bvc            dta b($42,$56,$43)
                dta $50
_bvs            dta b($42,$56,$53)
                dta $70
                dta    0 ;  
                dta    5 ;  
                dta    3 ;  
_LI             dta b($2E,$4C,$49)     ; pseudo operations structs
                dta a(pseudo_op_li-1)
;                dta $9B
;                dta $A5
_OR             dta b($2E,$4F,$52)     ; 3 char followed by pointer (word)
                dta a(pseudo_op_or-1)
;                dta $B1
;                dta $A5
_TA             dta b($2E,$54,$41)
                dta a(pseudo_op_ta-1)
;                dta $DE
;                dta $A5
_AS             dta b($2E,$41,$53)
                dta a(pseudo_op_as-1)
;                dta $EE
;                dta $A5
_AT             dta b($2E,$41,$54)
                dta a(pseudo_op_at-1)
;                dta $15
;                dta $A6
_HX             dta b($2E,$48,$58)
                dta a(pseudo_op_hx-1)
;                dta $4E
;                dta $A6
_HS             dta b($2E,$48,$53)  
                dta a(pseudo_op_hx-1)
                ;  New OP-code for SynAss
                ;  comp.
_EQ             dta b($2E,$45,$51)
                dta a(pseudo_op_eq-1)
;                dta $73
;                dta $A6
_DA             dta b($2E,$44,$41)
                dta a(pseudo_op_da-1)
;                dta $A7
;                dta $A6
_BL             dta b($2E,$42,$4C)
                dta a(pseudo_op_bl-1)
;                dta $F5
;                dta $A6
_EN             dta b($2E,$45,$4E)
                dta a(pseudo_op_en-1)
;                dta $C1
;                dta $A1
_IN             dta b($2E,$49,$4E)
                dta a(pseudo_op_in-1)
;                dta $70
;                dta $AD
_OF             dta b($2E,$4F,$46)
                dta a(pseudo_op_of-1)
;                dta $04
;                dta $A8
_DF             dta b($2E,$44,$46)
                dta a(pseudo_op_df-1)
;                dta $39
;                dta $AE
_OB             dta b($2E,$4F,$42)
                dta a(pseudo_op_ob-1)
;                dta $8F
;                dta $A5
_NO             dta b($2E,$4E,$4F)
                dta a(pseudo_op_no-1)
;                dta $93
;                dta $A5
                dta    0 ;  
;----------------------------------------------------------------------------

command_dir
                LDX     #$60
                LDA     #3
                STA     $342,X          ; command==3 => Open
                LDA     #<aDirectoryStr
                STA     $344,X          ; ptr to string "d*.*"
                LDA     #>aDirectoryStr            ; as buffer adr (ICBAL/H)
                STA     $345,X
                LDA     #$22
                JSR     find_char_bf
                BCS     loc_FFFFF6C0_AB2E
                LDA     $C8
                STA     $344,X
                LDA     #4
                STA     $345,X

loc_FFFFF6C0_AB13                      ; CODE XREF seg000AB1Aj
                JSR     get_param_chr
                BCS     loc_FFFFF6C0_AB1E
                CMP     #':'
                BNE     loc_FFFFF6C0_AB13
                BEQ     loc_FFFFF6C0_AB2E

loc_FFFFF6C0_AB1E                      ; CODE XREF seg000AB16j
                LDX     $C8
                LDY     #1

loop6                                  ; CODE XREF seg000AB2Cj
                LDA     aDirectoryStr,Y         ; pointer to string "d*.*"-is used for dir without parameter
                BEQ     loc_FFFFF6C0_AB2E
                STA     $400,X
                INY     
                INX     
                BNE     loop6

loc_FFFFF6C0_AB2E                      ; CODE XREF seg000AB07j seg000AB1Cj
                                        ; ...
                LDX     #$60
                LDA     #6
                STA     $34A,X
                JSR     execciomain

readchar_ch7                           ; CODE XREF seg000AB5Ej
                LDX     #$60            ; channel 6
                LDA     #7
                STA     $342,X          ; command 7 == get
                LDA     #$80
                STA     $344,X          ; set buffer adress to 0x0480
                LDA     #4
                STA     $345,X
                LDA     #1
                STA     $348,X          ; set buffer length to 1
                LDA     #0
                STA     $349,X
                JSR     $E456           ; call of CIOMAIN using JMPTAB+6
                BMI     error_ch7
                LDA     $480            ; load read char into accu
                JSR     print           ; and print it
                JMP     readchar_ch7
;----------------------------------------------------------------------------

error_ch7                              ; CODE XREF seg000AB56j
                STX     $581            ; store error code from CIOMAIN in $581
                JMP     closechannel581
;----------------------------------------------------------------------------
aDirectoryStr   dta c'D:*.*',$9B

;----------------------------------------------------------------------------

;               S u b r o u t i n e

find_char_bf                           ; CODE XREF seg0009E96p seg000AB04p
                                        ; ...
                LDY     #0
                STA     $BF

find_char_again                        ; CODE XREF find_char_bf+Bj
                                        ; seg000AE1Cp
                JSR     getchr_src_400
                BCS     loc_FFFFF6C0_AB7C
                CMP     $BF
                BNE     find_char_again
                CLC     
                RTS     
;----------------------------------------------------------------------------

loc_FFFFF6C0_AB7C                      ; CODE XREF find_char_bf+7j
                SEC     
                RTS     
; End of function find_char_bf

;----------------------------------------------------------------------------

command_pof                            ; printer off
                LDX     #$30
                STX     $581
                JSR     closechannel581
                LDA     #0
                BEQ     loc_FFFFF6C0_ABAD

command_pon                            ; printer on
                LDX     #$30
                STX     $581
                LDA     $58A
                BMI     loc_FFFFF6C0_ABAD
                LDA     #<aStrPrinter
                STA     $344,X
                LDA     #>aStrPrinter
                STA     $345,X
                LDA     #8
                STA     $34A,X
                LDA     #3
                STA     $342,X
                JSR     execciomain
                LDA     #$FF

loc_FFFFF6C0_ABAD                      ; CODE XREF seg000AB88j seg000AB92j
                STA     $58A
                RTS     
;----------------------------------------------------------------------------
aStrPrinter     dta  $50 ; P          ; addressed from command_pon
                dta  $3A ; 
                dta  $9B ; ›

;----------------------------------------------------------------------------

;               S u b r o u t i n e

putchar                                ; CODE XREF seg000A49Bp seg000A742p
                                        ; ...
                STA     $BF             ; store current char in $BF
                TXA     
                PHA     
                TYA     
                PHA     
                LDX     $581            ; load channel
                LDA     #$B
                STA     $342,X          ; set ICCOM to $B => putchr
                LDA     #0
                STA     $348,X          ; set ICBLL, buffer length low byte
                STA     $349,X          ; set ICBLH, buffer length high byte
                LDA     $BF             ; load input char back into accu
                JSR     execciomain
                PLA     
                TAY     
                PLA     
                TAX     
                LDA     $BF             ; load the current char back into accu
                RTS     
; End of function putchar

;----------------------------------------------------------------------------
command_lst     LDA     #8              ; output
                LDX     #$40            ; channel 4
                JSR     closeandopen581 ; open channel 4
                LDX     #$FF
                STX     $58B
                JSR     lis_withoutpara
                JSR     printnewline
                LDA     #0
                STA     $58B
                JMP     closechannel581

;----------------------------------------------------------------------------

;               S u b r o u t i n e

closeandopen581                        ; CODE XREF seg000A81Ep seg000ABDAp
                                        ; ...
                STX     $581            ; store channel number in $581
                PHA     
                JSR     closechannel581 ; and close
                LDX     #$E
                LDA     #0

clearbufloop                           ; CODE XREF closeandopen581+Fj
                STA     $480,X
                DEX     
                BPL     clearbufloop    ; clear 480 + FF bytes
                LDA     #$22
                JSR     find_char_bf
                BCS     jmpsyntaxerr
                LDX     #0

loc_FFFFF6C0_AC0A                      ; CODE XREF closeandopen581+23j
                JSR     get_param_chr
                BCS     openchannel581
                STA     $480,X
                INX     
                BNE     loc_FFFFF6C0_AC0A

openchannel581                         ; CODE XREF closeandopen581+1Dj
                LDA     #$9B
                STA     $481,X
                LDX     $581            ; load channel id from $581
                LDA     #$80
                STA     $344,X          ; set buffer adress to 0x480
                LDA     #4
                STA     $345,X
                PLA     
                STA     $34A,X          ; set aux infos to 0x0<byte from stack>
                LDA     #0
                STA     $34B,X
                LDA     #3              ; open == 3
                STA     $342,X
                JMP     execciomain     ; exec the ioblock
;----------------------------------------------------------------------------

jmpsyntaxerr                           ; CODE XREF closeandopen581+16j
                JMP     syntaxerror
; End of function closeandopen581

;----------------------------------------------------------------------------

command_ent                            ; input
                LDA     #4
                LDX     #$20            ; channel 2
                JSR     closeandopen581 ; open channel
                LDA     #$FF            ; signal that input will come from other device than keyboard
                STA     $58C            ; and switch from keyboard input to disk input
                JMP     editorloop      ; and pipe data into parser
;----------------------------------------------------------------------------

command_sav                            ; save source in bibo format
                LDA     #8
                LDX     #$10            ; channel 1
                JSR     closeandopen581
                LDA     #'E'            ; save the magic 'E','R' -)
                STA     $500
                LDA     #'R'
                STA     $501
                LDA     $84             ; begin of source (84,85) to 502,503
                STA     $502
                LDA     $85
                STA     $503
                LDA     $86             ; end of source (86,87) to 504,505
                STA     $504
                LDA     $87
                STA     $505
                JSR     do504minus502_5 ; calc number of bytes and store in 506,507
                JSR     putput581       ; save data
                JMP     closechannel581 ; and close channel 1

;----------------------------------------------------------------------------

;               S u b r o u t i n e

do504minus502_5                        ; CODE XREF seg000AC6Fp command_loa+18p
                                        ; ...
                LDA     $504            ; (505,506) = (504|505)-(502|503)
                SEC     
                SBC     $502
                STA     $506
                LDA     $505
                SBC     $503
                STA     $507
                RTS     
; End of function do504misnus502_5


;----------------------------------------------------------------------------

;               S u b r o u t i n e

closechn_2                             ; CODE XREF waitinputline+9Dp
                LDA     #$20            ; set channel 2 and store in $581
                STA     $581
                LDA     #0              ; 0 signals that input is now from keyboard
                STA     $58C            ; store signal
; End of function closechn_2


;----------------------------------------------------------------------------

;               S u b r o u t i n e

closechannel581                        ; CODE XREF closechannel5+5p
                                        ; seg000AB64j ...
                LDX     $581            ; load channel number
                LDA     #$C             ; close command == $C
                STA     $342,X          ; store into ICCOM
                JMP     execciomain
; End of function closechannel581


;----------------------------------------------------------------------------

;               S u b r o u t i n e

putput581                              ; CODE XREF seg000AC72p seg000AE31p
                LDX     $581            ; load channel into X
                LDA     #0
                STA     $344,X          ; set buffer adress to 0x0500
                LDA     #5
                STA     $345,X
                LDA     #6
                STA     $348,X          ; set buffer length to 6
                LDA     #0
                STA     $349,X
                LDA     #$B             ; command = B =PUT
                STA     $342,X
                JSR     execciomain
                LDA     $502            ; setup the control block with
                STA     $344,X
                LDA     $503            ; data from the predec. block
                STA     $345,X
                LDA     $506
                STA     $348,X
                LDA     $507
                STA     $349,X
                LDA     #$B             ; and PUT again
                STA     $342,X
; End of function putput581


;----------------------------------------------------------------------------

;               S u b r o u t i n e

execciomain                            ; CODE XREF seg000AB35p seg000ABA8p
                                        ; ...
                JSR     $E456           ; jsr to CIOMAIN using JUMPTAB+6
                CPY     #0
                BMI     CIOMAINERROR    ; check for error (N=1)
                RTS     
;----------------------------------------------------------------------------

CIOMAINERROR                           ; CODE XREF execciomain+5j
                JMP     close_prn_error
; End of function execciomain


;----------------------------------------------------------------------------

;               S u b r o u t i n e

command_loa                            ; CODE XREF seg000AD95p
                LDA     #4              ; load source in bibo format
                LDX     #$10            ; channel 1
                JSR     closeandopen581
                JSR     initreadparams
                LDA     $500
                CMP     #'E'            ; check the magic E
                BNE     wrongfiletype
                LDA     $501
                CMP     #'R'            ; and magic R...b.t.w. greetings to E.R. -)
                BNE     wrongfiletype   ; header must start with 'E','R'
                JSR     do504minus502_5
                LDA     $86             ; low byte end of source code
                SEC     
                SBC     $506
                STA     $502
                LDA     $87             ; high byte end of source code
                SBC     $507
                STA     $503
                LDA     $502
                CMP     $80             ; init begin of symbol data ($80,$81)
                LDA     $503
                SBC     $81
                BCC     src_data_error
                LDA     $502
                STA     $84             ; init begin of source pointer ($84,$85)
                LDA     $503
                STA     $85
                JSR     readbin
                JMP     closechannel581
;----------------------------------------------------------------------------

wrongfiletype                          ; CODE XREF command_loa+Fj
                                        ; command_loa+16j
                LDY     #IDX_FILETYPEERR  ; file type error
                JMP     close_prn_error
;----------------------------------------------------------------------------

src_data_error                         ; CODE XREF command_loa+36j
                LDY     #IDX_SOURCEDATAERR ; source data error
                JMP     close_prn_error
; End of function command_loa


;----------------------------------------------------------------------------

;               S u b r o u t i n e

initreadparams                         ; CODE XREF command_loa+7p
                                        ; seg000ADB2p ...
                LDA     #0
                STA     $502
                LDA     #5
                STA     $503            ; input buffer address to $500
                LDA     #6
                STA     $506
                LDA     #0
                STA     $507            ; read 6 byte to handle .COM header ($FF,$FF,$beginlow,$beginhigh,$endlow,$endhigh)
; End of function initreadparams


;----------------------------------------------------------------------------

;               S u b r o u t i n e

readbin                                ; CODE XREF command_loa+42p
                                        ; seg000ADDEp
                LDX     $581            ; get channel
                LDA     $502            ; low byte start address
                STA     $344,X
                LDA     $503            ; high byte start address
                STA     $345,X
                LDA     $506            ; low byte number of bytes to read
                STA     $348,X
                LDA     $507            ; high byte number of bytes to read
                STA     $349,X
                LDA     #7              ; read
                STA     $342,X
                JMP     execciomain     ; and make it so -)
; End of function readbin

;----------------------------------------------------------------------------

pseudo_op_in                           ; check if bibo already in inc mode
                LDA     $5B0
                BNE     nestedincerr    ; if != 0 than nested inc error
                INC     $5B0            ; set mode to inc => 5b0 to 1
                LDA     $86             ; store src end 86,87 into 5ac,5ad
                STA     $5AC
                LDA     $87
                STA     $5AD
                LDA     #1
                STA     $592            ; bibo mode to inc>
                JSR     chg_editormode  ; switch bibo to inc mode ($592==1)
                LDA     $B9
                STA     $5AE
                LDA     $BA
                STA     $5AF
                JSR     command_loa     ; load .IN "Datei"
                JSR     chk_end_asm
                LDA     $84
                STA     $B9
                LDA     $85
                STA     $BA
                JMP     asm_loop2
;----------------------------------------------------------------------------

nestedincerr                           ; CODE XREF seg000AD74j
                LDY     #IDX_NESTEDINCUDE ; print "Nested include"
                JMP     mainerrorhndler ; and handle error
;----------------------------------------------------------------------------

command_blo                            ; binary load == blo
                LDA     #4
                LDX     #$10            ; channel 1
                JSR     closeandopen581 ; open
                JSR     initreadparams  ; set buffer address to $500 and num of bytes to read to 6 for COM header
                LDA     $500            ; load magic
                CMP     #$FF            ; must be $FF
                BNE     filetypeerror   ; error no COM file
                CMP     $501            ; and the second byte must also be $FF
                BNE     filetypeerror   ; error, no COM file!!
                LDA     #','            ; search for 1. param
                JSR     find_char_bf    ; search param
                BCS     noparamfound    ; param is not a must load a com file
                JSR     addr_frm_param  ; ok, param was provided by the user so use it -)
                JSR     calcnumofbytes  ; calc start address from param
                LDA     $B7
                STA     $502            ; replace lowbyte of start address com file
                LDA     $B8
                STA     $503            ; and also the high byte of the start address
                JMP     jmpreadbinary
;----------------------------------------------------------------------------

noparamfound                           ; CODE XREF seg000ADC6j
                JSR     calcnumofbytes  ; calc num of bytes to read

jmpreadbinary                          ; CODE XREF seg000ADD8j
                JSR     readbin         ; load binary file
                JMP     closechannel581 ; and close channel 1

;----------------------------------------------------------------------------

;               S u b r o u t i n e

calcnumofbytes                         ; CODE XREF seg000ADCBp seg000ADDBp
                                        ; ...
                JSR     do504minus502_5 ; num of bytes to write are in 506,507
                INC     $506            ; +1 byte
                BNE     noinc507        ; not necessary to handle 16 bit inc
                INC     $507            ; ok, than high byte + 1

noinc507                               ; CODE XREF calcnumofbytes+6j
                RTS     
; End of function calcnumofbytes

;----------------------------------------------------------------------------

filetypeerror                          ; CODE XREF seg000ADBAj seg000ADBFj
                                        ; ...
                LDY     #IDX_FILETYPEERR ; print "File type" error
                JMP     mainerrorhndler ; handle it
;----------------------------------------------------------------------------

command_bsa                            ; save (binary save)
                LDA     #8
                LDX     #$10            ; channel 1
                JSR     closeandopen581
                LDA     #$FF            ; load header magic $FF
                STA     $500            ; store $FF
                STA     $501            ; and $FF as .com header
                LDA     #','
                JSR     find_char_bf    ; load first param
                BCS     error_syntax    ; no or wrong param => error
                JSR     addr_frm_param  ; calc address from 1. param
                LDA     $B7
                STA     $502            ; store lowbyte start address
                LDA     $B8
                STA     $503            ; store high byte start address
                LDY     $C8             ; search goes on starting at old pos in input buffer
                LDA     #','
                JSR     find_char_again ; load second param
                BCS     error_syntax    ; no second param, than error
                JSR     addr_frm_param  ; calc end address of .com from param
                LDA     $B7
                STA     $504            ; store lowbyte of end address
                LDA     $B8
                STA     $505            ; store high byte of end address
                JSR     calcnumofbytes  ; calc number of bytes to write (stored in $506,$507)
                JSR     putput581       ; and write to file
                JMP     closechannel581 ; close channel 1
;----------------------------------------------------------------------------

error_syntax                           ; CODE XREF seg000AE09j seg000AE1Fj
                JMP     syntaxerror
;----------------------------------------------------------------------------

pseudo_op_df
                LDA     #4
                LDX     #$20            ; open channel 2
                JSR     closeandopen581
                JSR     initreadparams
                LDA     $500
                CMP     #$FF
                BNE     filetypeerror
                CMP     $501
                BNE     filetypeerror
                JSR     calcnumofbytes
                LDA     $C3
                BNE     loc_FFFFF6C0_AE83
                JSR     print_or_ta
                LDA     $506
                CLC     
                ADC     $BB
                STA     $BB
                LDA     $507
                ADC     $BC
                STA     $BC
                LDA     $B3
                CLC     
                ADC     $506
                STA     $B3
                LDA     $B4
                ADC     $507
                STA     $B4

close_channel_2                        ; CODE XREF seg000AEBCj
                LDX     #$20            ; channel 2
                STX     $581
                JSR     closechannel581
                JMP     next_src_line
;----------------------------------------------------------------------------

loc_FFFFF6C0_AE83                      ; CODE XREF seg000AE55j
                LDA     $506
                STA     $508
                LDA     $507
                STA     $509

loc_FFFFF6C0_AE8F                      ; CODE XREF seg000AEBAj
                LDX     #$20
                STX     $581
                LDA     #7
                STA     $342,X
                LDA     #0
                STA     $348,X
                STA     $349,X
                JSR     execciomain
                LDX     #0
                JSR     store_obj_val
                LDA     $508
                BNE     loc_FFFFF6C0_AEB1
                DEC     $509

loc_FFFFF6C0_AEB1                      ; CODE XREF seg000AEACj
                DEC     $508
                LDA     $508
                ORA     $509
                BNE     loc_FFFFF6C0_AE8F
                JMP     close_channel_2

;----------------------------------------------------------------------------

;               S u b r o u t i n e

waitinputline                          ; CODE XREF seg0009583p seg000B352p
                LDA     #0
                STA     $C7             ; set length of command == 0
                STA     $400            ; clear first byte in buffer
                STA     $2FE            ; DISPLYFLG=0; control seq. will be used
                CLI     
                LDA     $58C            ; check if input comes from keyboard (==0)or other device with channel 2(==$FF)
                BNE     getchars        ; $FF => read data from channel 2 (see command_ent)
                BIT     $58F
                BPL     nokeypressed    ; bit 7 is zero
                LDA     #$2C            ; tab key
                STA     $2FC            ; KBCODE, key which was pressed
                BNE     tabkeypressed

nokeypressed                           ; CODE XREF waitinputline+13j
                                        ; waitinputline+25j
                LDA     $11             ; check if BRKKEY was pressed
                BEQ     breakwaspressed ; if z=0 => BRKKEY was pressed
                LDA     $2FC            ; load last pressed keycode
                CMP     #$FF
                BEQ     nokeypressed
                CMP     #$2C            ; tab key pressed
                BNE     notabpressed

tabkeypressed                          ; CODE XREF waitinputline+1Aj
                LDA     $592            ; status of bibo
                CMP     #3              ; 3==monitor, 0==assembler
                BEQ     notabpressed    ; in monitor no special tab key routine necessary
                LDA     $5F9            ; current line number($5f9,$5fA)
                CLC     
                ADC     $5FB            ; line number increment
                STA     $9E
                LDA     $5FA            ; current line number high byte
                ADC     #0
                STA     $9F
                JSR     print_line_no   ; print line no in editor
                JSR     cursoronup      ; set curor behind line number

notabpressed                           ; CODE XREF waitinputline+29j
                                        ; waitinputline+30j ...
                JSR     getbytestatus_e
                LDY     $C7
                LDA     $2FB            ; load ATASCII of last pressed key
                CMP     #$20            ; check for space
                BNE     nospace
                CPY     #0
                BEQ     notabpressed

nospace                                ; CODE XREF waitinputline+52j
                STA     $400,Y          ; load char from buffer
                INC     $C7             ; increase pos counter
                CMP     #$9B            ; chk for new line
                BNE     notabpressed    ; no new line than branch
                LDA     #0              ; clear new  line in
                STA     $400,Y          ; 0x400,Y the input buffer
                DEC     $C7             ; correct the length
                BEQ     cmdlength_zero
                RTS     
;----------------------------------------------------------------------------

breakwaspressed                        ; CODE XREF waitinputline+1Ej
                SEC     
                ROR     $11             ; set bit 7 of IRQST
                JMP     printnewline
;----------------------------------------------------------------------------

cmdlength_zero                         ; CODE XREF waitinputline+68j
                STA     $58F            ; set autoline # to off == 0
                RTS     
;----------------------------------------------------------------------------

getchars                               ; CODE XREF waitinputline+Ej
                LDX     #$20            ; using chanel 2
                LDA     #0
                STA     $344,X          ; set buffer adress to 0x400
                LDA     #4
                STA     $345,X
                LDA     #$7F
                STA     $348,X          ; set buffer length to 0x7f
                LDA     #0
                STA     $349,X
                LDA     #5              ; command 5 == input
                STA     $342,X          ; into ICCOM
                JSR     $E456           ; call CIOMAIN using JMPTABLE+6
                BPL     noerrorinputch2 ; no error N=0 then go to ?
                CPY     #$89            ; an error occured(read line was TRUNCATED)
                BEQ     noerrorinputch2 ; error #$89 then
                CPY     #$88            ; EOF_ERROR
                BNE     not88or89       ; if it not $88 then
                JSR     closechn_2      ; close channel 2
                JMP     prnmsg_setcolor ; print current prompt
;----------------------------------------------------------------------------

not88or89                              ; CODE XREF waitinputline+9Bj
                JMP     close_prn_error
;----------------------------------------------------------------------------

noerrorinputch2                        ; CODE XREF waitinputline+93j
                                        ; waitinputline+97j
                LDX     #$20            ; channel 2
                LDY     $348,X          ; load buffer length in Y
                DEY     
                LDA     #0
                STA     $400,Y          ; clear last char of command in buffer (set to 0)
                STY     $C7             ; store length of command
                LDY     #0              ; get rid of the inverted cursor at the end of the line
                LDA     ($5E),Y         ; load first char of internal input buffer
                EOR     #$80            ; invert bit 7 (Cursor==$80 => stored as $00)
                STA     ($5E),Y         ; and store the inverted byte
                RTS                     ; $5E == OLDGRADR
; End of function waitinputline


;----------------------------------------------------------------------------

;               S u b r o u t i n e

printbibomsg                           ; CODE XREF seg0009553p seg00096FCp
                                        ; ...
                TXA                     ; prints bibo messages using the jumptable $b0fe
                ASL     @               ; accu mult 2 (by init => 4*2=8
                TAX     
                LDA     begin_of_msg_ptrs,X ; (8=> ptr to jmptbl to copyright msg
                STA     $92
                LDA     begin_of_msg_ptrs+1,X         ; save ptr in 92,93
                STA     $93
                LDY     #0

loop3                                  ; CODE XREF printbibomsg+17j
                LDA     ($92),Y         ; load char into accu
                BEQ     return1         ; is end of string reached =>\0
                JSR     print           ; no, than print the text to screen
                INY                     ; next char
                BNE     loop3           ; if accu !=0 carry on printing

return1                                ; CODE XREF printbibomsg+11j
                RTS     
; End of function printbibomsg


;----------------------------------------------------------------------------

;               S u b r o u t i n e

printspaceloop                         ; CODE XREF chk_end_asm+Ep
                                        ; printspaceloop+4j
                JSR     printspace
                DEX     
                BNE     printspaceloop
                RTS     
; End of function printspaceloop


;----------------------------------------------------------------------------

;               S u b r o u t i n e

cursoronup                             ; CODE XREF waitinputline+45p
                LDA     #$1C            ; move cursor one line up on screen
                JSR     print
; End of function cursoronup


printnewline                           ; CODE XREF seg0009712j print_src_linep
                                        ; ...
                LDA     #$9B            ; load new line
;----------------------------------------------------------------------------
                dta  $2C ; ,          ; there is no bit -)..just aehm ...lets say tricky programming -) After lda #$9b newline the next opcode bit opcode uses 3 bytes(2c a9 20) and so lda #$20 (a9 20) from printspace will be skipped!!!!
;----------------------------------------------------------------------------

printspace                             ; CODE XREF seg0009FF0p seg000A03Fp
                                        ; ...
                LDA     #' '            ; load space (will be skipped if printnewline is called!)

;----------------------------------------------------------------------------

;               S u b r o u t i n e

print                                  ; CODE XREF printsrcline+21p
                                        ; printminus+2j ...
                STA     $BF             ; store char to print into $BF
                LDA     $58B
                BMI     loc_FFFFF6C0_AFDE
                STY     $5FF            ; store x and y register
                STX     $5FE
                BMI     loc_FFFFF6C0_AFDE
                LDA     $11             ; load BRKKEY
                BEQ     breakpressed    ; if pressed abort
                LDA     $11             ; load BRKKEY
                BEQ     breakpressed    ; if pressed(BRKKEY=0) abort
                LDA     $BF
                JSR     getputstatus_ed
                LDA     $58A
                BPL     loc_FFFFF6C0_AFCA
                JSR     chkchar_print

loc_FFFFF6C0_AFCA                      ; CODE XREF print+1Fj
                LDA     $BF             ; restore char see print
                LDX     $5FE            ; restore x and y register
                LDY     $5FF
                RTS     
;----------------------------------------------------------------------------

breakpressed                           ; CODE XREF print+11j print+15j
                LDX     #$FF
                TXS                     ; empty the stack
                STX     $11             ; clear BRKKEY
                JSR     closeallchannel
                JMP     initassembler2
;----------------------------------------------------------------------------

loc_FFFFF6C0_AFDE                      ; CODE XREF print+5j print+Dj
                LDA     #$40            ; channel 4
                STA     $581
                LDY     #0
                LDA     ($5E),Y
                EOR     #$80
                STA     ($5E),Y
                LDA     $BF
                JMP     putchar
; End of function print


;----------------------------------------------------------------------------

;               S u b r o u t i n e

chkchar_print                          ; CODE XREF print+21p
                LDA     #'0'
                STA     $581
                LDA     $BF             ; load char to print into accu
                CMP     #$9B            ; EOL?
                BEQ     return2         ; yes, jump to
                CMP     #$80            ; is it an inverted char?
                BCC     chk_if_legal_ch ; no
                AND     #$7F            ; yes, than mask out the 7th bit

chk_if_legal_ch                        ; CODE XREF chkchar_print+Dj
                CMP     #' '
                BCS     return2         ; is the char a space or greater
                LDA     #' '            ; no, illegal->load with #$20

return2                                ; CODE XREF chkchar_print+9j
                                        ; chkchar_print+13j
                JMP     putchar         ; print char to screen
; End of function chkchar_print


;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_B00A                      ; CODE XREF seg000B0EEp
                LDA     #$FD
; End of function sub_FFFFF6C0_B00A


;----------------------------------------------------------------------------

;               S u b r o u t i n e

getputstatus_ed                        ; CODE XREF print+19p
                TAX     
                LDA     $E407           ; put status word from editor (E)
                PHA     
                LDA     $E406
                PHA     
                TXA     
                RTS     
; End of function getputstatus_ed


;----------------------------------------------------------------------------

;               S u b r o u t i n e

getbytestatus_e                        ; CODE XREF waitinputline+48p
                LDA     $E405           ; get byte status from screen editor (E)
                PHA     
                LDA     $E404
                PHA     
                RTS     
; End of function getbytestatus_e


;----------------------------------------------------------------------------

;               S u b r o u t i n e

getbytestatus_k                        ; CODE XREF seg0009F95p
                LDA     $E425           ; getbytestatus from keyboard (K)
                PHA     
                LDA     $E424
                PHA     
                RTS     
; End of function getbytestatus_k


;----------------------------------------------------------------------------

;               S u b r o u t i n e

print_line_no                          ; CODE XREF seg000970Fp printsrcline+16p
                                        ; ...
                LDX     #4              ; 5 digits for the line number...00000
; End of function print_line_no


;----------------------------------------------------------------------------

;               S u b r o u t i n e

line_no_loop                           ; CODE XREF seg000A063p line_no_loop+21j
                                        ; ...
                LDA     #$30            ; load ASCII 0

addloop                                ; CODE XREF line_no_loop+19j
                PHA     
                SEC     
                LDA     $9E             ; load line number low byte
                SBC     linenotable,X
                PHA     
                LDA     $9F             ; load line number high byte
                SBC     linenotable2,X
                BCC     valuelower      ; no carry left
                STA     $9F             ; else store rest
                PLA     
                STA     $9E
                PLA     
                ADC     #0              ; add carry to ascii ($3X+carry)
                BNE     addloop         ; another inc on this pos necessary?

valuelower                             ; CODE XREF line_no_loop+Fj
                PLA     
                PLA                     ; load ascii from stack
                JSR     print           ; print ASCII digit on screen
                DEX                     ; 5 digits (0..4) to print for a complete line number
                BPL     line_no_loop    ; if X >$FF loop for another digit
                RTS     
; End of function line_no_loop

;----------------------------------------------------------------------------
linenotable     dta    1 ;            ; low byte 0 - table for print_line_no
                dta   $A ;            ; low byte 1
                dta  $64 ; d          ; low byte 2
                dta  $E8 ; è          ; lowbyte 3
                dta  $10 ;            ; low byte 4
linenotable2    dta    0 ;            ; high byte 0 => 0001
                dta    0 ;            ; high byte 1 => 000a => 10
                dta 0                 ; high byte 2 => 0064 => 100
                dta    3 ;            ; high byte 3 => 03e8 => 1000
                dta  $27 ; '          ; high byte 4 => 2710 => 10000

;----------------------------------------------------------------------------

;               S u b r o u t i n e

to_hexstring                           ; CODE XREF seg0009707p seg0009B59p
                                        ; ...
                TYA                     ; transfere high byte into accu
                JSR     tostring
                TXA                     ; transfere low byte to accu
; End of function to_hexstring


;----------------------------------------------------------------------------

;               S u b r o u t i n e

tostring                               ; CODE XREF seg000A078p seg000A07Cp
                                        ; ...
                PHA                     ; save value on stack
                LSR     @               ; shift high nibble to lower 4 bits
                LSR     @               ; e.g. 00010000 => 00000001
                LSR     @
                LSR     @
                JSR     nibble2ascii
                PLA                     ; restore accu
                AND     #$F             ; mask out high nibble
; End of function tostring


;----------------------------------------------------------------------------

;               S u b r o u t i n e

nibble2ascii                           ; CODE XREF tostring+5p
                CMP     #$A             ; <10? then
                BCC     isdigit
                ADC     #6              ; else ASCII A..F

isdigit                                ; CODE XREF nibble2ascii+2j
                ADC     #$30            ; convert to ASCII (e.g 0x30==0, 0x31==1..
                JMP     print           ; print char to screen
; End of function nibble2ascii


;----------------------------------------------------------------------------

;               S u b r o u t i n e

prnmsg_setcolor                        ; CODE XREF seg0009580p waitinputline+A0j
                                        ; ...
                JSR     printnewline
                LDX     $592            ; load current mode in x(0=ass..)
                JSR     printbibomsg
                
                ift     CONF_SETCOLOR
                  LDA     #$90            ; set colors
                els
                  nop                     ; color reset disabled
                  rts                     ; "
                eif
                 
                STA     $2C6            ; set COLPF2
                LDA     #$10
                STA     $2C8            ; set COLBKG
                RTS     
; End of function prnmsg_setcolor


;----------------------------------------------------------------------------

;               S u b r o u t i n e

closeallchannel                        ; CODE XREF seg0009561p copy_af_2_ad+4Aj
                                        ; ...
                LDY     #7              ; max num of channels is 8

loop5                                  ; CODE XREF closeallchannel+12j
                TYA                     ; copy y to accu
                ASL     @               ; shift in the upper nibble
                ASL     @
                ASL     @
                ASL     @
                STA     $581            ; store the current channel #
                STY     $BF             ; store the orignal channel number (y)
                JSR     closechannel581
                LDY     $BF
                DEY     
                BNE     loop5           ; loop closes all 8 channels
                LDA     #0
                STA     $58B
                STA     $58C            ; set to 0 => input from keyboard (see command_ent)
                STA     $58A
                RTS     
; End of function closeallchannel

;----------------------------------------------------------------------------

close_prn_error                        ; CODE XREF execciomain+8j
                                        ; command_loa+4Aj ...
                TYA                     ; close channel and print error message
                PHA     
                JSR     closeallchannel
                PLA     
                TAY     

;----------------------------------------------------------------------------
mainerrorhndler                        ; CODE XREF seg00095B9j seg00095D6j
                                        ; ...
                TYA                     ; error msg index to accu
                PHA                     ; store on stack
                JSR     closeallchannel
                JSR     printnewline
                LDX     #5
                JSR     printbibomsg    ; print "*** "  on screen (begin or error string)
                PLA                     ; get error msg back from stack
                PHA                     ; and store it again
                STA     $9E             ; save error index
                TAX     
                CPX     #$80
                BCS     ioerror
                JSR     printbibomsg    ; print detail error msg (indx in x)

ioerror                                ; CODE XREF seg000B0C3j
                LDA     #0
                STA     $9F
                PLA                     ; get error index from stack
                CMP     #$80
                BCC     loc_FFFFF6C0_B0E9
                LDX     #$E
                JSR     printbibomsg    ; print "I/O - ERROR #" on screen
                LDX     #2
                JSR     line_no_loop
                JSR     printspace
                LDX     #5
                JSR     printbibomsg    ; print only "*** " (end of error string)
                JSR     printnewline    ; on screen
                JMP     loc_FFFFF6C0_B0EE
;----------------------------------------------------------------------------

loc_FFFFF6C0_B0E9                      ; CODE XREF seg000B0CFj
                LDX     #6
                JSR     printbibomsg    ; print " ERROR ***" on screen

loc_FFFFF6C0_B0EE                      ; CODE XREF seg000B0E6j
                JSR     sub_FFFFF6C0_B00A
                LDA     $C3
                BMI     clearstackinit
                JSR     sub_FFFFF6C0_A4D1

clearstackinit                         ; CODE XREF seg000B0F3j
                LDX     #$FF            ; clear stack
                TXS     
                JMP     initassembler2
;----------------------------------------------------------------------------
; begin of pointers to the text base 
begin_of_msg_ptrs
ptr_edit_promt dta a(aEditI) ;a($B146)             ; Text Pointers (e.g. Copyright..)
ptr_inc_prompt dta a(aIncI) ;a($B14D)
ptr_ed2_prompt dta a(aEd_2I) ;a($B153)
ptr_mon_prompt dta a(aMonI) ;a($B15A)
ptr_copyright_t dta a(aBiboAssemblerV) ;a($B160)
ptr_error_msg  dta a(aCompleteError) ;a($B1A5)
ptr_err2_msg   dta a(aErrorI) ;a($B1AA)
ptr_syntax_msg dta a(aSyntax) ;a($B1B6)
ptr_memory_full dta a(aMemoryFull) ;a($B1BD)
ptr_src_data   dta a(aSourceData) ; a($B1C9)
ptr_symb_data  dta a(aSymbolData) ;a($B1D8)
ptr_ed2_inuse  dta a(aEd2AlreadyUsed) ;a($B1E7)
ptr_cant_merge dta a(aCanTMerge) ;a($B1F8)
ptr_out_of_rang dta a(aOutOfRange) ;a($B204)
ptr_ioerror    dta a(aIOError) ;a($B211)
ptr_filetype   dta a(aFileType) ;a($B21F)
ptr_badaddress dta a(aBadAddress) ;a($B229)
ptr_undeflabel dta a(aUndefinedLabel) ;a($B235)
ptr_hex        dta a(aHex) ;a($B245)
ptr_dec        dta a(aDec) ;a($B24B)
ptr_badllabel  dta a(aBadLocalLabel) ;a($B253)
ptr_symtable   dta a(aSymbolTableII) ;a($B263)
ptr_badinstrc  dta a(aBadInstruction) ;a($B282)
ptr_badlabel   dta a(aBadLabel) ;a($B292)
ptr_duplabel   dta a(aDuplicateLabel) ;a($B29C)
ptr_localofrang dta a(aLocalOutOfRang) ;a($B2AC)
ptr_brntoolong dta a(aBranchTooLong) ;a($B2BF)
ptr_memstorage dta a(aMemoryStorage) ;a($B2CF)
ptr_badadr     dta a(aBadAddress) ;a($B229)
ptr_pass1      dta a(aPass1i) ;a($B2DE)
ptr_pass2      dta a(aIpass2i) ;a($B2E7)
ptr_labelnotfou dta a(aLabelNotFound) ;a($B2F1)
ptr_nestedincl dta a(aNestedInclude) ;a($B301)
ptr_break      dta a(aBreakI) ;a($B31E)
ptr_asm_stopped dta a(aIasmStoppedi) ;a($B310)
ptr_break2     dta a(aBreakI) ;a($B31E)
;
; begin of text base of the assembler
;
aEditI         dta c'Edit>',$9B,0
aIncI          dta c'Inc>',$9B,0
aEd_2I         dta c'Ed.2>',$9B,0
aMonI          dta c'Mon>',$9B,0
aBiboAssemblerV dta c'}* BIBO-ASS #003 02 Mar 13 *',$9B
                 dta c'* (c) 1986 E.Reuss / CS   *',$9B
                 dta c'*        ABBUC 2013       *',$9B
                dta $9B,0
aCompleteError dta c'*** ',0
aErrorI        dta c' Error ***',$9B,0
aSyntax        dta c'Syntax',0
aMemoryFull    dta c'Memory full',0
aSourceData    dta $9B,c'Source Data: ',0
aSymbolData    dta $9B,c'Symbol Data: ',0
aEd2AlreadyUsed dta c'ED2 already used',0
aCanTMerge     dta c'Can',$27,c't merge',0
aOutOfRange    dta c'Out of range',0
aIOError       dta c'I/O - Error #',0
aFileType      dta c'File type',0
aBadAddress    dta c'Bad address',0
aUndefinedLabel dta c'Undefined label',0
aHex           dta c'HEX=$',0
                dta  $20 ;  
                dta  $20 ;  
                dta  $20 ;  
aDec           dta c'DEC=',0
aBadLocalLabel dta c'Bad local label',0
aSymbolTableII  dta  $9B ; 
                dta  $9B ;
                dta c'Symbol table:',$9B
                dta c'-------------',$9B,0
aBadInstruction dta c'Bad instruction',0
aBadLabel      dta c'Bad label',0
aDuplicateLabel dta c'Duplicate label',0
aLocalOutOfRang dta c'Local out of range',0
aBranchTooLong dta c'Branch too long',0
aMemoryStorage dta c'Memory storage',0
aPass1i        dta c'Pass: 1',$9B,0
aIpass2i       dta $9B,c'Pass: 2',$9B,0
aLabelNotFound dta c'Label not found',0
aNestedInclude dta c'Nested include',0
aIasmStoppedi  dta $9B
                dta c'ASM stopped',$9B,0
aBreakI        dta c'*** BREAK ***',$9B
                dta $FD
                dta    0 ;  
;----------------------------------------------------------------------------

command_mon
                LDA     $592
                STA     $591            ; save status in 591
                LDA     #3
                STA     $592            ; set monitor (==3)
                TSX                     ; save status reg. in X
                STX     $598            ; and store in $598

initass_or_mon                         ; CODE XREF seg000957Dj seg000B386j
                                        ; ...
                LDA     $592            ; BiboAss status (0=assembler,..)
                CMP     #3              ; 3==monitor, 0==assembler
                BEQ     initmonitor     ; ok, it is the monitor
                JMP     initassembler2  ; no assembler or inc> or...
;----------------------------------------------------------------------------

initmonitor                            ; CODE XREF seg000B342j
                LDX     $598            ; Main Entry in monitor mode
                TXS     
                LDA     #1
                STA     $52             ; LMARGN is set to 1
                JSR     prnmsg_setcolor

waitformon_cmd                         ; CODE XREF seg000B357j seg000B3F1j
                                        ; ...
                JSR     waitinputline
                LDA     $C7
                BEQ     waitformon_cmd
                LDA     #$9B            ; save newline in input buffer
                STA     $400,Y
                JSR     set_mon_cmd_2_0 ; set $C4 and Y register to 0

monmainloop                            ; CODE XREF seg000B37Ej
                JSR     mon_read_inp
                STY     $C8
                STA     0
                LDY     #$16

cmp_mon_command                        ; CODE XREF seg000B377j
                DEY     
                BMI     print_ctrl_1
                LDA     mon_cmds,Y         ; load monitor command
                EOR     #$30
                CLC     
                ADC     #$89
                CMP     0
                BNE     cmp_mon_command    ; if no mon_cmd check again
                JSR     mon_cmd_stack      
                LDY     $C8
                JMP     monmainloop
;----------------------------------------------------------------------------

print_ctrl_1                           ; CODE XREF seg000B36Bj
                LDA     #$FD            ; print CTRL+1
                JSR     print
                JMP     initass_or_mon

;----------------------------------------------------------------------------

;               S u b r o u t i n e

mon_cmd_stack                          ; CODE XREF seg000B379p
                TYA     
                ASL     @               ; * 2
                TAY                     ; use as index
                LDA     mon_jmp_table+1,Y         ; load highbyte pointer to routine
                PHA                     ; push to stack
                LDA     mon_jmp_table,Y         ; load lowbyte of routine
                PHA                     ; and push to stack
                LDA     $C4             ; load accu with command
; End of function mon_cmd_stack


;----------------------------------------------------------------------------

;               S u b r o u t i n e

set_mon_cmd_2_0                        ; CODE XREF seg000B35Ep
                LDY     #0              ; clear Y
                STY     $C4             ; set 0 to monitor command
                RTS                     ; jump to monitor command placed on stack
; End of function set_mon_cmd_2_0

;----------------------------------------------------------------------------
mon_cmds        dta  $3A ;           ; BEGIN OF MONITOR COMMANDS   - write into memory
                dta  $3B ; ;          ; ; - write into memory
                dta  $2E ; .          ; . - list memory
                dta  $2B ; +          ; + - compute hex + hex
                dta  $2D ; -          ; - - compute hex - hex
                dta  $2C ; ,          ; , - list memory
                dta  $3C ; <          ; mmh, not described in manual
                dta  $3E ; >          ; > - search HEX, ASCII, ATASCII
                dta  $3F ; ?          ; ? - show registers
                dta  $3D ; =          ; = - fill memory
                dta  $22 ; "          ; " - ASCII code
                dta  $47 ; G          ; G - goto ..start program
                dta  $4C ; L          ; L - disassemble
                dta  $4D ; M          ; M - move memory
                dta  $51 ; Q          ; Q - quit to editor
                dta  $52 ; R          ; R - read sector
                dta  $53 ; S          ; S - single step
                dta  $54 ; T          ; T - trace program
                dta  $56 ; V          ; V - compare mem
                dta  $57 ; W          ; W - write sector
                dta  $20 ;            ; space
                dta  $9B ; ›          ; new line
mon_jmp_table   
;                dta a($B457)             ; ptr write mem
                dta a(writemem-1)
;                dta a($B457)             ; ptr write mem
                dta a(writemem-1)
;                dta a($B457)             ; ptr list memory
                 dta a(writemem-1)
;               dta a($B457)             ; ptr +
                dta a(writemem-1)
;                dta a($B457)             ; ptr -
                dta a(writemem-1)
;                dta a($B45F)             ; ptr ,
                dta a(mon_cmd_comma-1)
;                dta a($B4F6)             ; ptr <
                dta a(mon_undocumented_cmd-1)
;                dta a($B54A)             ; ptr >
                dta a(mon_cmd_search-1)
;                dta a($B5D7)             ; ptr ?
                dta a(mon_cmd_print_register-1)
;                dta a($B500)             ; ptr =
                dta a(mon_cmd_fillmem-1)
;                dta a($B532)             ; ptr "
                dta a(mon_cmd_ascii-1)
;                dta a($B64F)             ; ptr G
                dta a(mon_cmd_go-1)
;                dta a($B7EA)             ; ptr L
                dta a(mon_cmd_l-1)
;                dta a($B4EC)             ; ptr M
                dta a(mon_cmd_move-1)
;                dta a($B3DC)             ; ptr Q
                dta a(mon_cmd_quit-1)
;                dta a($B6E2)             ; ptr R
                dta a(mon_cmd_readsector-1)
;                dta a($BA82)             ; ptr S
                dta a(mon_cmd_singlestep-1)                
;                dta a($BA61)             ; ptr T
                dta a(mon_cmd_trace-1)
;                dta a($B50A)             ; ptr V
                dta a(mon_cmd_comparemem-1)
;                dta a($B6DF)             ; ptr W
                dta a(mon_cmd_writesector-1)
;                dta a($B402)             ; ptr space
                dta a(mon_cmd_space-1)
;                dta a($B3E5)             ; ptr new line
                dta a(mon_cmd_newline-1)
;----------------------------------------------------------------------------
mon_cmd_quit
                LDA     $591
                STA     $592
                JMP     initassembler2
;----------------------------------------------------------------------------
mon_cmd_newline 
                JSR     sub_FFFFF6C0_B3FE
                PLA     
                PLA     
                LDA     $C4
                CMP     #$3A
                BNE     loc_FFFFF6C0_B3F4

loc_FFFFF6C0_B3F1                      ; CODE XREF seg000B3F6j
                JMP     waitformon_cmd
;----------------------------------------------------------------------------

loc_FFFFF6C0_B3F4                      ; CODE XREF seg000B3EFj
                CMP     #$3B
                BEQ     loc_FFFFF6C0_B3F1
                JSR     printnewline
                JMP     waitformon_cmd

;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_B3FE                      ; CODE XREF seg000B3E6p
                DEC     $C8
                BNE     mon_cmd_space
                RTS     
;----------------------------------------------------------------------------

mon_cmd_space                      ; CODE XREF sub_FFFFF6C0_B3FE+2j
                DEX     
                BNE     save_mon_cmd_c4
                CMP     #$3A
                BEQ     loc_FFFFF6C0_B40E
                CMP     #$3B
                BNE     loc_FFFFF6C0_B424

loc_FFFFF6C0_B40E                      ; CODE XREF sub_FFFFF6C0_B3FE+Aj
                STA     $C4
                LDA     $8C
                STA     ($8E),Y
                INC     $8E
                BNE     loc_FFFFF6C0_B41A
                INC     $8F

loc_FFFFF6C0_B41A                      ; CODE XREF sub_FFFFF6C0_B3FE+18j
                LDY     $C8
                LDA     $400,Y
                CMP     #$20
                BEQ     mon_cmd_newline
                RTS     
;----------------------------------------------------------------------------

loc_FFFFF6C0_B424                      ; CODE XREF sub_FFFFF6C0_B3FE+Ej
                LSR     @
                BCC     loc_FFFFF6C0_B47A
                LSR     @
                LSR     @
                LDA     $8A
                BCC     loc_FFFFF6C0_B437
                SBC     $8C
                PHA     
                LDA     $8B
                SBC     $8D
                JMP     loc_FFFFF6C0_B43E
;----------------------------------------------------------------------------

loc_FFFFF6C0_B437                      ; CODE XREF sub_FFFFF6C0_B3FE+2Dj
                ADC     $8C
                PHA     
                LDA     $8B
                ADC     $8D

loc_FFFFF6C0_B43E                      ; CODE XREF sub_FFFFF6C0_B3FE+36j
                TAY     
                JSR     sub_FFFFF6C0_B447
                PLA     
                TAX     
                JMP     loc_FFFFF6C0_B8EF
; End of function sub_FFFFF6C0_B3FE


;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_B447                      ; CODE XREF sub_FFFFF6C0_B3FE+41p
                LDA     $52
                CLC     
                ADC     $C7
                STA     $55
                LDA     #$1C            ; move cursor one line up
                JSR     print
                LDA     #$3D            ; and print "="
                JMP     print
; End of function sub_FFFFF6C0_B447

;----------------------------------------------------------------------------

writemem                               ; load index Y to command ($3ff+Y)
                LDY     $C8
                LDA     $3FF,Y          ; load command

save_mon_cmd_c4                        ; CODE XREF sub_FFFFF6C0_B3FE+6j
                STA     $C4             ; store command in $C4
                RTS     
;----------------------------------------------------------------------------
mon_cmd_comma   LDA     $8A
                CLC     
                ADC     #$7F
                STA     $8C
                LDA     $8B
                ADC     #0
                STA     $8D
                JMP     loc_FFFFF6C0_B47A
;----------------------------------------------------------------------------
                LDA     $8A
                ORA     #7
                STA     $8C
                LDA     $8B
                STA     $8D

loc_FFFFF6C0_B47A                      ; CODE XREF sub_FFFFF6C0_B3FE+27j
                                        ; seg000B46Dj ...
                JSR     sub_FFFFF6C0_B4C7
                LDA     #0
                STA     $A6

loc_FFFFF6C0_B481                      ; CODE XREF seg000B49Dj
                LDY     #0
                LDA     ($8A),Y
                LDX     $A6
                STA     $480,X
                INC     $A6
                JSR     tostring
                LDA     #' '
                JSR     print
                JSR     sub_FFFFF6C0_B4DE
                BCS     sub_FFFFF6C0_B4A5
                LDA     $8A
                AND     #7
                BNE     loc_FFFFF6C0_B481
                JSR     sub_FFFFF6C0_B4A5
                JMP     loc_FFFFF6C0_B47A

;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_B4A5                      ; CODE XREF seg000B497j seg000B49Fp
                                        ; ...
                LDA     #$1F
                STA     $55
                STA     $291
                LDX     #0

loc_FFFFF6C0_B4AE                      ; CODE XREF sub_FFFFF6C0_B4A5+1Fj
                CPX     $A6
                BEQ     locret_FFFFF6C0_B4C6
                LDA     #$1B
                JSR     print
                LDA     $480,X
                CMP     #$9B
                BNE     loc_FFFFF6C0_B4C0
                LDA     #$1B            ; print ESC

loc_FFFFF6C0_B4C0                      ; CODE XREF sub_FFFFF6C0_B4A5+17j
                JSR     print
                INX     
                BNE     loc_FFFFF6C0_B4AE

locret_FFFFF6C0_B4C6                   ; CODE XREF sub_FFFFF6C0_B4A5+Bj
                RTS     
; End of function sub_FFFFF6C0_B4A5


;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_B4C7                      ; CODE XREF seg000B47Ap seg000B511p
                                        ; ...
                JSR     printnewline
                LDX     $8A
                LDA     $8B
                JSR     mon_print_a_x
                LDY     #0
                LDA     #':'
                JMP     print
; End of function sub_FFFFF6C0_B4C7


;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_B4D8                      ; CODE XREF seg000B4F1p seg000B52Dp
                INC     $90
                BNE     sub_FFFFF6C0_B4DE
                INC     $91
; End of function sub_FFFFF6C0_B4D8


;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_B4DE                      ; CODE XREF seg000B494p sub_FFFFF6C0_B4D8+2j
                                        ; ...
                LDA     $8A
                CMP     $8C
                LDA     $8B
                SBC     $8D
                INC     $8A
                BNE     locret_FFFFF6C0_B4EC
                INC     $8B

locret_FFFFF6C0_B4EC                   ; CODE XREF sub_FFFFF6C0_B4DE+Aj
                RTS     
; End of function sub_FFFFF6C0_B4DE

;----------------------------------------------------------------------------

mon_cmd_move                      ; CODE XREF seg000B4F4j
                LDA     ($8A),Y

loc_FFFFF6C0_B4EF                      ; CODE XREF seg000B4ED^
                STA     ($90),Y
                JSR     sub_FFFFF6C0_B4D8
                BCC     mon_cmd_move
                RTS     

;----------------------------------------------------------------------------

;               S u b r o u t i n e

mon_undocumented_cmd                      ; CODE XREF seg000B54Bp
                LDX     #1

loc_FFFFF6C0_B4F9                      ; CODE XREF sub_FFFFF6C0_B4F7+7j
                LDA     $8C,X
                STA     $90,X
                DEX     
                BPL     loc_FFFFF6C0_B4F9
                RTS     
; End of function sub_FFFFF6C0_B4F7

;----------------------------------------------------------------------------

mon_cmd_fillmem                      ; CODE XREF seg000B508j
                LDA     $90
                STA     ($8A),Y
                JSR     sub_FFFFF6C0_B4DE
                BCC     mon_cmd_fillmem
                RTS     
;----------------------------------------------------------------------------

mon_cmd_comparemem                      ; CODE XREF seg000B530j
                LDA     ($8A),Y
                CMP     ($90),Y
                BEQ     loc_FFFFF6C0_B52D
                JSR     sub_FFFFF6C0_B4C7
                LDA     ($8A),Y
                JSR     tostring
                LDA     #' '
                JSR     print
                LDA     #'('
                JSR     print
                LDA     ($90),Y
                JSR     tostring
                LDA     #')'
                JSR     print

loc_FFFFF6C0_B52D                      ; CODE XREF seg000B50Fj
                JSR     sub_FFFFF6C0_B4D8
                BCC     mon_cmd_comparemem
                RTS     
;----------------------------------------------------------------------------
mon_cmd_ascii 
                LDA     #0
                STA     $BF

loc_FFFFF6C0_B537                      ; CODE XREF seg000B548j
                LDY     $C8
                LDA     $400,Y
                CMP     #$9B
                BEQ     locret_FFFFF6C0_B54A
                LDY     $BF
                STA     ($8A),Y
                INC     $BF
                INC     $C8
                BNE     loc_FFFFF6C0_B537

locret_FFFFF6C0_B54A                   ; CODE XREF seg000B53Ej
                RTS     
;----------------------------------------------------------------------------
                JSR     mon_undocumented_cmd
                LDA     $8A
                CMP     $8C
                LDA     $8B
                SBC     $8D
                BCC     loc_FFFFF6C0_B55E
                LDA     #$FF
                STA     $90
                STA     $91

loc_FFFFF6C0_B55E                      ; CODE XREF seg000B556j
                LDA     #0
                STA     $BF
                LDY     $C8
                LDA     $400,Y
                CMP     #$9B
                BEQ     loc_FFFFF6C0_B5C2
                CMP     #$22
                BEQ     loc_FFFFF6C0_B5D3

loc_FFFFF6C0_B56F                      ; CODE XREF seg000B581j
                STA     $C4
                JSR     mon_read_inp
                PHA     
                LDA     $8C
                LDX     $BF
                STA     $488,X
                INC     $BF
                PLA     
                CMP     #$34
                BNE     loc_FFFFF6C0_B56F

loc_FFFFF6C0_B583                      ; CODE XREF seg000B5CAj seg000B5D6j
                DEC     $BF

loc_FFFFF6C0_B585                      ; CODE XREF seg000B5BDj
                LDY     #0

loc_FFFFF6C0_B587                      ; CODE XREF seg000B593j
                LDA     ($8A),Y
                CMP     $488,Y
                BNE     loc_FFFFF6C0_B5AF
                CPY     $BF
                BCS     loc_FFFFF6C0_B595
                INY     
                BNE     loc_FFFFF6C0_B587

loc_FFFFF6C0_B595                      ; CODE XREF seg000B590j
                JSR     sub_FFFFF6C0_B4C7
                LDY     #0

loc_FFFFF6C0_B59A                      ; CODE XREF seg000B5A8j
                LDA     ($8A),Y
                STA     $480,Y
                JSR     tostring
                JSR     mon_prn_1_space
                INY     
                CPY     #8
                BNE     loc_FFFFF6C0_B59A
                STY     $A6
                JSR     sub_FFFFF6C0_B4A5

loc_FFFFF6C0_B5AF                      ; CODE XREF seg000B58Cj
                INC     $8A
                BNE     loc_FFFFF6C0_B5B5
                INC     $8B

loc_FFFFF6C0_B5B5                      ; CODE XREF seg000B5B1j
                LDA     $8A
                CMP     $90
                LDA     $8B
                SBC     $91
                BCC     loc_FFFFF6C0_B585
                JSR     printnewline

loc_FFFFF6C0_B5C2                      ; CODE XREF seg000B569j
                JMP     initass_or_mon
;----------------------------------------------------------------------------

loc_FFFFF6C0_B5C5                      ; CODE XREF seg000B5D4j
                LDA     $400,Y
                CMP     #$9B
                BEQ     loc_FFFFF6C0_B583
                LDX     $BF
                STA     $488,X
                INC     $BF

loc_FFFFF6C0_B5D3                      ; CODE XREF seg000B56Dj
                INY     
                BNE     loc_FFFFF6C0_B5C5
                BEQ     loc_FFFFF6C0_B583

mon_cmd_print_register                      ; CODE XREF seg000B64Dj
                LDX     $59E
                LDA     $59F
                JSR     mon_disassemble
                JSR     sub_FFFFF6C0_B5E7
                JMP     initass_or_mon

;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_B5E7                      ; CODE XREF seg000B5E1p sub_FFFFF6C0_BB2B+Ej
                LDY     #0

loc_FFFFF6C0_B5E9                      ; CODE XREF sub_FFFFF6C0_B5E7+14j
                JSR     mon_prn_1_space
                LDA     registernames,Y   ; B600
                JSR     print
                LDA     $599,Y
                JSR     tostring
                INY     
                CPY     #5
                BNE     loc_FFFFF6C0_B5E9
                JMP     printnewline
; End of function sub_FFFFF6C0_B5E7

;----------------------------------------------------------------------------
registernames   
                dta  $C1 ; Á
                dta  $D8 ; Ø
                dta  $D9 ; Ù
                dta  $D3 ; Ó
                dta  $D0 ; Ð
;----------------------------------------------------------------------------
hdl_break_key     						; see also VIMIRQ_redirect subroutine
				BIT     $D20E           ; break key pressed? (Bit 7 IRQSTAT=>N-Flag)
                BPL     loc_FFFFF6C0_B60D ; no than branch
                JMP     ($5FC)          ; call SYNRDYIRQ ($C030)
;----------------------------------------------------------------------------

loc_FFFFF6C0_B60D                      ; CODE XREF seg000B608j
                PHA     
                LDA     #$7F
                STA     $D20E           ; set IRQEN = 0111 1111 ==Disable BREAK-Key IR
                LDA     $10
                STA     $D20E           ; set IRQEN to 00000001 == only SEROUT IR is enabled
                LDA     #0              ; enable screen output ($2FF) and show cursor ($2F0)
                STA     $2FF
                STA     $2F0
                STA     $4D             ; clear CRITICIO ($42) and ATTRACT($4D)
                STA     $42

called_by_brk                          ; called if BRK is reached (VBREAK)
                PLA     
                STA     $599
                PLA     
                STA     $59D
                STX     $59A
                STY     $59B
                PLA     
                STA     $59E
                PLA     
                STA     $59F
                TSX     
                STX     $59C
                CLI     
                PHP     
                PLA     
                AND     #$EF
                PHA     
                PLP     
                LDX     #$23            ; print "*** BREAK ***"
                JSR     printbibomsg
                JSR     restorVIMMEDIRQ
                JMP     mon_cmd_print_register
;----------------------------------------------------------------------------
mon_cmd_go
                JSR     mon_adr_to_a3a4

VIMIRQ_redirect                     		; original set to $BD05 which is hdl_break_key
                LDA     #<hdl_break_key     ; set VIMMEDIRQ to hdl_break_key
                STA     $216
                LDA     #>hdl_break_key	    ; hight byte hdl_break_key 
                STA     $217
                JSR     sub_FFFFF6C0_B682
                JSR     sub_FFFFF6C0_B6A0
                LDA     #0
                STA     $42
                PHP     
                PHA     
                JSR     restorVIMMEDIRQ
                PLA     
                PLP     

;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_B66E                      ; CODE XREF seg000BB4Ap
                STA     $599
                STX     $59A
                STY     $59B
                PHP     
                PLA     
                STA     $59D
                TSX     
                STX     $59C
                CLD     
                RTS     
; End of function sub_FFFFF6C0_B66E


;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_B682                      ; CODE XREF seg000B65Dp seg000BADAp
                LDA     $59D
                PHA     
                LDX     $59A
                LDY     $59B
                LDA     $599
                PLP     
                CLI     
                RTS     
; End of function sub_FFFFF6C0_B682


;----------------------------------------------------------------------------

;               S u b r o u t i n e

restorVIMMEDIRQ                        ; CODE XREF seg0009556p seg000B64Ap
                                        ; ...
                LDA     $5FC            ; restore VIMMEDIRQ
                STA     $216
                LDA     $5FD
                STA     $217
                CLI     
                RTS     
; End of function restorVIMMEDIRQ


;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_B6A0                      ; CODE XREF seg000B660p
                JMP     ($A3)
; End of function sub_FFFFF6C0_B6A0

;----------------------------------------------------------------------------
; converts 16bit values ascii from input buffer $400 and writes the values
; to values  first in input buffer to 8D,8E, second to 8b,8c 
mon_ascii_2_val                      ; CODE XREF mon_read_inp+Ej
                                        ; mon_read_inp+14j
                LDX     #3
                ASL     @
                ASL     @
                ASL     @
                ASL     @

loc_FFFFF6C0_B6A9                      ; CODE XREF seg000B6AFj
                ASL     @
                ROL     $8C
                ROL     $8D
                DEX     
                BPL     loc_FFFFF6C0_B6A9

loc_FFFFF6C0_B6B1                      ; CODE XREF seg000B6BCj
                LDA     $C4
                BNE     loc_FFFFF6C0_B6BB
                LDA     $8D,X
                STA     $8B,X
                STA     $8F,X

loc_FFFFF6C0_B6BB                      ; CODE XREF seg000B6B3j
                INX     
                BEQ     loc_FFFFF6C0_B6B1
                BNE     mon_read_inp_400

;----------------------------------------------------------------------------

;               S u b r o u t i n e

mon_read_inp                      ; CODE XREF seg000B361p seg000B571p
                LDX     #0
                STX     $8C
                STX     $8D

mon_read_inp_400                      ; CODE XREF seg000B6BEj
                LDA     $400,Y
                INY     
                EOR     #$30
                CMP     #$A
                BCC     mon_ascii_2_val
                ADC     #$88
                CMP     #$FA
                BCS     mon_ascii_2_val
                RTS     
; End of function mon_read_inp

;----------------------------------------------------------------------------

skipspace                              ; CODE XREF seg000B6DDj (b6d7)
                LDA     $400,Y          ; load char from buffer pos y
                INY     
                CMP     #' '            ; is it the space key?
                BEQ     skipspace       ; yes, than skip to next char
                RTS     
;----------------------------------------------------------------------------
mon_cmd_writesector        
                LDA     #$80
                dta   b($2c)        ; beware ..tricky code
                                    ; $2c + lda #0 => BIT $00A9 
mon_cmd_readsector                
                LDA     #$00
                STA     $BF
                JSR     getdevstatbycha

loc_FFFFF6C0_B6EA                      ; CODE XREF seg000B74Bj seg000B75Bj
                LDA     $90
                STA     $304
                LDA     $91
                STA     $305
                ORA     $90
                BEQ     loc_FFFFF6C0_B75E
                LDA     $8A
                STA     $30A
                LDA     $8B
                STA     $30B
                LDA     $BF
                BPL     mon_cmd_search
                JSR     sub_FFFFF6C0_B7A1
                JMP     loc_FFFFF6C0_B70F
;----------------------------------------------------------------------------

mon_cmd_search                      ; CODE XREF seg000B704j
                JSR     sub_FFFFF6C0_B79B

loc_FFFFF6C0_B70F                      ; CODE XREF seg000B709j
                LDA     $8A
                CMP     $8C
                LDA     $8B
                SBC     $8D
                BCS     loc_FFFFF6C0_B75E
                LDA     $8B
                CMP     #8
                BCC     loc_FFFFF6C0_B72F
                CLC     
                LDA     $8A
                ADC     $8E
                STA     $8A
                LDA     $8B
                ADC     $8F
                STA     $8B
                JMP     loc_FFFFF6C0_B735
;----------------------------------------------------------------------------

loc_FFFFF6C0_B72F                      ; CODE XREF seg000B71Dj
                INC     $8A
                BNE     loc_FFFFF6C0_B735
                INC     $8B

loc_FFFFF6C0_B735                      ; CODE XREF seg000B72Cj seg000B731j
                LDA     $30B
                BNE     loc_FFFFF6C0_B74E
                LDA     $30A
                CMP     #4
                BCS     loc_FFFFF6C0_B74E
                LDA     $90
                ADC     #$80
                STA     $90
                BCC     loc_FFFFF6C0_B75B
                INC     $91
                JMP     loc_FFFFF6C0_B6EA
;----------------------------------------------------------------------------

loc_FFFFF6C0_B74E                      ; CODE XREF seg000B738j seg000B73Fj
                CLC     
                LDA     $90
                ADC     $8E
                STA     $90
                LDA     $91
                ADC     $8F
                STA     $91

loc_FFFFF6C0_B75B                      ; CODE XREF seg000B747j
                JMP     loc_FFFFF6C0_B6EA
;----------------------------------------------------------------------------

loc_FFFFF6C0_B75E                      ; CODE XREF seg000B6F6j seg000B717j
                JMP     initass_or_mon

;----------------------------------------------------------------------------

;               S u b r o u t i n e

getdevstatbycha                        ; CODE XREF seg000B6E7p
                LDY     $C8             ; load index to drive number
                LDA     $400,Y          ; load ascii drive #
                CMP     #$31            ; drive 1 is default..no prob
                BCC     getdevstatusd1
                CMP     #$35            ; drive 5 is invalid -> set to 1
                BCS     getdevstatusd1
                AND     #7              ; other drive -> accu-30=dev#
                BNE     devstat_accu    ; use accu retrieve info DD/SD

getdevstatusd1                         ; CODE XREF getdevstatbycha+7j
                                        ; getdevstatbycha+Bj
                LDA     #1              ; default is drive 1

devstat_accu                           ; CODE XREF getdevstatbycha+Fj
                STA     $301            ; store drive number
                LDA     #$53
                STA     $302            ; command 53=getstatus
                JSR     $E453           ; jump to diskinterface (JUMPTAB+3)
                TYA     
                BMI     devstaterror    ; brach on error (N=1) error # in Y
                LDA     $2EA            ; load devicestat command status
                AND     #$20            ; check bit 5 - 1=DD-Disk oder 0=SD-Disk
                BEQ     singledensity   ; 0=single density disk
                LDA     #0              ; bit 5 is 1=> double density
                LDX     #1
                BNE     loc_FFFFF6C0_B793

singledensity                          ; CODE XREF getdevstatbycha+26j
                LDA     #$80
                LDX     #0

loc_FFFFF6C0_B793                      ; CODE XREF getdevstatbycha+2Cj
                STA     $8E
                STX     $8F
                RTS     
;----------------------------------------------------------------------------

devstaterror                           ; CODE XREF getdevstatbycha+1Fj
                JMP     prn_ctrl_1
; End of function getdevstatbycha


;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_B79B                      ; CODE XREF seg000B70Cp
                LDX     #$52
                LDY     #$40
                BNE     loc_FFFFF6C0_B7A5
; End of function sub_FFFFF6C0_B79B


;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_B7A1                      ; CODE XREF seg000B706p
                LDX     #$50
                LDY     #$80

loc_FFFFF6C0_B7A5                      ; CODE XREF sub_FFFFF6C0_B79B+4j
                STX     $302
                STY     $303
                LDA     #$31
                STA     $300
                LDA     #$F
                STA     $306
                LDA     $30B
                BNE     loc_FFFFF6C0_B7C7
                LDA     $30A
                CMP     #4
                BCS     loc_FFFFF6C0_B7C7
                LDA     #$80
                LDX     #0
                BEQ     loc_FFFFF6C0_B7CB

loc_FFFFF6C0_B7C7                      ; CODE XREF sub_FFFFF6C0_B7A1+17j
                                        ; sub_FFFFF6C0_B7A1+1Ej
                LDA     $8E
                LDX     $8F

loc_FFFFF6C0_B7CB                      ; CODE XREF sub_FFFFF6C0_B7A1+24j
                STA     $308
                STX     $309
                JSR     $E459
                TYA     
                BMI     prn_ctrl_1
                RTS     
;----------------------------------------------------------------------------

prn_ctrl_1                             ; CODE XREF getdevstatbycha+37j
                                        ; sub_FFFFF6C0_B7A1+34j
                LDA     #$FD            ; print CTRL+1
                JSR     print
                JMP     initass_or_mon
; End of function sub_FFFFF6C0_B7A1


;----------------------------------------------------------------------------

;               S u b r o u t i n e

mon_adr_to_a3a4                        ; CODE XREF seg000B650p seg000B7EBp
                TXA     
                BEQ     mon_no_cpy_nec

mon_adr_param                          ; CODE XREF mon_adr_to_a3a4+8j
                LDA     $8A,X           ; copy address into $a3,$a4
                STA     $A3,X
                DEX     
                BPL     mon_adr_param

mon_no_cpy_nec                         ; CODE XREF mon_adr_to_a3a4+1j
                RTS                     ; address copy not necessary
; End of function mon_adr_to_a3a4

;----------------------------------------------------------------------------

mon_cmd_l                              ; disassemble (command L in monitor)
                JSR     mon_adr_to_a3a4
                LDA     #$13            ; load number of lines to print (default 19 lines)

mon_loop_disass                        ; CODE XREF seg000B802j
                PHA                     ; store number of lines on stack
                JSR     sub_FFFFF6C0_B805
                JSR     sub_FFFFF6C0_B875
                JSR     sub_FFFFF6C0_B911
                STA     $A3
                STY     $A4
                PLA                     ; get number of lines from stack
                SEC                     ; decrease number of lines
                SBC     #1
                BNE     mon_loop_disass ; and loop..else return from command "L"
                RTS     

;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_B805                      ; CODE XREF seg000B7F1p
                JSR     mon_newline_dis ; print <address>
                LDX     #3
                JSR     mon_prn_xspaces ; followed by 3 spaces
LOC_FFFFF6C0_B80D
                LDA     ($A3,X)         ; X is 0 => load opcode of current command
                STX     $C2             ; clear $C2
                TAY                     ; store current opcode in Y
                LSR     @               ; shift bit 0 into carry
                BCC     groupii_instruc ; bit 0==0 branch
                LSR     @               ; else, shift bit 1 into carry
                BCS     groupi_extinstr ; bit1==1 => extened group i instr
                CMP     #$22            ; check for opcode $89. bit 0==1 and bit 1==0. Before shift of bit 0 and 1 10001001==$89
                BEQ     groupi_extinstr ; opcode $89=='STA immediate' found=>non group i instruction
                AND     #7              ; mask bit 0,1,2
                ORA     #$80            ; set bit 7 => 10000xxx

groupii_instruc                        ; CODE XREF sub_FFFFF6C0_B805+Ej
                LSR     @               ; shift bit 0 into carry
                TAX     
                LDA     opcodestab,X
                BCS     loc_FFFFF6C0_B82B ; was bit 0 == 1
                LSR     @               ; shift upper 4 bit into lower nibble
                LSR     @
                LSR     @
                LSR     @

loc_FFFFF6C0_B82B                      ; CODE XREF sub_FFFFF6C0_B805+20j
                AND     #$F             ; mask 0000xxxx
                BNE     loc_FFFFF6C0_B83E

groupi_extinstr                        ; CODE XREF sub_FFFFF6C0_B805+11j
                                        ; sub_FFFFF6C0_B805+15j
                TYA                     ; restore opcode into accu, see $b811
                LDX     #$19

loc_FFFFF6C0_B832                      ; CODE XREF sub_FFFFF6C0_B805+33j
                CMP     opcode_B980,X
                BEQ     loc_FFFFF6C0_B862
                DEX     
                BPL     loc_FFFFF6C0_B832
                LDY     #$80
                LDA     #0

loc_FFFFF6C0_B83E                      ; CODE XREF sub_FFFFF6C0_B805+28j
                TAX     
                LDA     opcode_B964,X
                STA     $A5
                AND     #3
                STA     $A6
                TYA     
                AND     #$8F
                TAX     
                TYA     
                LDY     #3
                CPX     #$8A
                BEQ     loc_FFFFF6C0_B85E

loc_FFFFF6C0_B853                      ; CODE XREF sub_FFFFF6C0_B805+5Aj
                LSR     @
                BCC     loc_FFFFF6C0_B85E
                LSR     @

loc_FFFFF6C0_B857                      ; CODE XREF sub_FFFFF6C0_B805+56j
                LSR     @
                ORA     #$20
                DEY     
                BNE     loc_FFFFF6C0_B857
                INY     

loc_FFFFF6C0_B85E                      ; CODE XREF sub_FFFFF6C0_B805+4Cj
                                        ; sub_FFFFF6C0_B805+4Fj
                DEY     
                BNE     loc_FFFFF6C0_B853
                RTS     
;----------------------------------------------------------------------------

loc_FFFFF6C0_B862                      ; CODE XREF sub_FFFFF6C0_B805+30j
                LDA     opcode_B99A,X
                STA     $A5
                AND     #3
                STA     $A6
                LDA     opcode_B9B4,X
                LDY     #$80
                STY     $C2
                LDY     #0
                RTS     
; End of function sub_FFFFF6C0_B805


;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_B875                      ; CODE XREF seg000B7F4p
                PHA     

loc_FFFFF6C0_B876                      ; CODE XREF sub_FFFFF6C0_B875+Ej
                LDA     ($A3),Y
                JSR     tostring
                LDX     #1

loc_FFFFF6C0_B87D                      ; CODE XREF sub_FFFFF6C0_B875+14j
                JSR     mon_prn_xspaces ; print one space
                CPY     $A6
                INY     
                BCC     loc_FFFFF6C0_B876
                LDX     #3
                CPY     #3
                BCC     loc_FFFFF6C0_B87D
                LDX     #3
                JSR     mon_prn_xspaces ; print 3 spaces
                PLA     
LOC_FFFFF6C0_B891
                LDX     #3
                TAY     
                LDA     data_B9CE,Y
                STA     $A8
                LDA     data_BA18,Y
                STA     $A7

loc_FFFFF6C0_B89E                      ; CODE XREF sub_FFFFF6C0_B875+3Dj
                LDA     #0
                LDY     #5

loc_FFFFF6C0_B8A2                      ; CODE XREF sub_FFFFF6C0_B875+33j
                ASL     $A7
                ROL     $A8
                ROL     @
                DEY     
                BNE     loc_FFFFF6C0_B8A2
                ADC     #$3F
                ORA     $C2
                JSR     print
                DEX     
                BNE     loc_FFFFF6C0_B89E
                LDX     #2
                JSR     mon_prn_xspaces ; print 2 spaces
                LDX     #6

loc_FFFFF6C0_B8BB                      ; CODE XREF sub_FFFFF6C0_B875+6Fj
                CPX     #3
                BNE     loc_FFFFF6C0_B8D1
                LDY     $A6
                BEQ     loc_FFFFF6C0_B8D1

loc_FFFFF6C0_B8C3                      ; CODE XREF sub_FFFFF6C0_B875+5Aj
                LDA     $A5
                CMP     #$E8
                LDA     ($A3),Y
                BCS     loc_FFFFF6C0_B8E7
                JSR     tostring
                DEY     
                BNE     loc_FFFFF6C0_B8C3

loc_FFFFF6C0_B8D1                      ; CODE XREF sub_FFFFF6C0_B875+48j
                                        ; sub_FFFFF6C0_B875+4Cj
                ASL     $A5
                BCC     loc_FFFFF6C0_B8E3
                LDA     opcode_B973,X
                JSR     print
                LDA     opcode_B979,X
                BEQ     loc_FFFFF6C0_B8E3
                JSR     print

loc_FFFFF6C0_B8E3                      ; CODE XREF sub_FFFFF6C0_B875+5Ej
                                        ; sub_FFFFF6C0_B875+69j
                DEX     
                BNE     loc_FFFFF6C0_B8BB
                RTS     
;----------------------------------------------------------------------------

loc_FFFFF6C0_B8E7                      ; CODE XREF sub_FFFFF6C0_B875+54j
                JSR     mon_inc_a3_a4
                TAX     
                INX     
                BNE     loc_FFFFF6C0_B8EF
                INY     

loc_FFFFF6C0_B8EF                      ; CODE XREF sub_FFFFF6C0_B3FE+46j
                                        ; sub_FFFFF6C0_B875+77j
                TYA     
; End of function sub_FFFFF6C0_B875


;----------------------------------------------------------------------------

;               S u b r o u t i n e
; monitor print 16bit hex val stored in @ and X register

mon_print_a_x                          ; CODE XREF sub_FFFFF6C0_B4C7+7p
                                        ; mon_disassemblep
                JSR     tostring        ; print high byte of hex value
                TXA     
                JMP     tostring        ; print low byte of hex value
; End of function mon_print_a_x


;----------------------------------------------------------------------------

;               S u b r o u t i n e
; called if monitor command "L" is executed

mon_newline_dis                        ; CODE XREF sub_FFFFF6C0_B805p
                JSR     printnewline
                LDA     $A4             ; address number in A3,A4
                LDX     $A3             ; will be printed by mon_print_a_x
; End of function mon_newline_dis


;----------------------------------------------------------------------------

;               S u b r o u t i n e

mon_disassemble                        ; CODE XREF seg000B5DEp
                JSR     mon_print_a_x   ; called during command "L" is executed
                LDA     #':'            ; "" behind the address, e.g. "4000"
                JMP     print
; End of function mon_disassemble


;----------------------------------------------------------------------------

;               S u b r o u t i n e

mon_prn_1_space                        ; CODE XREF seg000B5A2p sub_FFFFF6C0_B5E7+2p
                LDX     #1

mon_prn_xspaces                        ; CODE XREF sub_FFFFF6C0_B805+5p
                                        ; sub_FFFFF6C0_B875+8p
                                        ; ...
                LDA     #' '
                JSR     print
                DEX     
                BNE     mon_prn_xspaces ; print X spaces on screen
                RTS     
; End of function mon_prn_1_space


;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_B911                      ; CODE XREF seg000B7F7p
                LDA     $A6
                SEC     
; End of function sub_FFFFF6C0_B911


;----------------------------------------------------------------------------

;               S u b r o u t i n e

mon_inc_a3_a4                          ; CODE XREF sub_FFFFF6C0_B875+72p
                                        ; seg000BB03p ...
                LDY     $A4             ; load high byte of current address in Y register
                TAX     
                BPL     mon_high_positi
                DEY     

mon_high_positi                        ; CODE XREF mon_inc_a3_a4+3j
                ADC     $A3
                BCC     mon_no_inc_hb   ; branch if no high byte inc is nec.
                INY                     ; high byte increment

mon_no_inc_hb                          ; CODE XREF mon_inc_a3_a4+8j
                RTS     
; End of function mon_inc_a3_a4

;----------------------------------------------------------------------------
opcodestab      dta  $40 ; @          ; opcode RTI
                dta    2 ;  
                dta  $45 ; E          ; opcode EOR
                dta    3 ;  
                dta  $D0 ; Ð
                dta    8 ;  
                dta  $40 ; @
                dta    9 ;  
                dta  $30 ; 0
                dta  $22 ; "
                dta  $45 ; E
                dta  $33 ; 3
                dta  $D0 ; Ð
                dta    8 ;  
                dta  $40 ; @
                dta    9 ;  
                dta  $40 ; @
                dta    2 ;  
                dta  $45 ; E
                dta  $33 ; 3
                dta  $D0 ; Ð
                dta    8 ;  
                dta  $40 ; @
                dta    9 ;  
                dta  $40 ; @
                dta    2 ;  
                dta  $45 ; E
                dta  $B3 ; ³
                dta  $D0 ; Ð
                dta    8 ;  
                dta  $40 ; @
                dta    9 ;  
                dta    0 ;  
                dta  $22 ; "
                dta  $44 ; D
                dta  $33 ; 3
                dta  $D0 ; Ð
                dta  $8C ; Œ
                dta  $44 ; D
                dta    0 ;  
                dta  $11 ;  
                dta  $22 ; "
                dta  $44 ; D
                dta  $33 ; 3
                dta  $D0 ; Ð
                dta  $8C ; Œ
                dta  $44 ; D
                dta  $9A ; š
                dta  $10 ;  
                dta  $22 ; "
                dta  $44 ; D
                dta  $33 ; 3
                dta  $D0 ; Ð
                dta    8 ;  
                dta  $40 ; @
                dta    9 ;  
                dta  $10 ;  
                dta  $22 ; "
                dta  $44 ; D
                dta  $33 ; 3
                dta  $D0 ; Ð
                dta    8 ;  
                dta  $40 ; @
                dta    9 ;  
                dta  $62 ; b
                dta  $13 ;  
                dta  $78 ; x
                dta  $A9 ; ©
opcode_B964                
                dta    0 ;  
                dta  $21 ; !
                dta  $81 ; 
                dta  $82 ; ‚
                dta    0 ;  
                dta    0 ;  
                dta  $59 ; Y
                dta  $4D ; M
                dta  $91 ; ‘
                dta  $92 ; ’
                dta  $86 ; †
                dta  $4A ; J
                dta  $85 ; …
                dta  $9D ; 
                dta  $49 ; I
opcode_B973
                dta  $5A ; Z
                dta  $2C ; ,
                dta  $29 ; )
                dta  $2C ; ,
                dta  $23 ; #
                dta  $28 ; (
opcode_B979
                dta  $24 ; $
                dta  $59 ; Y
                dta    0 ;  
                dta  $58 ; X
                dta  $24 ; $
                dta  $24 ; $
                dta    0 ;  
opcode_B980
                dta    4 ;  
                dta   $C ;  
                dta  $12 ;  
                dta  $14 ;  
                dta  $1A ;  
                dta  $1C ;  
                dta  $32 ; 2
                dta  $34 ; 4
                dta  $3A ; 
                dta  $3C ; <
                dta  $52 ; R
                dta  $5A ; Z
                dta  $64 ; d
                dta  $72 ; r
                dta  $74 ; t
                dta  $7A ; z
                dta  $7C ; |
                dta  $80 ; €
                dta  $92 ; ’
                dta  $9C ; œ
                dta  $9E ; ž
                dta  $B2 ; ²
                dta  $D2 ; Ò
                dta  $DA ; Ú
                dta  $F2 ; ò
                dta  $FA ; ú
opcode_B99A
                dta $81
                dta  $82 ; ‚
                dta  $49 ; I
                dta  $81 ; 
                dta    0 ;  
                dta  $82 ; ‚
                dta  $49 ; I
                dta  $91 ; ‘
                dta    0 ;  
                dta  $92 ; ’
                dta  $49 ; I
                dta    0 ;  
                dta  $81 ; 
                dta  $49 ; I
                dta  $91 ; ‘
                dta    0 ;  
                dta  $5A ; Z
                dta  $9D ; 
                dta  $49 ; I
                dta  $82 ; ‚
                dta  $92 ; ’
                dta  $49 ; I
                dta  $49 ; I
                dta    0 ;  
                dta  $49 ; I
                dta    0 ;  
opcode_B9B4
                dta  $40 ; @
                dta  $40 ; @
                dta  $38 ; 8
                dta  $41 ; A
                dta  $42 ; B
                dta  $41 ; A
                dta  $39 ; 9
                dta  $21 ; !
                dta  $43 ; C
                dta  $21 ; !
                dta  $3A ; 
                dta  $44 ; D
                dta  $45 ; E
                dta  $3B ; ;
                dta  $45 ; E
                dta  $46 ; F
                dta  $22 ; "
                dta  $47 ; G
                dta  $3C ; <
                dta  $45 ; E
                dta  $45 ; E
                dta  $3D ; =
                dta  $3E ; >
                dta  $48 ; H
                dta  $3F ; ?
                dta  $49 ; I
data_B9CE
                dta  $1C ;  
                dta  $8A ; Š
                dta  $1C ;  
                dta  $23 ; #
                dta  $5D ; ]
                dta  $8B ; ‹
                dta  $1B ;  
                dta  $A1 ; ¡
                dta  $9D ; 
                dta  $8A ; Š
                dta  $1D ;  
                dta  $23 ; #
                dta  $9D ; 
                dta  $8B ; ‹
                dta  $1D ;  
                dta  $A1 ; ¡
                dta    0 ;  
                dta  $29 ; )
                dta  $19 ;  
                dta  $AE ; ®
                dta  $69 ; i
                dta  $A8 ; ¨
                dta  $19 ;  
                dta  $23 ; #
                dta  $24 ; $
                dta  $53 ; S
                dta  $1B ;  
                dta  $23 ; #
                dta  $24 ; $
                dta  $53 ; S
                dta  $19 ;  
                dta  $A1 ; ¡
                dta    0 ;  
                dta  $1A ;  
                dta  $5B ; [
                dta  $5B ; [
                dta  $A5 ; ¥
                dta  $69 ; i
                dta  $24 ; $
                dta  $24 ; $
                dta  $AE ; ®
                dta  $AE ; ®
                dta  $A8 ; ¨
                dta  $AD ; ­
                dta  $29 ; )
                dta    0 ;  
                dta  $7C ; |
                dta    0 ;  
                dta  $15 ;  
                dta  $9C ; œ
                dta  $6D ; m
                dta  $9C ; œ
                dta  $A5 ; ¥
                dta  $69 ; i
                dta  $29 ; )
                dta  $53 ; S
                dta  $84 ; „
                dta  $13 ;  
                dta  $34 ; 4
                dta  $11 ;  
                dta  $A5 ; ¥
                dta  $69 ; i
                dta  $23 ; #
                dta  $A0 ;  
                dta  $AD ; ­
                dta  $AC ; ¬
                dta  $53 ; S
                dta  $29 ; )
                dta  $8A ; Š
                dta  $A5 ; ¥
                dta  $8B ; ‹
                dta  $1C ;  
                dta  $8A ; Š
                dta  $8B ; ‹
data_BA18
                dta  $D8 ; Ø
                dta  $62 ; b
                dta  $5A ; Z
                dta  $48 ; H
                dta  $26 ; &
                dta  $62 ; b
                dta  $94 ; ”
                dta  $88 ; ˆ
                dta  $54 ; T
                dta  $44 ; D
                dta  $C8 ; È
                dta  $54 ; T
                dta  $68 ; h
                dta  $44 ; D
                dta  $E8 ; è
                dta  $94 ; ”
                dta    0 ;  
                dta  $B4 ; ´
                dta    8 ;  
                dta  $84 ; „
                dta  $74 ; t
                dta  $B4 ; ´
                dta  $28 ; (
                dta  $6E ; n
                dta  $74 ; t
                dta  $F4 ; ô
                dta  $CC ; Ì
                dta  $4A ; J
                dta  $72 ; r
                dta  $F2 ; ò
                dta  $A4 ; ¤
                dta  $8A ; Š
                dta    0 ;  
                dta  $AA ; ª
                dta  $A2 ; ¢
                dta  $A2 ; ¢
                dta  $74 ; t
                dta  $74 ; t
                dta  $74 ; t
                dta  $72 ; r
                dta  $44 ; D
                dta  $68 ; h
                dta  $B2 ; ²
                dta  $32 ; 2
                dta  $B2 ; ²
                dta    0 ;  
                dta  $22 ; "
                dta    0 ;  
                dta  $1A ;  
                dta  $1A ;  
                dta  $26 ; &
                dta  $26 ; &
                dta  $72 ; r
                dta  $72 ; r
                dta  $88 ; ˆ
                dta  $C8 ; È
                dta  $C4 ; -
                dta  $CA ; Ê
                dta  $26 ; &
                dta  $48 ; H
                dta  $44 ; D
                dta  $44 ; D
                dta  $A2 ; ¢
                dta  $C8 ; È
                dta    6 ;  
                dta  $C6 ; Æ
                dta  $C4 ; -
                dta  $84 ; „
                dta  $74 ; t
                dta  $76 ; v
                dta  $74 ; t
                dta  $C4 ; -
                dta  $72 ; r
                dta  $72 ; r
                
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
mon_cmd_trace
                JSR     mon_adr_to_a3a4
                DEC     $C8
                LDA     $C8
                CMP     #1
                BCC     loc_FFFFF6C0_BA80
                LDY     #$50
                LDX     #0

loc_FFFFF6C0_BA71                      ; CODE XREF: seg000:BA79j
                                        ; seg000:BA7Cj
                LDA     $D01F
                CMP     #3
                BEQ     loc_FFFFF6C0_BA90
                DEX     
                BNE     loc_FFFFF6C0_BA71
                DEY     
                BNE     loc_FFFFF6C0_BA71
                BEQ     loc_FFFFF6C0_BA90

loc_FFFFF6C0_BA80                      ; CODE XREF: seg000:BA6Bj
                                        ; seg000:BA8Ej
                JMP     initass_or_mon
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
mon_cmd_singlestep
                JSR     mon_adr_to_a3a4
                LDA     $C8
                CMP     #2
                BCS     loc_FFFFF6C0_BA90
                BIT     $F7
                BPL     loc_FFFFF6C0_BA80

loc_FFFFF6C0_BA90                      ; CODE XREF: seg000:BA76j
                                        ; seg000:BA7Ej
                                        ; ...
                LDA     #$FF
                STA     $F7
                JSR     mon_newline_dis
                LDX     #0
                JSR     loc_FFFFF6C0_B80D
                JSR     loc_FFFFF6C0_B891
                PLA     
                STA     $B5
                PLA     
                STA     $B6
                LDX     #8    
                
;----------------------------------------------------------------------------

loc_FFFFF6C0_BAA7                      ; CODE XREF seg000BAAEj
                LDA     addr_bb4f,X
                STA     $5B2,X
                DEX     
                BNE     loc_FFFFF6C0_BAA7
                LDA     ($A3,X)
                BEQ     loc_FFFFF6C0_BAE4
                LDY     $A6
                CMP     #$20
                BEQ     loc_FFFFF6C0_BB0B
                CMP     #$60
                BEQ     loc_FFFFF6C0_BAF2
                CMP     #$40
                BEQ     loc_FFFFF6C0_BAED
                CMP     #$4C
                BEQ     loc_FFFFF6C0_BB18
                CMP     #$6C
                BEQ     loc_FFFFF6C0_BB19
                AND     #$1F
                EOR     #$14
                CMP     #4
                BEQ     loc_FFFFF6C0_BAD4

loc_FFFFF6C0_BAD2                      ; CODE XREF seg000BAD8j
                LDA     ($A3),Y

loc_FFFFF6C0_BAD4                      ; CODE XREF seg000BAD0j
                STA     $5B2,Y
                DEY     
                BPL     loc_FFFFF6C0_BAD2
                JSR     sub_FFFFF6C0_B682
                JMP     $5B2
;----------------------------------------------------------------------------

loc_FFFFF6C0_BAE0                      ; CODE XREF seg000BAFCj
                LDA     #0
                STA     $F7

loc_FFFFF6C0_BAE4                      ; CODE XREF seg000BAB2j
                JSR     sub_FFFFF6C0_BB2B
                JSR     printnewline
                JMP     initass_or_mon
;----------------------------------------------------------------------------

loc_FFFFF6C0_BAED                      ; CODE XREF seg000BAC0j
                CLC     
                PLA     
                STA     $59D

loc_FFFFF6C0_BAF2                      ; CODE XREF seg000BABCj
                PLA     
                STA     $A3
                PLA     
                TSX     
                DEX     
                DEX     
                CPX     $598
                BEQ     loc_FFFFF6C0_BAE0
                SEC     

loc_FFFFF6C0_BAFF                      ; CODE XREF seg000BB48j
                STA     $A4

loc_FFFFF6C0_BB01                      ; CODE XREF seg000BB4Ej
                LDA     $A6
                JSR     mon_inc_a3_a4
                STY     $A4
                CLC     
                BCC     loc_FFFFF6C0_BB21

loc_FFFFF6C0_BB0B                      ; CODE XREF seg000BAB8j
                CLC     
                LDA     $A6
                JSR     mon_inc_a3_a4
                TAX     
                TYA     
                PHA     
                TXA     
                PHA     
                LDY     #2

loc_FFFFF6C0_BB18                      ; CODE XREF seg000BAC4j seg000BB23j
                CLC     

loc_FFFFF6C0_BB19                      ; CODE XREF seg000BAC8j
                LDA     ($A3),Y
                TAX     
                DEY     
                LDA     ($A3),Y
                STX     $A4

loc_FFFFF6C0_BB21                      ; CODE XREF seg000BB09j
                STA     $A3
                BCS     loc_FFFFF6C0_BB18
                LDA     $B6
                PHA     
                LDA     $B5
                PHA     

;----------------------------------------------------------------------------

;               S u b r o u t i n e

sub_FFFFF6C0_BB2B                      ; CODE XREF seg000BAE4p
                LDA     #$12
                SEC     
                SBC     $55
                TAY     

loc_FFFFF6C0_BB31                      ; CODE XREF sub_FFFFF6C0_BB2B+Cj
                LDA     #' '
                JSR     print
                DEY     
                BPL     loc_FFFFF6C0_BB31
                JMP     sub_FFFFF6C0_B5E7
; End of function sub_FFFFF6C0_BB2B

;----------------------------------------------------------------------------

loc_FFFFF6C0_BB3C                      ; CODE XREF seg000BB55j
                CLC     
                LDY     #1
                LDA     ($A3),Y
                JSR     mon_inc_a3_a4
                STA     $A3
                TYA     
                SEC     
                BCS     loc_FFFFF6C0_BAFF

loc_FFFFF6C0_BB4A                      ; CODE XREF seg000BB52j
                JSR     sub_FFFFF6C0_B66E
                SEC     
;                BCS     loc_FFFFF6C0_BB01
;                NOP     
;                NOP     
;                JMP     loc_FFFFF6C0_BB4A
;----------------------------------------------------------------------------
;                JMP     loc_FFFFF6C0_BB3C
;----------------------------------------------------------------------------
addr_bb4f       dta $B0
                dta $B1
                dta $EA 
                dta $EA 
                dta $4C 
                dta $4A 
                dta $BB 
                dta $4C 
                dta $3C 
                dta $BB
bibcmds         dta    5 ;            ; begin bibo ass commands (5 bytes to next command, 3 bytes to compare)
                dta    3 ;            ; address is stored in $94,$95
                dta  $4C ; L          ; e.g. LIS = Command
                dta  $49 ; I          ; $9715 = entry point (value $97,$14 +1)
                dta  $53 ; S
                dta a(command_lis-1)
                ;dta  $14 ;  
                ;dta  $97 ; —
                dta  $44 ; D          ; DIR
                dta  $49 ; I          ; $AAF1
                dta  $52 ; R
                dta a(command_dir-1)
                ;dta  $F0 ; ð
                ;dta  $AA ; ª
                dta  $49 ; I          ; INC
                dta  $4E ; N          ; $9B28
                dta  $43 ; C
                dta a(command_inc-1)
                ;dta  $27 ; '
                ;dta  $9B ; ›
                dta  $53 ; S          ; SIZ
                dta  $49 ; I          ; $9B50
                dta  $5A ; Z
                dta a(command_siz-1)
                ;dta  $4F ; O
                ;dta  $9B ; ›
                dta  $45 ; E          ; ED2
                dta  $44 ; D          ; $9BA0
                dta  $32 ; 2
                dta a(command_ed2-1)
                ;dta  $9F ; Ÿ
                ;dta  $9B ; ›
                dta  $4D ; M          ; MER
                dta  $45 ; E          ; $9BD0
                dta  $52 ; R
                dta a(command_mer-1)
                ;dta  $CF ; Ï
                ;dta  $9B ; ›
                dta  $52 ; R          ; REN
                dta  $45 ; E          ; $9C34
                dta  $4E ; N
                dta a(command_ren-1)
                ;dta  $33 ; 3
                ;dta  $9C ; œ
                dta  $4E ; N          ; NUM
                dta  $55 ; U          ; $9B1F
                dta  $4D ; M
                dta a(command_num-1)
                ;dta  $1E ;  
                ;dta  $9B ; ›
                dta  $4E ; N          ; NEW
                dta  $45 ; E          ; $9515
                dta  $57 ; W
                dta a(command_new-1)
                ;dta  $14 ;  
                ;dta  $95 ; •
                dta  $52 ; R          ; RET
                dta  $45 ; E          ; $9BF2
                dta  $54 ; T
                dta a(command_ret-1)
                ;dta  $F1 ; ñ
                ;dta  $9B ; ›
                dta  $43 ; C          ; COP
                dta  $4F ; O          ; $9C90
                dta  $50 ; P
                dta a(command_cop-1)
                ;dta  $89 ; ‰
                ;dta  $9C ; œ
                dta  $4D ; M          ; MOV
                dta  $4F ; O          ; $9DA1
                dta  $56 ; V
                dta a(command_mov-1)
                ;dta  $A0 ;  
                ;dta  $9D ; 
                dta  $46 ; F          ; FIN
                dta  $49 ; I          ; $9DD0
                dta  $4E ; N
                dta a(command_fin-1)
                ;dta  $CF ; Ï
                ;dta  $9D ; 
                dta  $44 ; D          ; DEL
                dta  $45 ; E          ; $9A56
                dta  $4C ; L
                dta a(command_del-1)
                ;dta  $55 ; U
                ;dta  $9A ; š
                dta  $4C ; L          ; LST
                dta  $53 ; S          ; $ABD6
                dta  $54 ; T
                dta a(command_lst-1)
                ;dta  $D5 ; Õ
                ;dta  $AB ; «
                dta  $45 ; E          ; ENT
                dta  $4E ; N          ; $AC3B
                dta  $54 ; T
                dta a(command_ent-1)
                ;dta  $3A ; 
                ;dta  $AC ; ¬
                dta  $53 ; S          ; SAV
                dta  $41 ; @          ; $AC4A
                dta  $56 ; V
                dta a(command_sav-1)
                ;dta  $49 ; I
                ;dta  $AC ; ¬
                dta  $4C ; L          ; LOA
                dta  $4F ; O          ; $ACE8
                dta  $41 ; A
                dta a(command_loa-1)
                ;dta  $E7 ; ç
                ;dta  $AC ; ¬
                dta  $56 ; V          ; VAL
                dta  $41 ; @          ; $96F4
                dta  $4C ; L
                dta a(command_val-1)
                ;dta  $F3 ; ó
                ;dta  $96 ; –
                dta  $52 ; R          ; REP
                dta  $45 ; E          ; $9E65
                dta  $50 ; P
                dta a(command_rep-1)
                ;dta  $64 ; d
                ;dta  $9E ; ž
                dta  $53 ; S          ; SYM
                dta  $59 ; Y          ; $9FC7
                dta  $4D ; M
                dta a(command_sym-1)
                ;dta  $C6 ; Æ
                ;dta  $9F ; Ÿ
                dta  $41 ; @          ; ASM
                dta  $53 ; S          ; $A1EF
                dta  $4D ; M
                dta a(command_asm-1)
                ;dta  $EE ; î
                ;dta  $A1 ; ¡
                dta  $50 ; P          ; PON
                dta  $4F ; O          ; $AB8A
                dta  $4E ; N
                dta a(command_pon-1)
                ;dta  $89 ; ‰
                ;dta  $AB ; «
                dta  $50 ; P          ; POF
                dta  $4F ; O          ; $AB7E
                dta  $46 ; F
                dta a(command_pof-1)
                ;dta  $7D ; }
                ;dta  $AB ; «
                dta  $48 ; H          ; HIM
                dta  $49 ; I          ; $A082
                dta  $4D ; M
                dta a(command_him-1)
                ;dta  $81 ; 
                ;dta  $A0 ;  
                dta  $4C ; L          ; LOM
                dta  $4F ; O          ; $A097
                dta  $4D ; M
                dta a(command_lom-1)
                ;dta  $96 ; –
                ;dta  $A0 ;  
                dta  $44 ; D          ; DOS
                dta  $4F ; O          ; $95C2
                dta  $53 ; S
                dta a(command_dos-1)
                ;dta  $C1 ; Á
                ;dta  $95 ; •
                dta  $42 ; B          ; BIB
                dta  $49 ; I          ; $95C9
                dta  $42 ; B
                dta a(command_bib-1)
                ;dta  $C8 ; È
                ;dta  $95 ; •
                dta  $42 ; B          ; BLO
                dta  $4C ; L          ; $ADAB
                dta  $4F ; O
                dta a(command_blo-1)
                ;dta  $AA ; ª
                ;dta  $AD ; ­
                dta  $42 ; B          ; BSA
                dta  $53 ; S          ; $ADF5
                dta  $41 ; A
                dta a(command_bsa-1)
                ;dta  $F4 ; ô
                ;dta  $AD ; ­
                dta  $4D ; M          ; MON
                dta  $4F ; O          ; $B32E
                dta  $4E ; N
                dta a(command_mon-1)
                ;dta  $2D ; -
                ;dta  $B3 ; ³
                dta  $52 ; R          ; RUN
                dta  $55 ; U          ; $A0AB
                dta  $4E ; N
                dta a(command_run-1)
                ;dta  $AA ; ª
                ;dta  $A0 ;  
                dta  $E0 ; à          ; init tailer $e0,$02,$e1,$02,start address "start"
                dta    2 ;            ; original start is $9500
                dta  $E1 ; á
                dta    2 ;  
BIBOEND         dta  a(start)
               ; dta    0 ;  
               ; dta  $95 ; •

; end of bibo-assembler source