# Memory Map

[Differences Atari 400/800 - 1200XL - 600/800XL](#DiffOldOs2XL/) 

### Page 0

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|0,1|$0000,$0001|[LINZBS](#LINZBS)| |A|
|0|$0000|[LINFLG](#LINFLG)| |X
|1|$0001|[NGFLAG](#NGFLAG)| |X
|2,3|$0002,$0003|[CASINI](#CASINI)| |
|4,5|$0004,$0005|[RAMLO](#RAMLO)| |
|6|$0006|[TRAMSZ](#TRAMSZ)| |A
|6|$0006|[TRNSMZ](#TRNSMZ)| |X
|7|$0007|[TSTDAT](#TSTDAT)| |A
|7|$0007|[TSTDAT](#TSTDAT)| |X
|8|$0008|[WARMST](#WARMST)| |
|9|$0009|[BOOT?](#BOOT?)| |
|10,11|$000A,$000B|[DOSVEC](#DOSVEC)| |
|12,13|$000C,$000D|[DOSINI](#DOSINI)| |
|14,15|$000E,$000F|[APPMHI](#APPMHI)| |
|16|$0010|[POKMSK](#POKMSK)| |
|17|$0011|[BRKKEY](#BRKKEY)| |
|18-20|$0012-$0014|[RTCLOK](#RTCLOK)| |
|21,22|$0015,$0016|[BUFADR](#BUFADR)| |
|23|$0017|[ICCOMT](#ICCOMT)| |
|24,25|$0018,$0019|[DSKFMS](#DSKFMS)| |
|26,27|$001A,$001B|[DSKUTL](#DSKUTL)| |
|28|$001C|[PTIMOT](#PTIMOT)| |A
|29|$001D|[PBPNT](#PBPNT)| |A
|30|$001E|[PBUFSZ](#PBUFSZ)| |A
|31|$001F|[PTEMP](#PTEMP)| |A
|28-31|$001C-$001F|[ABUFPT](#ABUFPT)| |X
|32|$0020|[ICHIDZ](#ICHIDZ)| |
|33|$0021|[ICDNOZ](#ICDNOZ)| |
|34|$0022|[ICCOMZ](#ICCOMZ)| |
|35|$0023|[ICSTAZ](#ICSTAZ)| |
|36,37|$0024,$0025|[ICBALZ](#ICBALZ),[ICBAHZ](#ICBAHZ)| |
|38,39|$0026,$0027|[ICPTLZ](#ICPTLZ),[ICPTHZ](#ICPTHZ)| |
|40,41|$0028,$0029|[ICBLLZ](#ICBLLZ),[ICBLHZ](#ICBLHZ)| |
|42|$002A|[ICAX1Z](#ICAX1Z)| |
|43|$002B|[ICAX2Z](#ICAX2Z)| |
|44,45|$002C,$002D|[ICAX3Z](#ICAX3Z),[ICAX4Z](#ICAX4Z)| |
|46|$002E|[ICAX5Z](#ICAX5Z)| |
|47|$002F|[ICAX6Z](#ICAX6Z)| |
|48|$0030|[STATUS](#STATUS)| |
|49|$0031|[CHKSUM](#CHKSUM)| |
|50,51|$0032,$0033|[BUFRLO](#BUFRLO),[BUFRHI](#BUFRHI)| |
|52,53|$0034,$0035|[BFENLO](#BFENLO),[BFENHI](#BFENHI)| |
|54|$0036|[CRETRY](#CRETRY)| |A
|55|$0037|[DRETRY](#DRETRY)| |A
|54,55|$0036,$0037|[LTEMP](#LTEMP)| |X
|56|$0038|[BUFRFL](#BUFRFL)| |
|57|$0039|[RECVDN](#RECVDN)| |
|58|$003A|[XMTDON](#XMTDON)| |
|59|$003B|[CHKSNT](#CHKSNT)| |
|60|$003C|[NOCKSM](#NOCKSM)| |
|61|$003D|[BPTR](#BPTR)| |
|62|$003E|[FTYPE](#FTYPE)| |
|63|$003F|[FEOF](#FEOF)| |
|64|$0040|[FREQ](#FREQ)| |
|65|$0041|[SOUNDR](#SOUNDR)| |
|66|$0042|[CRITIC](#CRITIC)| |
|67-73|$0043-$0049|[FMZSPG](#FMZSPG)| |
|67,68|$0043,$0044|[ZBUFP](#ZBUFP)| |
|69,70|$0045,$0046|[ZDRVA](#ZDRVA)| |
|71,72|$0047,$0048|[ZSBA](#ZSBA)| |
|73|$0049|[ERRNO](#ERRNO)| |
|74|$004A|[CKEY](#CKEY)| |A
|75|$004B|[CASSBT](#CASSBT)| |A
|74,75|$004A,$004B|[ZCHAIN](#ZCHAIN)| |X
|76|$004C|[DSTAT](#DSTAT)| |
|77|$004D|[ATRACT](#ATRACT)| |
|78|$004E|[DRKMSK](#DRKMSK)| |
|79|$004F|[COLRSH](#COLRSH)| |
|80|$0050|[TEMP](#TEMP)| |
|81|$0051|[HOLD1](#HOLD1)| |
|82|$0052|[LMARGN](#LMARGN)| |
|83|$0053|[RMARGN](#RMARGN)| |
|84|$0054|[ROWCRS](#ROWCRS)| |
|85,86|$0055,$0056|[COLCRS](#COLCRS)| |
|87|$0057|[DINDEX](#DINDEX)| |
|88,89|$0058,$0059|[SAVMSC](#SAVMSC)| |
|90|$005A|[OLDROW](#OLDROW)| |
|91,92|$005B,$005C|[OLDCOL](#OLDCOL)| |
|93|$005D|[OLDCHR](#OLDCHR)| |
|94,95|$005E,$005F|[OLDADR](#OLDADR)| |
|96|$0060|[NEWROW](#NEWROW)| |A
|96,97|$0060,$0061|[FKDEF](#FKDEF)| |X
|97,98|$0061,$0062|[NEWCOL](#NEWCOL)| |A
|98|$0062|[PALNTS](#PALNTS)| |X
|99|$0063|[LOGCOL](#LOGCOL)| |
|100,101|$0064;$0065|[ADRESS](#ADRESS)| |
|102,103|$0066,$0067|[MLTTMP](#MLTTMP)| |
|104,105|$0068,$0069|[SAVADR](#SAVADR)| |
|106|$006A|[RAMTOP](#RAMTOP)| |
|107|$006B|[BUFCNT](#BUFCNT)| |
|108,109|$006C,$006D|[BUFSTR](#BUFSTR)| |
|110|$006E|[BITMSK](#BITMSK)| |
|111|$006F|[SHFAMT](#SHFAMT)| |
|112,113|$0070,$0071|[ROWAC](#ROWAC)| |
|114,115|$0072,$0073|[COLAC](#COLAC)| |
|116,117|$0074,$0075|[ENDPT](#ENDPT)| |
|118|$0076|[DELTAR](#DELTAR)| |
|119,120|$0077,$0078|[DELTAC](#DELTAC)| |
|121|$0079|[ROWINC](#ROWINC)| |A
|122|$007A|[COLINC](#COLINC)| |A
|121,122|$0079,$007A|[KEYDEF](#KEYDEF)| |X
|123|$007B|[SWPFLG](#SWPFLG)| |
|124|$007C|[HOLDCH](#HOLDCH)| |
|125|$007D|[INSDAT](#INSDAT)| |
|126,127|$007E,$007F|[COUNTR](#COUNTR)| |
|128,129|$0080,$0081|[LOMEM](#LOMEM)| |
|130,131|$0082,$0083|[VNTP](#VNTP)| |
|132,133|$0084,$0085|[VNTD](#VNTD)| |
|134,135|$0086,$0087|[VVTP](#VVTP)| |
|136,137|$0088,$0089|[STMTAB](#STMTAB)| |
|138,139|$008A,$008B|[STMCUR](#STMCUR)| |
|140,141|$008C,$008D|[STARP](#STARP)| |
|142,143|$008E,$008F|[RUNSTK](#RUNSTK)| |
|144,145|$0090,$0091|[MEMTOP](#TOPSTK)| |
|146-202|$0092-$00CA| |reserved for BASIC ROM|
|186,187|$00BA,$00BB|[STOPLN](#STOPLN)| |
|195|$00C3|[ERRSAVE](#ERRSAVE)| |
|201|$00C9|[PTABW](#PTABW)| |
|203-207|$00CB-$00CF| |unused by BASIC and ASSEMBLER|
|208,209|$00D0,$00D1| |unused by BASIC|
|210,211|$00D2,$00D3| |reserved for BASIC or cartridge use|
|212-217|$00D4-$00D9|[FR0](#FR0)|Floating point register zero; holds a six-byte internal form of the FP number|
|218-223|$00D1-$00DF|[FRE](#FRE)|FP extra register|
|224-229|$00E0-$00E5|[FR1](#FR1)|Floating point register one; holds a six-byte internal form of the FP number as does FR0|
|230-235|$00E6-$00EB|[FR2](#FR2)|FP register two|
|236|$00EC|[FRX](#FRX)|FP spare register|
|237|$00ED|[EEXP](#EEXP)|The value of E (the exponent)|
|238|$00EE|[NSIGN](#NSIGN)|The sign of the FP number|
|239|$00EF|[ESIGN](#ESIGN)|The sign of the exponent|
|240|$00F0|[FCHRFLG](#FCHRFLG)|The first character flag|
|241|$00F1|[DIGRT](#DIGRT)|The number of digits to the right of the decimal|
|242|$00F2|[CIX](#CIX)|Character (current input) index. Used as an offset to the input text buffer pointed to by INBUFF below.|
|243,244|$00F3,$00F4|[INBUFF](#INBUFF)|Input ASCII text buffer pointer|
|245,246|$00F5,$00F6|[ZTEMP1](#ZTEMP1)|Temporary register|
|247,248|$00F7,$00F8|[ZTEMP4](#ZTEMP4)|Temporary register|
|249,250|$00F9,$00FA|[ZTEMP3](#ZTEMP3)|Temporary register|
|251|$00FB|[RADFLG](#RADFLG)|Also called DEGFLG. When 0 all functions are performed in radians; when set to 6, they are done in degrees|
|252,253|$00FC,$00FD|[FLPTR](#FLPTR)|Points to the user's FP number|
|254,255|$00FE,$00FF|[FPTR2](#FPTR2)|Pointer to the user's second FP operation.|

### Page 1

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|256-511|$0100-$01FF| |The OS/DOS/BASIC stack |

### Page 2

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|512,513|$0200,$0201|[VDSLST](#VDSLST)|Vector to Display List Interrupt routine |
|514,515|$0202,$0203|[VPRCED](#VPRCED)| |
|516,517|$0204,$0205|[VINTER](#VINTER)| |
|518,519|$0206,$0207|[VBREAK](#VBREAK)| |
|520,521|$0208,$0209|[VKEYBD](#VKEYBD)| |
|522,523|$020A,$020B|[VSERIN](#VSERIN)| |
|524,525|$020C,$020D|[VSEROR](#VSEROR)| |
|526,527|$020E,$020F|[VSEROC](#VSEROC)| |
|528,529|$0210,$0211|[VTIMR1](#VTIMR1)| |
|530,531|$0212,$0213|[VTIMR2](#VTIMR2)| |
|532,533|$0214,$0215|[VTIMR4](#VTIMR4)| |
|534,535|$0216,$0217|[VIMIRQ](#VIMIRQ)| |
|536,537|$0218,$0219|[CDTMV1](#CDTMV1)| |
|538,539|$021A,$021B|[CDTMV2](#CDTMV2)| |
|540,541|$021C,$021D|[CDTMV3](#CDTMV3)| |
|542,543|$021E,$021F|[CDTMV4](#CDTMV4)| |
|544,545|$0220,$0221|[CDTMV5](#CDTMV5)| |
|546,547|$0222,$0223|[VVBLKI](#VVBLKI)|Vector to Vertical Blank I_MMEDIATE Routine|
|548,549|$0224,$0225|[VVBLKD](#VVBLKD)|Vector to Vertical Blank D_EFERRED Routine|
|550,551|$0226,$0227|[CDTMA1](#CDTMA1)| |
|552,553|$0228,$0229|[CDTMA2](#CDTMA2)| |
|554|$022A|[CDTMF3](#CDTMF3)| |
|555|$022B|[SRTIMR](#SRTIMR)| |
|556|$022C|[CDTMF4](#CDTMF4)| |
|557|$022D|[INTEMP](#INTEMP)| |
|558|$022E|[CDTMF5](#CDTMF5)| |
|559|$022F|[SDMCTL](#SDMCTL)|Shadow of [DMACTL](#DMACTL)|
|560,561|$0230,$0231|[SDLSTL](#SDLSTL),[SDLSTH](#SDLSTH)|Shadow Pointer to Display List|
|562|$0232|[SSKCTL](#SSKCTL)| |
|563|$0233|[SPARE](#SPARE)| |A
|563|$0233|[LCOUNT](#LCOUNT)| |X
|564|$0234|[LPENH](#LPENH)|Shadow Light Pen Horizontal Value|
|565|$0235|[LPENV](#LPENV)|Shadow Light Pen Vertical Value |
|566,567|$0236,$0237|[BRKKY](#BRKKY)|Break key Interrupt vector|OS B/X?
|568,569|$0238,$0239| |two spare bytes|A
|568,569|$0238,$0239|[VPIRQ](#VPIRQ)| |X
|570|$023A|[CDEVIC](#CDEVIC)| |
|571|$023B|[CCOMND](#CCOMND)| |
|572|$023C|[CAUX1](#CAUX1)| |
|573|$023D|[CAUX2](#CAUX2)| |
|574|$023E|[TEMP](#TEMP)| |
|575|$023F|[ERRFLG](#ERRFLG)| |
|576|$0240|[DFLAGS](#DFLAGS)| |
|577|$0241|[DESECT](#DESECT)| |
|578,579|$0242,$0243|[BOOTAD](#BOOTAD)| |
|580|$0244|[COLDST](#COLDST)| |
|581|$0245| |spare |A
|581|$0245|[RECLEN](#RECLEN)| |X
|582|$0246|[DSKTIM](#DSKTIM)| |
|583-622|$0247-$026E|[LINBUF](#LINBUF)| |A
|583|$0247|[PDVMSK](#PDVMSK)| |X
|584|$0248|[SHPDVS](#SHPDVS)| |X
|585|$0249|[PDIMSK](#PDIMSK)| |X
|586,587|$024A,$024B|[RELADR](#RELADR)| |X
|588|$024C|[PPTMPA](#PPTMPA)| |X
|589|$024D|[PPTMPX](#PPTMPX)| |X
|590-618|$024E-$026A| |reserved |X
|619|$026B|[CHSALT](#CHSALT)| |X
|620|$026C|[VSFLAG](#VSFLAG)| |X
|621|$026D|[KEYDIS](#KEYDIS)| |X
|622|$026E|[FINE](#FINE)|Fine Scroll Flag|X
|623|$026F|[GPRIOR](#GPRIOR)|Shadow of [PRIOR](#PRIOR) |
|624|$0270|[PADDL0](#PADDL0)|Shadow Paddle 0|
|625|$0271|[PADDL1](#PADDL1)|Shadow Paddle 1|
|626|$0272|[PADDL2](#PADDL2)|Shadow Paddle 2|
|627|$0273|[PADDL3](#PADDL3)|Shadow Paddle 3|
|628|$0274|[PADDL4](#PADDL4)|Shadow Paddle 4 (nur 400/800)|
|629|$0275|[PADDL5](#PADDL5)|Shadow Paddle 5 (nur 400/800)|
|630|$0276|[PADDL6](#PADDL6)|Shadow Paddle 6 (nur 400/800)|
|631|$0277|[PADDL7](#PADDL7)|Shadow Paddle 7 (nur 400/800)|
|632|$0278|[STICK0](#STICK0)|Shadow Stick 0|
|633|$0279|[STICK1](#STICK1)|Shadow Stick 1|
|634|$027A|[STICK2](#STICK2)|Shadow Stick 2 (nur 400/800)|
|635|$027B|[STICK3](#STICK3)|Shadow Stick 3 (nur 400/800)|
|636|$027C|[PTRIG0](#PTRIG0)|Shadow Paddle Trigger 0|
|637|$027D|[PTRIG1](#PTRIG1)|Shadow Paddle Trigger 1|
|638|$027E|[PTRIG2](#PTRIG2)|Shadow Paddle Trigger 2|
|639|$027F|[PTRIG3](#PTRIG3)|Shadow Paddle Trigger 3|
|640|$0280|[PTRIG4](#PTRIG4)|Shadow Paddle Trigger 4 (nur 400/800)|
|641|$0281|[PTRIG5](#PTRIG5)|Shadow Paddle Trigger 5 (nur 400/800)|
|642|$0282|[PTRIG6](#PTRIG6)|Shadow Paddle Trigger 6 (nur 400/800)|
|643|$0283|[PTRIG7](#PTRIG7)|Shadow Paddle Trigger 7 (nur 400/800)|
|644|$0284|[STRIG0](#STRIG0)|Shadow Stick Trigger 0|
|645|$0285|[STRIG1](#STRIG1)|Shadow Stick Trigger 1|
|646|$0286|[STRIG2](#STRIG2)|Shadow Stick Trigger 2 (nur 400/800)|
|647|$0287|[STRIG3](#STRIG3)|Shadow Stick Trigger 3 (nur 400/800)|
|648|$0288|[CSTAT](#CSTAT)| |A
|648|$0288|[HIBZTE](#HIBZTE)| |A
|649|$0289|[WMODE](#WMODE)| |
|650|$028A|[BLIM](#BLIM)| |
|651-655|$028B-$028F| |unused|A
|651|$028B|[IMASK](#IMASK)| |X
|652,653|$028C,$028D|[JVECK](#JVECK)| |X
|654,655|$028E,$028F|[NEWADR](#NEWADR)| |X
|656|$0290|[TXTROW](#TXTROW)| |
|657,658|$0291,$0292|[TXTCOL](#TXTCOL)| |
|659|$0293|[TINDEX](#TINDEX)| |
|660,661|$0294,$0295|[TXTMSC](#TXTMSC)| |
|662-667|$0296-$029B|[TXTOLD](#TXTOLD)| |
|668|$029C|[TMPX1](#TMPX1)| |A
|668|$029C|[CRETRY](#CRETRY)| |X
|669|$029D|[HOLD3](#HOLD3)| |
|670|$029E|[SUBTMP](#SUBTMP)| |
|671|$029F|[HOLD2](#HOLD2)| |
|672|$02A0|[DMASK](#DMASK)| |
|673|$02A1|[TMPLBT](#TMPLBT)| |
|674|$02A2|[ESCFLG](#ESCFLG)| |
|675-689|$02A3-$02B1|[TABMAP](#TABMAP)| |
|690-693|$02B2-$02B5|[LOGMAP](#LOGMAP)| |
|694|$02B6|[INVFLG](#INVFLG)| |
|695|$02B7|[FILFLG](#FILFLG)| |
|696|$02B8|[TMPROW](#TMPROW)| |
|697,698|$02B9,$02BA|[TMPCOL](#TMPCOL)| |
|699|$02BB|[SCRFLG](#SCRFLG)| |
|700|$02BC|[HOLD4](#HOLD4)| |
|701|$02BD|[HOLD5](#HOLD5)| |A
|701|$02BD|[DRETRY](#DRETRY)| |X
|702|$02BE|[SHFLOK](#SHFLOK)| |
|703|$02BF|[BOTSCR](#BOTSCR)| |
|704|$02C0|[PCOLR0](#PCOLR0)|Color of Player 0 and Missile 0 | both
|705  |  $02C1  |  [PCOLR1](#PCOLR1)  |  Color of Player 1 and Missile 1 | both
|706  |  $02C2  |  [PCOLR2](#PCOLR2)  |  Color of Player 3 and Missile 2 | both
|707  |  $02C3  |  [PCOLR3](#PCOLR3)  |  Color of Player 3 and Missile 3 | both
|708  |  $02C4  |  [COLOR0](#COLOR0)  |  Color Register 0  | both
|709  |  $02C5  |  [COLOR1](#COLOR1) | Color Register 1 | both
|710  |  $02C6  |  [COLOR2](#COLOR2) | Color Register 2 | both
|711  |  $02C7  |  [COLOR3](#COLOR3) | Color Register 3 | both
|712  |  $02C8  |  [COLOR4](#COLOR4) | Color Register 4 | both
|713,714|$02C9,$02CA|[RUNADR](#RUNADR)| |X
|715,716|$02CB,$02CC|[HIUSED](#HIUSED)| |X
|717,718|$02CD,$02CE|[ZHIUSE](#ZHIUSE)| |X
|719,720|$02CF,$02D0|[GBYTEA](#GBYTEA)| |X
|721,722|$02D1,$02D2|[LOADAD](#LOADAD)| |X
|723,724|$02D3,$02D4|[ZLOADA](#ZLOADA)| |X
|725,726|$02D5,$02D6|[DSCTLN](#DSCTLN)| |X
|727,728|$02D7,$02D8|[ACMISR](#ACMISR)| |X
|729|$2D9|[KRPDEL](#KRPDEL)| |X
|730|$2DA|[KEYREP](#KEYREP)| |X
|731|$2DB|[NOCLIK](#NOCLIK)| |X
|732|$02FC|[HELPFG](#HELPFG)| |X
|733|$02DD|[DMASAV](#DMASAV)| |X
|734|$02DE|[PBPNT](#PBPNT)| |X
|735|$02DF|[PBUFSZ](#PBUFSZ)| |X
|736,737|$02E0,$02E1|[RUNAD](#RUNAD)| |both
|738,739|$02E2,$02E3|[INITAD](#INITAD)| |both
|740|$02E4|[RAMSIZ](#RAMSIZ)| |both
|741,742|$02E5,$02E6|[MEMTOP](#MEMTOP)| |both
|743,744|$02E7,$02E8|[MEMLO](#MEMLO)| |both
|745|$02E9|[HNDLOD](#HNDLOD)| |X
|746-749|$02EA-$02ED|[DVSTAT](#DVSTAT)| |both
|750,751|$02EE,$02EF|[CBAUDLCBAUDH](#CBAUDLCBAUDH)| |both
|752|$02F0|[CRSINH](#CRSINH)|Cursor visibility|both
|753|$02F1|[KEYDEL](#KEYDEL)| |both
|754|$02F2|[CH1](#CH1)| |both
|755|$02F3|[CHACT](#CHACT)| |both
|756|$02F4|[CHBAS](#CHBAS)|Pointer to base address (high byte) of charset|both
|757|$02F5|[NEWROW](#NEWROW)| |X
|758,759|$02F6,$02F7|[NEWCOL](#NEWCOL)| |X
|760|$02F8|[ROWINC](#ROWINC)| |X
|761|$02F9|[COLINC](#COLINC)| |X
|762|$02FA|[CHAR](#CHAR)| |both
|763|$02FB|[ATACHR](#ATACHR)| |both
|764|$02FC|[CH](#CH)| | both
|765|$02FD|[FILDAT](#FILDAT)| |both
|766|$02FE|[DSPFLG](#DSPFLG)| |both
|767|$02FF|[SSFLAG](#SSFLAG)| |both

### Page 3
|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|768|$0300|[DDEVIC](#DDEVIC)| |both
|769|$0301|[DUNIT](#DUNIT)| |both
|770|$0302|[DCOMND](#DCOMND)| |both
|771|$0303|[DSTATS](#DSTATS)| |both
|772,773|$0304,$0305|[DBUFLO](#DBUFLO),[DBUFHI](#DBUFHI)| |both
|774|$0306|[DTIMLO](#DTIMLO)| |both
|775|$0307|[DUNUSE](#DUNUSE)| |both
|776,777|$0308,$0309|[DBYTLO](#DBYTLO),[DBYTHI](#DBYTHI)| |both
|778,779|$030A,$030B|[DAUX1](#DAUX1),[DAUX2](#DAUX2)| |both
|780,781|$030C,$030D|[TIMER1](#TIMER1)| |both
|782|$030E|[ADDCOR](#ADDCOR)| |A
|782|$030E|[JMPERS](#JMPERS)| |X
|783|$030F|[CASFLG](#CASFLG)| |both
|784,785|$0310,$0311|[TIMER2](#TIMER2)| |both
|786,787|$0312,$0313|[TEMP1](#TEMP1)| |both
|788|$0314|[TEMP2](#TEMP2)| |A
|788|$0314|[PTIMOT](#PTIMOT)| |X
|789|$0315|[TEMP3](#TEMP3)| |both
|790|$0316|[SAVIO](#SAVIO)| |both
|791|$0317|[TIMFLG](#TIMFLG)| |both
|792|$0318|[STACKP](#STACKP)| |both
|793|$0319|[TSTAT](#TSTAT)| |both
|794-831|$031A-$033F|[HATABS](#HATABS)|38 Bytes Handler Address Table|both
|829|$033D|[PUPBT1](#PUPBT1)| |X
|830|$033E|[PUPBT2](#PUPBT2)| |X
|831|$033F|[PUPBT3](#PUPBT3)| |X
|832-847|$0340-$034F|[IOCB0](#IOCB0)| |both
|848-863|$0350-$035F|[IOCB1](#IOCB1)| |both
|864-879|$0360-$036F|[IOCB2](#IOCB2)| |both
|880-895|$0370-$037F|[IOCB3](#IOCB3)| |both
|896-911|$0380-$038F|[IOCB4](#IOCB4)| |both
|912-927|$0390-$039F|[IOCB5](#IOCB5)| |both
|928-943|$03A0-$03AF|[IOCB6](#IOCB6)| |both
|944-959|$03B0-$03BF|[IOCB7](#IOCB7)| |both
|960-999|$03C0-$03E7|[PRNBUF](#PRNBUF)| |both
|1000-1020|$03E8-$03FC| |reserved buffer|both
|1000|$03E8|[SUPERF](#SUPERF)|Flag for function keys|1200XL
|1001|$03E9|[CKEY](#CKEY)| |X
|1002|$03EA|[CASSBT](#CASSBT)| |X
|1003|$03EB|[CARTCK](#CARTCK)| |X
|1004|$03EC|[DEERF](#DEERF)| |X
|1005-1015|$03ED-$03F7|[ACMVAR](#ACMVAR)| |X
|1016|$03F8|[BASICF](#BASICF)| |X
|1017|$03F9|[MINTLK](#MINTLK)| |X
|1018|$03FA|[GINTLK](#GINTLK)| |X
|1019,1020|$3FB,$3FC|[CHLINK](#CHLINK)| |X

### Page 4
|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|1021-1151|$03FD-$047F|[CASBUF](#CASBUF)| |both
|1152-1279|$0480-$04FF| |128 free bytes| 

### Page 5
|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|1280-1405|$0500-$057D| | |
|1406|$057E|[LBPR1](#LBPR1)|LBUFF prefix one|
|1407|$057F|[LBPR2](#LBPR2)|LBUFF prefix two|
|1408-1535|$0580-$05FF|[LBUFF](#LBUFF)|BASIC line Buffer |
|1504|$05E0|[PLYARG](#PLYARG)|Polynominal arguments|
|1510-1515|$05E6-$05EB|[FPSCR](#FPSCR)|Floating Point scratch pad use|
|1516-1535|$05EC-$05FF|[FPSCR1](#FPSCR1)|Floating Point scratch pad use|

### Page 6
|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|1536-1791|$0600-$06FF| |"Page 6" free for user|both

### Right Cartridge (B) 8K

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|32768-40959|$8000-$9FFF| | |
|40954|$9FFA| |Cartridge Start Address low |
|40955|$9FFB| |Cartridge Start Address high |
|40956|$9FFC| |Cartridge present?|
|40957|$9FFD| |Option Byte|
|40958|$9FFE| |Cartridge Initialization Address low |
|40959|$9FFF| |Cartridge Initialization Address high |

### Left Cartridge (A) 8K

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|40960-49151|$A000-$BFFF| | |
|43234|$A8E2| |[shows revision of BASIC](#How_to_find_the_revision_number_of_Atari_Basic)|
|49146|$BFFA| |Cartridge Start Address low |
|49147|$BFFB| |Cartridge Start Address high |
|49148|$BFFC| |Cartridge present?|
|49149|$BFFD| |Option Byte|
|49150|$BFFE| |Cartridge Initialization Address low |
|49151|$BFFF| |Cartridge Initialization Address high |

### [GTIA](#GTIA) (CTIA)

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|53248|$D000|[HPOSP0](#HPOSP0),[M0PF](#HPOSP0)| |both
|53249|$D001|[HPOSP1](#HPOSP1),[M1PF](#HPOSP1)| |both
|53250|$D002|[HPOSP2](#HPOSP2),[M2PF](#HPOSP2)| |both
|53251|$D003|[HPOSP3](#HPOSP3),[M3PF](#HPOSP3)| |both
|53252|$D004|[HPOSM0](#HPOSM0),[P0PF](#HPOSM0)| |both
|53253|$D005|[HPOSM1](#HPOSM1),[P1PF](#HPOSM1)| |both
|53254|$D006|[HPOSM2](#HPOSM2),[P2PF](#HPOSM2)| |both
|53255|$D007|[HPOSM3](#HPOSM3),[P3PF](#HPOSM3)| |both
|53256|$D008|[SIZEP0](#SIZEP0),[M0PL](#SIZEP0)| |both
|53257|$D009|[SIZEP1](#SIZEP1),[M1PL](#SIZEP1)| |both
|53258|$D00A|[SIZEP2](#SIZEP2),[M2PL](#SIZEP2)| |both
|53259|$D00B|[SIZEP3](#SIZEP3),[M3PL](#SIZEP3)| |both
|53260|$D00C|[SIZEM](#SIZEM),[P0PL](#SIZEM)| |both
|53261|$D00D|[GRAFP0](#GRAFP0),[P1PL](#GRAFP0)| |both
|53262|$D00E|[GRAFP1](#GRAFP1),[P2PL](#GRAFP1)| |both
|53263|$D00F|[GRAFP2](#GRAFP2),[P3PL](#GRAFP2)| |both
|53264|$D010|[GRAFP3](#GRAFP3),[TRIG0](#GRAFP3)| |both
|53265|$D011|[GRAFM](#GRAFM),[TRIG1](#GRAFM)| |both
|53266|$D012|[COLPM0](#COLPM0),[TRIG2](#COLPM0)| |both
|53267|$D013|[COLPM1](#COLPM1),[TRIG3](#COLPM1)| |both
|53268|$D014|[COLPM2](#COLPM2),[PAL](#COLPM2)| |both
|53269|$D015|[COLPM3](#COLPM3)| |both
|53270|$D016|[COLPF0](#COLPF0)| |both
|53271|$D017|[COLPF1](#COLPF1)| |both
|53272|$D018|[COLPF2](#COLPF2)| |both
|53273|$D019|[COLPF3](#COLPF3)| |both
|53274|$D01A|[COLBK](#COLBK)| |both
|53275|$D01B|[PRIOR](#PRIOR)| |both
|53276|$D01C|[VDELAY](#VDELAY)| |both
|53277|$D01D|[GRACTL](#GRACTL)| |both
|53278|$D01E|[HITCLR](#HITCLR)| |both
|53279|$D01F|[CONSOL](#CONSOL)| |both
|53280-53503|$D020-$D0FF| |repeats 53248-53279, do not use |

### Reserved
|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|53504-53759|$D100-$D1FF| |reserved for future use|B

### POKEY

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|53760|$D200|[AUDF1](#AUDF1),[POT0](#POT0)| |
|53761|$D201|[AUDC1](#AUDC1),[POT1](#POT1)| |
|53762|$D202|[AUDF2](#AUDF2),[POT2](#POT2)| |
|53763|$D203|[AUDC2](#AUDC2),[POT3](#POT3)| |
|53764|$D204|[AUDF3](#AUDF3),[POT4](#POT4)| |
|53765|$D205|[AUDC3](#AUDC3),[POT5](#POT5)| |
|53766|$D206|[AUDF4](#AUDF4),[POT6](#POT6)| |
|53767|$D207|[AUDC4](#AUDC4),[POT7](#POT7)| |
|53768|$D208|[AUDCTL](#AUDCTL),[ALLPOT](#ALLPOT)| |
|53769|$D209|[STIMER](#KBCODE),[KBCODE](#KBCODE)| |
|53770|$D20A|[SKREST](#SKREST),[RANDOM](#SKREST)| |
|53771|$D20B|[POTGO](#POTGO)| |
|53772|$D20C| |unused|
|53773|$D20D|[SEROUT](#SEROUT),[SERIN](#SEROUT)| |
|53774|$D20E|[IRQEN](#IRQEN),[IRQST](#IRQEN)| |
|53775|$D20F|[SKCTL](#SKCTL),[SKSTAT](#SKCTL)| |
|53776-54015|$D210-$D2FF| |repeats 53760-53775, no special use|

### PIA

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|54016|$D300|[PORTA](#PORTA)| | 
|54017|$D301|[PORTB](#PORTB)| |
|54018|$D302|[PACTL](#PACTL)| |
|54019|$D303|[PBCTL](#PBCTL)| |
|54020-54271|$D304-$D3FF| |repeats 54016-54019, no special use |

### ANTIC

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|54272|$D400|[DMACTL](#DMACTL)| |
|54273|$D401|[CHACTL](#CHACTL)| |
|54274,54275|$D402,$D403|[DLISTL](#DLISTL),[DLISTH](#DLISTL)| |
|54276|$D404|[HSCROL](#HSCROL)| |
|54277|$D405|[VSCROL](#VSCROL)| |
|54278|$D406| |unused|
|54279|$D407|[PMBASE](#PMBASE)| |
|54280|$D408| |unused|
|54281|$D409|[CHBASE](#CHBASE)| |
|54282|$D40A|[WSYNC](#WSYNC)| |
|54283|$D40B|[VCOUNT](#VCOUNT)| |
|54284|$D40C|[PENH](#PENH)| |
|54285|$D40D|[PENV](#PENV)| |
|54286|$D40E|[NMIEN](#NMIEN)| |
|54287|$D40F|[NMIST](#NMIST),[NMIRES](#NMIST)| |
|54288-54303|$D410-$D41F| |repeats 54272-54287|

### Cartridge Port

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
| |$D500-$D5FF| |Any read or write to an address in this range enables the cartridge control line [CCNTL](#CCNTL) on the cartridge interface (same as ATARI 400 and ATARI 800)|B

### Reserved


|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
| |$D600-$D6FF| |reserved for future use|B
| |$D700-$D7FF| |reserved for future use|B

### OS ROM

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|55296|$D800|[AFP](#AFP)|ASCII to Floating Point (FP) conversion|
|55526|$D8E6|[FASC](#FASC)|FP value to ASCII conversion|
|55722|$D9AA|[IFP](#IFP)|Integer to FP conversion|
|55762|$D9D2|[FPI](#FPI)|FP to integer conversion|
|55876|$DA44|[ZFR0](#ZFR0)|Clear [FR0](#FR0) at 212 to 217 ($d$-$DB) by setting all bytes to zero|
|55878|$DA46|[ZF1](#ZF1)|Clear the FP number from [FR1](#FR1), locations 224 to 229 ($E0 to $E5), by setting all bytes to zero.|
|55904|$DA60|[FSUB](#FSUB)|FP subtract routine, the value in [FR0](#FR0) minus the value in [FR1](#FR1).|
|55910|$DA66|[FADD](#FADD)|FP addition routine; [FR0](#FR0) plus [FR1](#FR1).|
|56027|$DADB|[FMUL](#FMUL)|FP multiplication routine; [FR0](#FR0) times [FR1](#FR1).|
|56104|$DB28|[FDIV](#FDIV)|FP division routine; [FR0](#FR0) divided by [FR1](#FR1).|
|56640|$DD40|[PLYEVL](#PLYEVL)|FP polynomial evaluation.|
|56713|$DD89|[FLD0R](#FLD0R)|Load the FP number into [FR0](#FR0) from the 6502 X,Y registers.|
|56717|$DD8D|[FLD0P](#FLD0P)|Load the FP number into [FR0](#FR0) from user routine, using [FLPTR](#FLPTR) at 252 ($FC).|
|56728|$DD98|[FLD1R](#FLD1R)|Load the FP number into [FR1](#FR1) from the 6502 X,Y registers.|
|56732|$DD9C|[FLD1P](#FLD1P)|Load the FP number into [FR1](#FR1) from user program, using [FLPTR](#FLPTR).|
|56743|$DDA7|[FSTOR](#FSTOR)|Store the FP number into the 6502 X,Y registers from [FR0](#FR0).|
|56747|$DDAB|[FSTOP](#FSTOP)|Store the FP number from [FR0](#FR0), using [FLPTR](#FLPTR).|
|56758|$DDB6|[FMOVE](#FMOVE)|Move the FP number from [FR0](#FR0) to [FR1](#FR1).|
|56768|$DDC0|[EXP](#EXP)|FP base e exponentiation.|
|56780|$DDCC|[EXP10](#EXP10)|FP base 10 exponentiation.|
|57037|$DECD|[LOG](#LOG)|FP natural logarithm.|
|57041|$DED1|[LOG10](#LOG10)|FP base 10 logarithm.|
| | | | |
|57344|$E000| |Standard ATARI character set, beginning with punctuations and numbers|
|57600|$E100| |capital letters|
|57856|$E200| |special graphics|
|58112|$E300| |lower case letters|
|58367|$E3FF| |end of ATARI standard charset|
| | | | |
|58368|$E400|[EDITRV](#EDITRV)|Screen editor (E:) entry point table|
|58348|$E410|[SCRENV](#SCRENV)|Display handler (television screen) (S:)|
|58400|$E420|[KEYBDV](#KEYBDV)|Jump Table for Keyboard driver "K:"|OSA/OSB/XL
|58416|$E430|[PRINTV](#PRINTV)|Printer handler (P:)|
|58432|$E440|[CASETV](#CASETV)|Cassette handler (C:)|
|58448|$E450|[DISKIV](#DISKIV)|Disk handler initialization vector, initialized to 60906 ($EDEA)|
|58451|$E453|[DSKINV](#DSKINV)|Disk handler (interface) entry; checks the disk status. Initialized to 60912 ($EDF0).|
|58454|$E456|[CIOV](#CIOV)| |
|58457|$E459|[SIOV](#SIOV)| |
|58460|$E45C|[SETVBV](#SETVBV)| |
|58463|$E45F|[SYSVBV](#SYSVBV)| |
|58466|$E462|[XITVBV](#XITVBV)|Exit from the VBLANK routine|
|58469|$E465|[SIOINV](#SIOINV)|SIO utility initialisation, OS use only|
|58472|$E468|[SENDEV](#SENDEV)|Send enable routine, OS use only|
|58475|$E46B|[INTINV](#INTINV)|Interrupt handler initialisation, OS use only|
|58478|$E46E|[CIOINV](#CIOINV)|CIO utility initialisation, OS Use only|
|58481|$E471|[BLKBDV](#BLKBDV)|Blackboard Mode Entry|
|58484|$E474|[WARMSV](#WARMSV)|Warm Start Vector|
|58487|$E477|[COLDSV](#COLDSV)|Cold Start Vector|
|58490|$E47A|[RBLOKV](#RBLOKV)|reads block from C:|
|58493|$E47D|[CSOPIV](#CSOPIV)|opens channel for C:|
|58496|$E480|[PUPDIV](#PUPDIV)|Vector for Self Test|X
|58499|$E483|[SLFTSV](#SLFTSV)| |X
|58502|$E486|[PHENTV](#PHENTV)| |X
|58505|$E489|[PHULNV](#PHULNV)| |X
|58508|$E48C|[PHINIV](#PHINIV)| |X
|58511|$E48F|[GPDVV](#GPDVV)| |X
| | | | |
| | | | |to be completed ...
| | | | |
|59310|$E7AE|[SYSVBL](#SYSVBL)|X|
|59345|$E7D1|[SYSVBL](#SYSVBL)|A|
| | | | |
|65527|$FFF7| |[can be used to identify OS version](#OS_Versions)|
|65528|$FFF8|[CHKSUN](#CHKSUN)|[can be used to identify OS version](#OS_Versions)|
|65530,65531|$FFFA,$FFFB|[PVECT](#PVECT)| |


"# Memory Map"
### 4_color_character

# 4-color Characters
The color of each pixel (4 in a line instead of the usual 8) depends on the bit combination of the byte in the character definition.

||Bit Pair||Color||Address dec||Address hex||comment
|00|[COLOR4](#COLOR4) BAK|712|$02C8|
|01|[COLOR0](#COLOR0) PF0|708|$02C4|
|10|[COLOR1](#COLOR1) PF1|709|$02C5|
|11|[COLOR2](#COLOR2) PF2|710|$02C6|if bit 7 of character code = 0
|11|[COLOR3](#COLOR3) PF3|711|$02C7|if bit 7 of character code = 1

# Example
character "A" (code=65) would be displayed as
```
00000000 BAK BAK BAK BAK
00011000 BAK PF0 PF1 BAK
00111100 BAK PF2 PF2 BAK compare with line 3 below
01100110 PF0 PF1 PF0 PF1
01100110 PF0 PF1 PF0 PF1
01111110 PF0 PF2 PF2 PF1 compare with line 6 below
01100110 PF0 PF1 PF0 PF1
00000000 BAK BAK BAK BAK
```

character "inverse A" (code=193, Bit 7 set because inverse video is on!) would be displayed as
```
00000000 BAK BAK BAK BAK
00011000 BAK PF0 PF1 BAK
00111100 BAK PF3 PF3 BAK compare with line 3 above
01100110 PF0 PF1 PF0 PF1
01100110 PF0 PF1 PF0 PF1 
01111110 PF0 PF3 PF3 PF0 compare with line 6 above
01100110 PF0 PF1 PF0 PF1
00000000 BAK BAK BAK BAK
```

To try this, type (works only on an ATARI XL or XE):
```
GRAPHICS 13:? #6;"A A A":? #6;"A A A":REM the second 3 "A"s are inverse video!
```
![](#attachments/GR13DEMO.png)
---
see also: [Color topics](#Color_topics), [topic_list](#topic_list) 
### ABUFPT


||ADR||HEXADR||NAME||Description||shadow||OS
|28-31|$001C,$001F|ABUFPT| | |XL

Register für interne Testzwecke
### ADRESS

||ADR||HEXADR||NAME||Description||shadow||OS
|100,101|$0064,$0065|ADRESS| | |All


Ein temporärer Speicher, der vom Bildschirm-Handler genutzt wird. Hier ein Anwendungsbeispiel in [Action!](#OS_Vectors) 

Temporary storage locations for the screen handler. Here is an example in [Action!](#OS_Vectors) 

```
PROC JMP =$F2AD ()

PROC Jump (CARD adr)

  CARD addr=$64
  addr=adr
  JMP ()

RETURN
```
### ALLPOT

ALLPOT


||ADR||HEXADR||NAME||Description||shadow||OS
|14,15|$000E,$000F|APPMHI|__APP__lications __M__emory __HI__gh limit| |all

Dieser Zeiger gibt an, bis zu welcher Adresse sich ein Programm oder Daten erstrecken können.
Damit Benutzerdaten bzw. Programmdaten nicht überschriben werden, wird bei Aufruf eines GRAPHICS-Befehles oder eines OPEN-Befehl für den Bildschirm über die CIO in Maschinensprache oberhalb von APPMHI geprüft ob genügend Speicher für die Bildschirmdaten und die Displayliste zur Verfügung stehen.
Fällt diese Prüfung postiv aus, wird der Befehl ausgefürt, andernfalls wird in GRAPHICS 0 zurückgeschaltet und ein Fehler ausgegeben.

---

Siehe auch:
*[MEMTOP](#MEMTOP) - Adresse oberhalb derer die Bildschirmdaten und die Displaylist liegen können

### ATRACT

||ADR||HEXADR||NAME||Description||shadow||OS
|77|$004D|ATRACT|Attract mode timer and flag|none|All

Attract mode rotates colors on your screen at low luminance levels when the computer is on but no keyboard input is read for a long time (seven to nine minutes). This helps to save your TV screen from "burn-out" damage suffered from being left on and not used. It is set to zero by IRQ whenever a key is pressed, otherwise incremented every four seconds by VBLANK (see locations 18 - 20; $12 - $14). When the value in ATRACT reaches 127 ($7F), it is then set to 254 ($FE) until attract mode is terminated. This sets the flag to reduce the luminance and rotate the colors when the Atari is sitting idle. POKE with 128 ($80) to see this effect immediately: it normally takes seven to nine minutes to enable the attract mode. The OS cannot "attract" color generated by DLI's, although your DLI routine can, at a loss of time.
Joysticks alone will not reset location 77 to zero. You will have to add a POKE 77,0 to your program periodically or frequently call in a subroutine to prevent the Atari from entering attract mode if you are not using any keyboard input.


See also:

[DRKMSK](#DRKMSK), [COLRSH](#COLRSH) 
### AUDC1

||Read/Write||ADR||HEXADR||NAME||Description||shadow||OS
|Read|53761|$D201|POT1|Pot/paddle 1|625|all
|Write|53761|$D201|AUDC1| Audio channel 1 control|none|all

||Bit||Description
|7,6,5|Distortion
|4|Volume only
|3,2,1,0|Volume

Volume from 0 to 15 (16 steps)

||7||6||5||description of distortion
|1|1|1|rectangular curve
|1|1|0|4-bit poly
|1|0|1|rectangular curve
|1|0|0|17-bit-poly
|0|1|1|5-bit poly
|0|1|0|5-bit poly, then 4-bit-poly
|0|0|1|5-bit poly
|0|0|0|5-bit poly, then 17-bit-poly

---

see also: [Sound_Topics](#Sound_Topics), [AUDCTL](#AUDCTL), [STIMER](#KBCODE) 

previous: [AUDF1](#AUDF1) 

next: [AUDF2](#AUDF2) 
### AUDC2

||Read/Write||ADR||HEXADR||NAME||Description||shadow||OS
|Read|53763|$D203|POT3|Pot/paddle 3|627|all
|Write|53763|$D203|AUDC2| Audio channel 2 control|none|all

||Bit||Description
|7,6,5|Distortion
|4|Volume only
|3,2,1,0|Volume

Volume from 0 to 15 (16 steps)

||7||6||5||description of distortion
|1|1|1|rectangular curve
|1|1|0|4-bit poly
|1|0|1|rectangular curve
|1|0|0|17-bit-poly
|0|1|1|5-bit poly
|0|1|0|5-bit poly, then 4-bit-poly
|0|0|1|5-bit poly
|0|0|0|5-bit poly, then 17-bit-poly

---

see also: [Sound_Topics](#Sound_Topics), [AUDCTL](#AUDCTL), [STIMER](#KBCODE) 

previous: [AUDF2](#AUDF2) 

next: [AUDF3](#AUDF3) 
### AUDC3

||Read/Write||ADR||HEXADR||NAME||Description||shadow||OS
|Read|53765|$D205|POT5|Pot/paddle 5|629|all
|Write|53765|$D205|AUDC3| Audio channel 3 control|none|all

||Bit||Description
|7,6,5|Distortion
|4|Volume only
|3,2,1,0|Volume

Volume from 0 to 15 (16 steps)

||7||6||5||description of distortion
|1|1|1|rectangular curve
|1|1|0|4-bit poly
|1|0|1|rectangular curve
|1|0|0|17-bit-poly
|0|1|1|5-bit poly
|0|1|0|5-bit poly, then 4-bit-poly
|0|0|1|5-bit poly
|0|0|0|5-bit poly, then 17-bit-poly

---

see also: [Sound_Topics](#Sound_Topics), [AUDCTL](#AUDCTL), [STIMER](#KBCODE) 

previous: [AUDF3](#AUDF3) 

next: [AUDF4](#AUDF4) 
### AUDC4

||Read/Write||ADR||HEXADR||NAME||Description||shadow||OS
|Read|53767|$D207|POT7|Pot/paddle 7|631|all
|Write|53767|$D207|AUDC4| Audio channel 4 control|none|all

||Bit||Description
|7,6,5|Distortion
|4|Volume only
|3,2,1,0|Volume

Volume from 0 to 15 (16 steps)

||7||6||5||description of distortion
|1|1|1|rectangular curve
|1|1|0|4-bit poly
|1|0|1|rectangular curve
|1|0|0|17-bit-poly
|0|1|1|5-bit poly
|0|1|0|5-bit poly, then 4-bit-poly
|0|0|1|5-bit poly
|0|0|0|5-bit poly, then 17-bit-poly

---

see also: [Sound_Topics](#Sound_Topics), [AUDCTL](#AUDCTL), [STIMER](#KBCODE) 

previous: [AUDF4](#AUDF4) 

next: [AUDCTL](#AUDCTL) 
### AUDCTL

||Read/Write||ADR||HEXADR||NAME||Description||OS
|Read|53768|$D208|ALLPOT|Audio control|all
|Write|53768|$D208|AUDCTL|Pot Port State|all

# AUDCTL (Write)
AUDCTL is the option byte which affects all sound channels. This bit assignment is:
||Bit||Description
|7|	0=17 bit poly counter 1=9 bit polynomial noise
|6|	0=clock channel 1 with 64kHz1=Clock channel one with 1.79 MHz (NTSC) or 1.77MHz (PAL)
|5|	0=clock channel 3 with 64kHz1=Clock channel three with 1.79 MHz (NTSC) or 1.77MHz (PAL)
|4|	0=clock channel 2 with 64kHz1=Join channels two and one (16 bit, with 2/4=MSB, 1/2=LSB)
|3|	0=clock channel 4 with 64kHz1=Join channels four and three (16 bit, with 2/4=MSB, 1/2=LSB)
|2|	1=Insert high pass filter into channel one, clocked by channel two
|1|	1=Insert high pass filter into channel three, clocked by channel four
|0|	0=main clock base 64 KHz1=16 KHz main clock base

# ALLPOT (Read)
Shows if the readings of the pots are (already) valid.
||Bit||Paddle||Shadow||Register
|0|Paddle 0| [PADDL0](#PADDL0)| [POT0](#POT0) 
|1|Paddle 1| [PADDL1](#PADDL1)| [POT1](#POT1) 
|2|Paddle 2| [PADDL2](#PADDL2)| [POT2](#POT2) 
|3|Paddle 3| [PADDL3](#PADDL3)| [POT3](#POT3) 
|4|Paddle 4| [PADDL4](#PADDL4)| [POT4](#POT4) 
|5|Paddle 5| [PADDL5](#PADDL5)| [POT5](#POT5) 
|6|Paddle 6| [PADDL6](#PADDL6)| [POT6](#POT6) 
|7|Paddle 7| [PADDL7](#PADDL7)| [POT7](#POT7) 
If a bit equals zero (0), then the register value for that pot (e.g. Bit 0 = [POT0](#POT0)) is valid; if the Bit is one (1), then the value is not (yet) valid, because the reading/scan is not finished yet or there is no paddle connected.

---
see also: [Controller topics](#Controller_topics), [POTGO](#POTGO), [ALLPOT](#ALLPOT), [SKCTL](#SKCTL) 

previous: [AUDC4](#AUDC4),[POT7](#POT7) 

next: [STIMER](#KBCODE),[KBCODE](#KBCODE) 
### AUDF1

||Read/Write||ADR||HEXADR||NAME||Description||shadow||OS
|Read|53760|$D200|POT0|Pot/paddle 0|624|all
|Write|53760|$D200|AUDF1| Audio channel 1 frequency |none|all

## Read
Reads the value of pot (paddle) 0.

## Write
Frequency of Audio channel 1. This value can be between 0 ($00) and 255 ($FF), where 0 is the highest tone/pitch and 255 is the lowest tone/pitch.


With a base frequency of 64kHz, distortion=10 and A3=443Hz the following values define the respective notes for PAL-ATARIs
||Oktave||C||#C||D||#D||E||F||#F||G||#G||A||#A||H
|2|239|226|213|201|190|179|169|159|150|142|134|126
|3|119|112|106|100|94|89|84|79|75|70|66|63
|4|59|56|53|50|47|44|42|39|37|35|33|31
|5|29|27|26|24|23|22|20|19|18|17|16|15
|6|14|13|(12)|(12)|11|10| |9| |8| |7

For NTSC-ATARIs use the following values defining the respective notes (distortion=10, A3=443Hz)
||Oktave||C||#C||D||#D||E||F||#F||G||#G||A||#A||H
|2|243|230|217|204|193|182|173|162|153|144|136|128
|3|121|114|108|102|96|91|85|81|76|72|68|64
|4|60|57|53|50|47|45|42|40|37|35|33|31
|5|29|27|26|24|23|22|20|19|18|17|16|15



Use [AUDC1](#AUDC1) to set distortion and volume for channel 1.
---

see also: [Sound_Topics](#Sound_Topics), [AUDCTL](#AUDCTL), [STIMER](#KBCODE) 

previous: [CONSOL](#CONSOL) of GTIA

next: [AUDC1](#AUDC1) 
### AUDF2

||Read/Write||ADR||HEXADR||NAME||Description||shadow||OS
|Read|53762|$D202|POT2|Pot/paddle 2|626|all
|Write|53762|$D202|AUDF2| Audio channel 2 frequency |none|all

## Read
Reads the value of pot (paddle) 2.

## Write
Frequency of Audio channel 1. This value can be between 0 ($00) and 255 ($FF), where 0 is the highest tone/pitch and 255 is the lowest tone/pitch.


With a base frequency of 64kHz, distortion=10 and A3=443Hz the following values define the respective notes for PAL-ATARIs
||Octave||C||#C||D||#D||E||F||#F||G||#G||A||#A||H
|2|239|226|213|201|190|179|169|159|150|142|134|126
|3|119|112|106|100|94|89|84|79|75|70|66|63
|4|59|56|53|50|47|44|42|39|37|35|33|31
|5|29|27|26|24|23|22|20|19|18|17|16|15
|6|14|13|(12)|(12)|11|10| |9| |8| |7

For NTSC-ATARIs use the following values defining the respective notes (distortion=10, A3=443Hz)
||Octave||C||#C||D||#D||E||F||#F||G||#G||A||#A||H
|2|243|230|217|204|193|182|173|162|153|144|136|128
|3|121|114|108|102|96|91|85|81|76|72|68|64
|4|60|57|53|50|47|45|42|40|37|35|33|31
|5|29|27|26|24|23|22|20|19|18|17|16|15



Use [AUDC2](#AUDC2) to set distortion and volume for channel 2.
---

see also: [Sound_Topics](#Sound_Topics), [AUDCTL](#AUDCTL), [STIMER](#KBCODE) 

previous: [AUDC1](#AUDC1) 

next: [AUDC2](#AUDC2) 
### AUDF3

||Read/Write||ADR||HEXADR||NAME||Description||shadow||OS
|Read|53764|$D204|POT4|Pot/paddle 4|628|all
|Write|53764|$D204|AUDF3| Audio channel 3 frequency |none|all

## Read
Reads the value of pot (paddle) 4.

## Write
Frequency of Audio channel 3. This value can be between 0 ($00) and 255 ($FF), where 0 is the highest tone/pitch and 255 is the lowest tone/pitch.


With a base frequency of 64kHz, distortion=10 and A3=443Hz the following values define the respective notes for PAL-ATARIs
||Oktave||C||#C||D||#D||E||F||#F||G||#G||A||#A||H
|2|239|226|213|201|190|179|169|159|150|142|134|126
|3|119|112|106|100|94|89|84|79|75|70|66|63
|4|59|56|53|50|47|44|42|39|37|35|33|31
|5|29|27|26|24|23|22|20|19|18|17|16|15
|6|14|13|(12)|(12)|11|10| |9| |8| |7

For NTSC-ATARIs use the following values defining the respective notes (distortion=10, A3=443Hz)
||Oktave||C||#C||D||#D||E||F||#F||G||#G||A||#A||H
|2|243|230|217|204|193|182|173|162|153|144|136|128
|3|121|114|108|102|96|91|85|81|76|72|68|64
|4|60|57|53|50|47|45|42|40|37|35|33|31
|5|29|27|26|24|23|22|20|19|18|17|16|15



Use [AUDC3](#AUDC3) to set distortion and volume for channel 3.
---

see also: [Sound_Topics](#Sound_Topics), [AUDCTL](#AUDCTL), [STIMER](#KBCODE) 

previous: [AUDC2](#AUDC2) 

next: [AUDC3](#AUDC3) 
### AUDF4

||Read/Write||ADR||HEXADR||NAME||Description||shadow||OS
|Read|53766|$D206|POT6|Pot/paddle 6|630|all
|Write|53766|$D206|AUDF4| Audio channel 4 frequency |none|all

## Read
Reads the value of pot (paddle) 6.

## Write
Frequency of Audio channel 4. This value can be between 0 ($00) and 255 ($FF), where 0 is the highest tone/pitch and 255 is the lowest tone/pitch.


With a base frequency of 64kHz, distortion=10 and A3=443Hz the following values define the respective notes for PAL-ATARIs
||Oktave||C||#C||D||#D||E||F||#F||G||#G||A||#A||H
|2|239|226|213|201|190|179|169|159|150|142|134|126
|3|119|112|106|100|94|89|84|79|75|70|66|63
|4|59|56|53|50|47|44|42|39|37|35|33|31
|5|29|27|26|24|23|22|20|19|18|17|16|15
|6|14|13|(12)|(12)|11|10| |9| |8| |7

For NTSC-ATARIs use the following values defining the respective notes (distortion=10, A3=443Hz)
||Oktave||C||#C||D||#D||E||F||#F||G||#G||A||#A||H
|2|243|230|217|204|193|182|173|162|153|144|136|128
|3|121|114|108|102|96|91|85|81|76|72|68|64
|4|60|57|53|50|47|45|42|40|37|35|33|31
|5|29|27|26|24|23|22|20|19|18|17|16|15



Use [AUDC4](#AUDC4) to set distortion and volume for channel 4.
---

see also: [Sound_Topics](#Sound_Topics), [AUDCTL](#AUDCTL), [STIMER](#KBCODE) 

previous: [AUDC3](#AUDC3) 

next: [AUDC4](#AUDC4) 
### BOOT

||ADR||HEXADR||NAME||Description||OS
|9|$09|BOOT?| |all

DISKBOOT setzt BIT 0, Kassette BIT 1
### BRKKEY

||ADR||HEXADR||NAME||Description||shadow||OS
|17|$11|BRKKEY| |X|


''__copied from "Mapping the ATARI" as an example only! Needs to be re-written or completely written from scratch!__''

17	$0011	BRKKEY

Zero means the BREAK key is pressed; any other number means it's not. A BREAK during I/O returns 128 ($80). Monitored by both keyboard, display, cassette and screen handlers. See [POKMSK](#POKMSK) location 16 ($A) for hints on disabling the BREAK key. The latest editions of OS provide for a proper vector for BREAK interrupts. The BREAK key abort status code is stored in [STATUS](#STATUS) (48; $30).

It is also checked during all I/O and scroll/draw routines. During the keyboard handler routine, the status code is stored in DSTAT (76; $4C). BRKKEY is turned off at powerup. BREAK key abort status is flagged by setting BIT 7 of 53774 ($D20E). See the note on the BREAK key vector, above.
### BRKKY

||Dec||Hex||Name
|566,567|$0236,$0237|BRKKY

Break key interrupt vector. Only in OS "B" and later versions. Initialized to 59220 ($E754)

see also:
[POKMSK](#POKMSK), [IRQEN](#IRQEN) 
### BUFADR

||ADR||HEXADR||NAME||Description||shadow||OS
|21,22|$15,$16|BUFADR| | |

Pointer auf den momentanen Disk-Buffer
### CASINI

||ADR||HEXADR||NAME||Description||shadow||OS
|2,3|$0002,$0003|CASINI| | |all

Durch diese Adresse wird bei der Initialisierung eines Bootprogrammes von Kassette gesprungen. Die hier abgelegten Daten stammen aus dem 5. und 6. Byte des ersten Records (jeder Record umfasst 128 Bytes) eines Kassettenfiles. Sie repräsentieren die Startadresse des geladenen Programms.

Die ersten sechs Byte eines Kasstten-Boot-Record werden wie folgt genutzt:
||1|wird ignoriert
||2|Anzahl der zu ladenden Blöcke
||3,4|Ladeadresse des Programms
||5,6|Startadresse des Programms

### CASSBT

||ADR||HEXADR||NAME||Description||shadow||OS
|75|$004B|CASSBT|Cassette boot flag|none|A
|1002|$03EA|CASSBT|Cassette boot flag|none|X

The Atari attempts both a disk and a cassette boot simultaneously. Zero here means no cassette boot was successful. See location 9/$9 [BOOT](#BOOT) 
### CH

||ADR||HEXADR||NAME||Description||OS
|764|$02FC|CH|internal key code|all

Enthält den internen Tastaturcode der gedrückten Taste. Manchmal hat der ATARI noch ein Zeichen im Speicher, welches vor längerer Zeit gedrückt wurde; möchte man dies verhindern, schreibt man $FF (255) in die Speicherzelle $02FC (764).

The value $11 (or $51 or $91) for the HELP key does never appear in [CH](#CH)! It does appear in [KBCODE](#KBCODE) and is transferred from there to [HELPFG](#HELPFG).

## Hexadecimal Values
|| ||$00||$01||$02||$03||$04||$05||$06||$07||$08||$09||$0A||$0B||$0C||$0D||$0E||$0F
|$00|L|J|;|F1|F2|K|+|*|O| |P|U|CR|I|-|=
|$10|V| |C|F3|F4|B|X|Z|4| |3|6|Esc|5|2|1
|$20|,|Spc|.|N| |M|/|Inv|R| |E|Y|Tab|T|W|Q
|$30|9| |0|7|BS|8|<|>|F|H|D| |Caps|G|S|A

together with Shift Key: add 64 ($40)
together with Control key: add 128 ($80)

## Decimal Values
||.. ||.0||.1||.2||.3||.4||.5||.6||.7||.8||.9
|0.|L|J|;|F1|F2|K|+|*|O|
|1.|P|U|CR|I|-|=|V| |C|F3
|2.|F4|B|X|Z|4| |3|6|Esc|5
|3.|2|1|,|Spc|.|N| |M|/|Inv
|4.|R| |E|Y|Tab|T|W|Q|9|
|5.|0|7|BS|8|<|>|F|H|D|
|6.|Caps|G|S|A

Spc SPACE, CR RETURN, Tab TAB, Caps CAPS, Inv INVERS/ATARI-Key, Esc Escape, BS BACKSPACE, Help HELP

together with Shift Key: add 64 ($40)
together with Control key: add 128 ($80)

---
see also: [Keyboard topics](#Keyboard_topics) [Console Keys](#CONSOL) [HELP](#HELPFG) 
### CH1

||Adr||Hex||Name||Description||OS
|754|$02F2|CH1|prior key pressed|all

Prior keyboard character code (most recently read and accepted). This is the previous value passed from [CH](#CH) (764/$2FC). If the value of the new key code equals the value in CH1, then the code is accepted only if a suitable key debounce delay has taken place since the prior value was accepted.

see also: [Keyboard topics](#Keyboard_topics), [CH](#CH) 
### CHACT

||R/W||Adr||Hex||Name||description||OS||Shadow of
|R/W|755|$02F3|CHACT|Character display mode|all|[CHACTL](#CHACTL) 54273/$D401

Character Mode Register. Zero means normal inverse characters, one is blank inverse characters (inverse characters will be printed as blanks, i.e., invisible), two is normal characters, three is solid inverse characters. Four to seven is the same as zero to three, but prints the display upside down. This register also controls the transparency of the cursor. It is transparent with values two and six, opaque with values three and seven. The cursor is absent with values zero, one, four and five.

See [CHACTL](#CHACTL) for a table with explanations.

see also: [CRSINH](#CRSINH), [ANTIC](#ANTIC) 
### CHACTL

||R/W||Adr||Hex||Name||Description||OS||Shadow
|W|54273|$D401|CHACTL|Cursor- und Zeichendarstellung|all|[CHACT](#CHACT) 755/$2F3

||Bit||Funktion
|7|nichts
|6|nichts
|5|nichts
|4|nichts
|2|Zeichen stehen auf dem Kopf
|1|Inverse Zeichen werden dargestellt
|0|Inverse Zeichen werden undurchsichtig dargestellt

---
see also: [CRSINH](#CRSINH) 

previous: [DMACTL](#DMACTL) 

next: [DLISTL](#DLISTL),[DLISTH](#DLISTL) 
### Character_Sets

# Character Sets



---
see also: [topic_list](#topic_list), [4_color_character](#4_color_character), [CHBAS](#CHBAS) 
### CHBAS

||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW OF||OS
|756|$02F4|CHBAS|Zeichensatzadresse|224 ($E0)|[CHBASE](#CHBASE) |all

Defaultwert: 224 ($E0) - Adresse des ROM-Zeichensatzes
Internationaler Zeichensatz (X): 204 ($CC)

Dieses Register ist die Basisadresse des Zeichensatzes.
Es ist die Adresse, ab der das Aussehen der Zeichen auf dem Bildschirm definiert wird. Zeichensatzdefinitionen müssen in der GRAPHICS 0 auf einer 1KByte-Grenze beginnen. In den Grafikstufen 1 und 2 muss die Definition auf einer geraden Seitengrenze beginnen; die Startadresse eines Zeichensatzes muss demnach ein Vielfaches von 512 ($200) sein. In CHBAS wird nur die Seitennummer (das High-Byte der Adresse) abgelegt.

Durch Neuinitialisierung bzw. Änderung der Grafikstufe oder durch das Drücken von RESET wird das Register auf den Default-Wert zurückgesetzt.
Die Zeichen sind nicht in der ATASCII-Reihenfolge, sondern in der „internen“ Reihenfolge im Zeichensatz abgespeichert.

---
see also: [Character_Sets](#Character_Sets), [topic_list](#topic_list) 
### CHBASE

||DEC||HEX||NAME||SHADOW
|54281|$D409|CHBASE|[CHBAS](#CHBAS) 

Details see [CHBAS](#CHBAS) 

---
see also: [Character_Sets](#Character_Sets) 

previous: [PMBASE](#PMBASE) 

next: [WSYNC](#WSYNC) 
### CKEY

||ADR||HEXADR||NAME||Description||shadow||OS
|74|$004A|CKEY|Cassette boot request flag on coldstart|none|A
|1001|$03E9|CKEY|Cassette boot request flag on coldstart|none|X

Checks to see if the START key is pressed and, if so, CKEY is set. Autoboot cassettes are loaded by pressing the START console key while turning the power on. In response to the beep, press the PLAY button on the recorder.
### COLBK

||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW||OS
|53274|$D01A|COLBK|Background Color Register|0 ($00)|[COLOR4](#COLOR4) |all
---
see also: [Color topics](#Color_topics) 

previous: 53273, $D019, [COLPF3](#COLPF3), Color Register 3

next: 53275, $D01B, [PRIOR](#PRIOR), PM Priority Selection Register
### COLCRS

||ADR||HEXADR||NAME||Description||shadow||OS
|85,86|$0055,$0056|COLCRS|Current cursor column|none|All

Current graphics or text mode cursor column; values range from zero to 319 (high byte, for screen mode eight) depending on current GRAPHICS mode (maximum numher of columns minus one). Location 86 will always be zero in modes zero through seven. Home position is 0,0 (upper left-hand corner). Columns run vertically from the top to the bottom down the TV screen, the leftmost column being number zero, the rightmost column the maximum value in that mode. The cursor has a complete top to bottom, left to right wraparound on the screen.

[ROWCRS](#ROWCRS) and [COLCRS](#COLCRS) define the cursor location for the next element to be read from or written to in the main screen segment of the display. For the text window cursor, values in locations 656 to 667 ($290 to $29B) are exchanged with the current values in locations 84 to 95 ($54 to $5F), and location 123 ($7B) is set to 255 ($FF) to indicate the swap has taken place. [ROWCRS](#ROWCRS) and [COLCRS](#COLCRS) are also used in the DRAW and FILL functions to contain the values of the endpoint of the line being drawn. The color of the line is kept in location 763 ($2FB). These values are loaded into locations 96 to 98 ($60 to $62) so that [ROWCRS](#ROWCRS) and [COLCRS](#COLCRS) may be altered during the operation.

Previous: [ROWCRS](#ROWCRS) 

Next: [DINDEX](#DINDEX) 
### COLINC

||ADR||HEXADR||NAME||Description||shadow||OS
|122|$007A|COLINC| |none|A
The column increment or decrement value (plus or minus one). [ROWINC](#ROWINC) and [COLINC](#COLINC) control the direction of the line drawing routine. The values represent the signs derived from the value in [NEWROW](#NEWROW) (location 96/$60) minus the value in [ROWCRS](#ROWCRS) (location 84/$54) and the value in [NEWCOL](#NEWCOL) (locations 97,98/$61,$62) minus the value in [COLCRS](#COLCRS) (locations 85,86/$55,$56).
### COLOR0

||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW||OS
|708|$02C4|COLOR0|Color Register 0|40 ($28)|[COLPF0](#COLPF0) |all

Farbregister für Anzeigefeld 0.
GR. 1 und 2 Farberegister für die Großbuchstaben.

---
see also: [Color topics](#Color_topics) 

previous: 707, $02C3, [PCOLR3](#PCOLR3), Player/Missile 3 Color Register

next: 709, $02C5, [COLOR1](#COLOR1), Color Register 1
### COLOR1

||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW||OS
|709|$02C5|COLOR1|Color Register 1|202 ($CA)|[COLPF1](#COLPF1) |all

Farbe für Anzeigefeld 1.
GR. 1 und 2 Farbregister für die Kleinbuchstaben
GR. 0 und 8 Regsiter für den Helligkeitswert für Buchstaben bzw. Punkte.

---
see also: [Color topics](#Color_topics) 

previous: 708, $02C4, [COLOR0](#COLOR0), Color Register 0

next: 710, $02C6, [COLOR2](#COLOR2), Color Register 2
### COLOR2

||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW||OS
|710|$02C6|COLOR2|Color Register 2|148 ($94)|[COLPF2](#COLPF2) |all

Farbe für Anzeigefeld 2.
GR. 1 und 2 Farbregister für die inversen Großbuchstaben
GR. 0 und 8 Register für die Hintergrundfarbe der Buchstaben bzw. Punkte.
---
see also: [Color topics](#Color_topics) 

previous: 709, $02C5, [COLOR1](#COLOR1), Color Register 1

next: 711, $02C7, [COLOR3](#COLOR3), Color Register 3
### COLOR3

||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW||OS
|711|$02C7|COLOR3|Color Register 3|70 ($46)|[COLPF3](#COLPF3) |all
Farbregister für Anzeigefeld 3.
GR. 1 und 2: Farbwertregister für die inversen Kleinbuchstaben.

---
see also: [Color topics](#Color_topics) 

previous: 710, $02C6, [COLOR2](#COLOR2), Color Register 2

next: 712, $02C8, [COLOR4](#COLOR4), Color Register 4
### COLOR4

||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW||OS
|712|$02C8|COLOR4|Color Register 4|0 ($00)|[COLBK](#COLBK) |all
Register für die Hintergrundfarbe.
In GR. 10 wird es zu einem normalen Farbregister (Hintergrundfrabe: [PCOLR0](#PCOLR0))

---
see also: [Color topics](#Color_topics) 

previous: 711, $02C7, [COLOR3](#COLOR3), Color Register 3
### Color_topics

# Color topics

[Standard_colors](#Standard_colors) 

[Color_names](#Color_names) 

[4-color characters](#4_color_character) 

[Table_of_Modes_and_Screen_Format](#Table_of_Modes_and_Screen_Format) 

[Mode_Setcolor_Color_Table](#Mode_Setcolor_Color_Table) 

### Playfield/Character Colors

Registers [COLPF0](#COLPF0) [COLPF1](#COLPF1) [COLPF2](#COLPF2) [COLPF3](#COLPF3) [COLBK](#COLBK) 

Shadows [COLOR0](#COLOR0) [COLOR1](#COLOR1) [COLOR2](#COLOR2) [COLOR3](#COLOR3) [COLOR4](#COLOR4) 


### Player/Missile Colors

Registers [COLPM0](#COLPM0) [COLPM1](#COLPM1) [COLPM2](#COLPM2) [COLPM3](#COLPM3) 

Shadows [PCOLR0](#PCOLR0) [PCOLR1](#PCOLR1) [PCOLR2](#PCOLR2) [PCOLR3](#PCOLR3) 


---
see [topic_list](#topic_list), [Pm_topics](#Pm_topics) 
### COLPF0

||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW||OS
|53270|$D016|COLPF0|Color Register 0|40 ($28)|[COLOR0](#COLOR0) |all
---
see also: [Color topics](#Color_topics) 

previous: 53269, $D015, [COLPM3](#COLPM3), Player/Missile 3 Color Register

next: 53271, $D017, [COLPF1](#COLPF1), Color Register 1
### COLPF1

||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW||OS
|53271|$D017|COLPF1|Color Register 1|202 ($CA)|[COLOR1](#COLOR1) |all
---
see also: [Color topics](#Color_topics) 

previous: 53270, $D016, [COLPF0](#COLPF0), Color Register 0

next: 53272, $D018, [COLPF2](#COLPF2), Color Register 2
### COLPF2

||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW||OS
|53272|$D018|COLPF2|Color Register 2|148 ($94)|[COLOR2](#COLOR2) |all
---
see also: [Color topics](#Color_topics) 

previous: 53271, $D017, [COLPF1](#COLPF1), Color Register 1

next: 53273, $D019, [COLPF3](#COLPF3), Color Register 3
### COLPF3

||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW||OS
|53273|$D019|COLPF3|Color Register 3|70 ($46)|[COLOR3](#COLOR3) |all
---
see also: [Color topics](#Color_topics) 

previous: 53272, $D018, [COLPF2](#COLPF2), Color Register 2

next: 53274, $D01A, [COLBK](#COLBK), Background Color Register
### COLPM0

||R/W||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW||OS
|W|53266|$D012|COLPM0|Color of Player and Missile 0|0|[PCOLR0](#PCOLR0)|all
|R|53266|$D012|TRIG2|Trigger Joystick 2|n/a|[STRIG2](#STRIG2)|all

Missiles have the same color as corresponding Players (e.g. P0=M0, P1=M1, ...) except when joined together as 5th player by setting Bit 4 of [PRIOR](#PRIOR)/[GPRIOR](#GPRIOR). Then they have the color of register 3 [COLOR3](#COLOR3)/[COLPF3](#COLPF3).

TRIG2: only on 400 and 800 machines, else a copy of [STRIG0](#STRIG0). 0 when trigger pressed, 1 when trigger released

---
see also: [Color topics](#Color_topics), [Controller topics](#Controller_topics) 

previous: 53265, $D011, [GRAFM](#GRAFM), Graphics for Missiles

next: 53267, $D013, [COLPM1](#COLPM1), Color of Player and Missile 1
### COLPM1

||R/W||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW||OS
|W|53267|$D013|COLPM1|Color of Player and Missile 1|0|[PCOLR1](#PCOLR1)|all
|R|53267|$D013|TRIG3|Joystick Trigger 3|n/a|[STRIG3](#STRIG3)|all

Missiles have the same color as corresponding Players (e.g. P0=M0, P1=M1, ...) except when joined together as 5th player by setting Bit 4 of [PRIOR](#PRIOR)/[GPRIOR](#GPRIOR). Then they have the color of register 3 [COLOR3](#COLOR3)/[COLPF3](#COLPF3).

TRIG3: only on 400 and 800 machines, else a copy of [STRIG1](#STRIG1).
0 when trigger pressed, 1 when trigger released

---
see also: [Color topics](#Color_topics), [Controller topics](#Controller_topics) 

previous: 53266, $D012, [COLPM0](#COLPM0), Color of Player and Missile 0

next: 53268, $D014, [COLPM2](#COLPM2), Color of Player and Missile 2 (W), [PAL](#PAL) (R)
### COLPM2

||R/W||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW||OS
|W|53268|$D014|COLPM2|Color of Player and Missile 2|0|[PCOLR2](#PCOLR2)|all
|R|53268|$D014|PAL|Determine TV System|see below|none|all

Missiles have the same color as corresponding Players (e.g. P0=M0, P1=M1, ...) except when joined together as 5th player by setting Bit 4 of [PRIOR](#PRIOR)/[GPRIOR](#GPRIOR). Then they have the color of register 3 [COLOR3](#COLOR3)/[COLPF3](#COLPF3).

PAL (R) Used to determine if the Atari is PAL (European and Israeli TV compatible when BITs 1 - 3 equal zero) or NTSC (North American compatible when BITs 1 - 4 equal one; 14 decimal, $F). European Ataris run 12% slower if tied to the VBLANK cycle (the PAL VBLANK cycle is every 50th second rather than every 60th second). They use only one CPU clock at three MHZ, so the 6502 runs at 2.217 MHZ -- 25% faster than North American Ataris. Also, their $E000 and $F000 ROMs are different, so there are possible incompatibilities with North American Ataris in the cassette handling routines. There is a third TV standard called SECAM, used in France, the USSR, and parts of Africa. I am unaware if there is any Atari support for SECAM standards.
PAL TV has more scan lines per frame, 312 compared to 262. NTSC Ataris compensate by adding extra lines at the beginning of the VBLANK routine. Display lists do not have to be altered, and colors are the same because of a hardware modification.

See also: [PALNTS](#PALNTS) 


---
see also: [Color topics](#Color_topics) 

previous: 53267, $D013, [COLPM1](#COLPM1), Color of Player and Missile 1

next: 53269, $D015, [COLPM3](#COLPM3), Color of Player and Missile 3
### COLPM3

||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW||OS
|53269|$D015|COLPM3|Color of Player and Missile 3|0|[PCOLR3](#PCOLR3)|all

Missiles have the same color as corresponding Players (e.g. P0=M0, P1=M1, ...) except when joined together as 5th player by setting Bit 4 of [PRIOR](#PRIOR)/[GPRIOR](#GPRIOR). Then they have the color of register 3 [COLOR3](#COLOR3)/[COLPF3](#COLPF3).

---
see also: [Color topics](#Color_topics) 

previous: 53268, $D014, [COLPM2](#COLPM2), Color of Player and Missile 2

next: 53270, $D016, [COLPF0](#COLPF0), Color of Playfield 0
### COLRSH

||ADR||HEXADR||NAME||Description||shadow||OS
|79|$004F|COLRSH|Color shift mask|none|All

Attract color shifter; the color registers are EOR'd with locations 78 and 79 at the stage two VBLANK (see locations 18-20;$12-$14). When set to zero and location 78 equals 246, color luminance is reduced 50%. [COLRSH](#COLRSH) contains the current value of location 19, therefore is given a new color value every 4.27 seconds.

See also:

[ATRACT](#ATRACT), [DRKMSK](#DRKMSK) 
### Connectors

### SIO-Connector
```
     __________________________ 
    /                          \ 
   /   2   4   6   8   10  12   \ 
  /                              \
 /   1   3   5   7   9   11  13   \
/__________________________________\
```
||lower row||upper row
|1 Clock Input|2 Clock Output
|3 Data Input|4 Ground
|5 Data Output |6 Ground
|7 _Command|8 Motor control
|9 _Proceed |10 +5V DC/Ready
|11 Audio Input |12 +12V DC
|13 _Interrupt

Notes:
- _=active low
- Pin 10: +5V DC not on 1200XL
- Pin 12: +12V DC on 400/800 only. 1400XL/1450XLD?

### Joystick-Connector
```
_________________________
\                       /
 \  1   2   3   4   5  /
  \                   /  
   \  6   7   8   9  /
    \_______________/ 
```
||lower row||upper row
|1 Up|6 Trigger
|2 Down|7 +5V DC
|3 Left|8 Ground
|4 Right|9 Pot A
|5 Pot B
1-4 see [STICK0](#STICK0)-[STICK3](#STICK3), 3 also Paddle Trigger A see [PTRIG0](#PTRIG0), 4 also Paddle Trigger B see [PTRIG1](#PTRIG1) 
5,9 see [PADDL0](#PADDL0)-[PADDL7](#PADDL7) 
6 see [STRIG0](#STRIG0)-[STRIG3](#STRIG3),  also Light Pen Input, see [LPENV](#LPENV), [LPENH](#LPENH), (400 supports a light pen or light gun in port 4 only)
7 +5V

### Monitor Connector

```
   3 o           o 1

    5 o         o 4
           o
           2
```
5 PIN DIN 180° (DIN41524) FEMALE at the computer.

||Pin||Description
|1| Composite Luminance (Composite Video on PAL 600XL)
|2| Ground
|3| Audio Output
|4| Composite Video
|5| Composite Chroma (not on 800XL (except "800XLF"), 1200XL; Ground on PAL 600XL)

### Power Connector
not on 400, 800, 1200XL
```
    7 o         o 6

  3 o             o 1

    5 o         o 4
           o
           2
```
7 PIN DIN 'C' FEMALE at the computer.
||Pin||	 Description
|1| +5V
|2| Shield
|3| Ground
|4| +5V
|5| Ground
|6| +5V
|7| Ground

Power consumption
||Model||Current @ 5VDC
|130XE|1.5A
|65XE| 1.0A
|800XE| 1.0A
|XE| 1.0A
|600XL| 1.5A
|800XL| 1.5A

### (Left) Cartridge
on all machines; "Left Cartridge" on 800
```
A B C D E F H J K L M N P R S 
o o o o o o o o o o o o o o o
o o o o o o o o o o o o o o o
1                           15 
```
||upper row||lower row
|1. _S4 Chip Select $8000 to $9FFF |A. RD4 ROM present $8000 to $9FFF
|2. A3 CPU Address bus line |B. GND Ground
|3. A2 CPU Address bus line |C. A4 CPU Address bus line
|4. A1 CPU Address bus line |D. A5 CPU Address bus line
|5. A0 CPU Address bus line |E. A6 CPU Address bus line
|6. D4 CPU Data bus line |F. A7 CPU Address bus line
|7. D5 CPU Data bus line |H. A8 CPU Address bus line
|8. D2 CPU Data bus line |J. A9 CPU Address bus line
|9. D1 CPU Data bus line |K. A12 CPU Address bus line
|10. D0 CPU Data bus line |L. D3 CPU Data bus line
|11. D6 CPU Data bus line |M. D7 CPU Data bus line
|12. _S5 Chip Select  $A000 to $BFFF |N. A11 CPU Address bus line
|13. +5V |P. A10 CPU Address bus line
|14. RD5 ROM present $A000 to $BFFF |R. R/_W CPU read/write
|15. _CCTL Cartridge control select |S. B02,Phi2 CPU Phase 2 clock
_=active low

### Right Cartridge (800 only)
```
A B C D E F H J K L M N P R S
o o o o o o o o o o o o o o o
o o o o o o o o o o o o o o o
1                           15 
```
||upper row||lower row
|1. R/_W CPU read/write late |A. B02,Phi2 CPU Phase 2 clock
|2. A3 CPU Address bus line |B. GND Ground
|3. A2 CPU Address bus line |C. A4 CPU Address bus line
|4. A1 CPU Address bus line |D. A5 CPU Address bus line
|5. A0 CPU Address bus line |E. A6 CPU Address bus line
|6. D4 CPU Data bus line |F. A7 CPU Address bus line
|7. D5 CPU Data bus line |H. A8 CPU Address bus line
|8. D2 CPU Data bus line |J. A9 CPU Address bus line
|9. D1 CPU Data bus line |K. A12 CPU Address bus line
|10. D0 CPU Data bus line |L. D3 CPU Data bus line
|11. D6 CPU Data bus line |M. D7 CPU Data bus line
|12. _S4 Chip Select--$8000 to $9FFF |N. A11 CPU Address bus line
|13. +5V |P. A10 CPU Address bus line
|14. RD4 ROM present--$8000 to $9FFF |R. R/_W Read/write
|15. _CCTL Cartridge control select |S. B02,Phi2 CPU Phase 2 clock
_=active low

### Enhanced Cartridge Interface (ECI)/Expansion port
only on 130XE, 800XE and later 65XE versions
```
  A B C D E F H 
  o o o o o o o 
  o o o o o o o 
  1 2 3 4 5 6 7 
```
||upper row ||lower row
|A. Reserved | 1. _EXTSEL External Select
|B. _IRQ Interrupt request | 2. _RST Reset output
|C. _HALT Halt CPU |3. _D1XX Chip select at area $D1xx
|D. A13 CPU Address bus line | 4. _MPD Math Pack (FP) Disable
|E. A14 CPU Address bus line |5. Audio input
|F. A15 CPU Address bus line | 6. _REF Refresh cycle
|H. GND Ground |7. +5V
_=active low

### Parallel Bus Interface (PBI)
only on 600XL and 800XL
```
1                                               49 
o o o o o o o o o o o o o o o o o o o o o o o o o   (upper side of PCB)
o o o o o o o o o o o o o o o o o o o o o o o o o   (lower side of PCB)
2                                               50
```
||upper row||lower row
|1. GND Ground |2. _EXTSEL External Select
|3. A0 CPU Address bus line |4. A1 CPU Address bus line
|5. A2 CPU Address bus line |6. A3 CPU Address bus line
|7. A4 CPU Address bus line |8. A5 CPU Address bus line
|9. A6 CPU Address bus line |10. GND Ground
|11. A7 CPU Address bus line |12. A8 CPU Address bus line
|13. A9 CPU Address bus line |14. A10 CPU Address bus line
|15. A11 CPU Address bus line |16. A12 CPU Address bus line
|17. A13 CPU Address bus line |18. A14 CPU Address bus line
|19. GND Ground |20. A15 CPU Address bus line
|21. D0 CPU Data bus line |22. D1 CPU Data bus line
|23. D2 CPU Data bus line |24. D3 CPU Data bus line
|25. D4 CPU Data bus line |26. D5 CPU Data bus line
|27. D6 CPU Data bus line |28. D7 CPU Data bus line
|29. GND Ground |30. GND Ground
|31. B02,Phi2 CPU Phase 2 clock |32. GND Ground
|33. NC Reserved |34. _RST Reset output
|35. _IRQ Interrupt request |36. _RDY Ready input
|37. NC Reserved |38. _EXTENB CPU External decoder Enable
|39. NC Reserved |40. _REF Refresh cycle
|41. _CAS Column Address Strobe |42. GND Ground
|43. _MPD Math Pack (FP) Disable |44. _RAS Row Address Strobe
|45. GND Ground |46. LR/_W Latched read/write
|47. 800XL: NC. 600XL: +5V |48. 800XL: NC. 600XL: +5V
|49. Audio input |50. GND Ground
_=active low
---
with information from:
- [http://www.faqs.org/faqs/atari-8-bit/faq/](http://www.faqs.org/faqs/atari-8-bit/faq/)
- [http://www.hardwarebook.info/](http://www.hardwarebook.info/)
---
see [topic_list](#topic_list) 
### CONSOL

||R/W||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||OS
|read/write |53279 |$D01F|CONSOL|Console keys and internal speaker (400/800)|7|all

## Read
Used to look up if any of the 3 console keys (START, SELECT, OPTION) has been pressed (RESET is not a console key, neither is [HELP](#HELPFG))

```
START    Bit 0    PEEK(53279)=6
SELECT   Bit 1    PEEK(53279)=5
OPTION   Bit 2    PEEK(53279)=3
```


## Write
The built in speaker clicks (only on 400/800 computers)

Defaultwert: 7 ($7)

In diesem Register kann der Status der drei folgenden Zusatztasten (OPTION, SELECT, START) ausgewertet werden. Die den Tasten entsprechenden Bits werden bei Tastendruck gelöscht.

Das Schreiben eines Wertes zwischen Null und Sieben in dieses Register erzeugt einen
Klick über den Tastaturlautsprecher bzw., über den normalen Tonkanal (XL- und XE-Geräte).
---
see also: [Keyboard topics](#Keyboard_topics), [Sound_Topics](#Sound_Topics) 

previous: [HITCLR](#HITCLR) 

next: [AUDF1](#AUDF1),[POT0](#POT0) of POKEY
### content.txt
### Controller_topics

# Controllers

CX30 Paddles [PADDL0](#PADDL0)-[PADDL7](#PADDL7) [PTRIG0](#PTRIG0)-[PTRIG7](#PTRIG7) [POT0](#POT0)-[POT7](#POT7) [ALLPOT](#ALLPOT) [POTGO](#POTGO) [SKCTL](#SKCTL) 

CX40 Joysticks [STICK0](#STICK0) [STICK1](#STICK1) [STICK2](#STICK2) [STICK3](#STICK3) [STRIG0](#STRIG0) [STRIG1](#STRIG1) [STRIG2](#STRIG2) [STRIG3](#STRIG3) [PORTA](#PORTA) [PORTB](#PORTB) 

CX20 Driving Controllers

XG-1 Lightgun

[CX70](#Atari_CX70_Light_Pen) CX75 Lightpen

[CX85](#CX85_Keyboard_Handler) Numerical Keyboard

CX77 Touch Tablet

CX50 Keyboard Controllers

CX21 Video Touch Pad

CX23 Kids Controllers

CX80 CX22 [Trackball](#Trackball) 

Koala Pad

[MultiJoy8](#How_to_query_the_MultiJoy_Interface) 

[Latch Triggers](#GRACTL) 

[PORTA](#PORTA), [PORTB](#PORTB), [PACTL](#PACTL), [PBCTL](#PBCTL) 
---
see [topic_list](#topic_list) 
### CRETRY

||ADR||HEXADR||NAME||Description||shadow||OS
|54|$0036|CRETRY|Number of command retries|none|A
|668|$029C|CRETRY|Number of command retries|none|X


Number of command retries.
### CRITIC

||ADR||HEXADR||NAME||Description||OS
|66|$0042|CRITIC|Critical I/O Flag|both

Critical I/O region flag; defines the current operation as a time- critical section when the value here is non-zero. Checked at the NMI process after the stage one VBLANK has been processed.

POKEing any number other than zero here will disable the repeat action of the keys and change the sound of the CTRL-2 buzzer.
Zero is normal; setting [CRITIC](#CRITIC) to a non-zero value suspends a number of OS processes including system software timer counting (timers two, three, four and five; see locations 536 to 558; $218 to $22E).

It is suggested that you do not set [CRITIC](#CRITIC) for any length of time. When one timer is being set, [CRITIC](#CRITIC) stops the other timers to do so, causing a tiny amount of time to be "lost". When [CRITIC](#CRITIC) is zero, both stage one and stage two VBLANK procedures will be executed. When non-zero, only the stage one VBLANK will be processed.
### CRSINH

||R/W||Adr||Hex||Name||Description||OS||default
|R/W|752|$2F0|CRSINH|Cursordarstellung|all|0

||Wert||Auswirkung
|0|Cursor sichtbar
|1-255|Cursor unsichtbar

Erst nach einer Cursorbewegung wird die Änderung in diesem Registers wirksam.
Das Drücken der Tasten BREAK oder RESET, die Änderung der Grafikstufe oder das Öffnen eines I/O-Kanals zum Bildschirm (S:) oder Editor (E:) stellt den Default-Wert wieder her - der Cursor wird wieder sichtbar.

siehe auch: [CHACT](#CHACT), [CHACTL](#CHACTL) 
### DINDEX

||ADR||HEXADR||NAME||Description||shadow||OS
|87|$0057|DINDEX|Display mode/current screen mode|none|All

[DINDEX](#DINDEX) contains the number obtained from the low order four bits of most recent open AUX1 byte. It can be used to barl the OS into thinking you are in a different GRAPHICS mode by POKEing DINDEX with a number from zero to 11.

Previous: [COLCRS](#COLCRS) 

Next: [SAVMSC](#SAVMSC) 
### Displaylist_topics

[SDLSTL](#SDLSTL), [SDLSTH](#SDLSTL) Shadow register of pointer to display list

[DLISTL](#DLISTL), [DLISTH](#DLISTL) Pointer to display list

[SDMCTL](#SDMCTL) Direct Memory Access (DMA) Control

[VDSLST](#VDSLST) Pointer to Display List Interrupt routine

[NMIEN](#NMIEN) to enable the Display List Interrupt

[NMIST](#NMIST), [NMIRES](#NMIST) to check the status of [NMIEN](#NMIEN) 

[WSYNC](#WSYNC) halts the CPU until end of scanline

[VCOUNT](#VCOUNT) Scanline counter

[PENH](#PENH), [PENV](#PENV) horizontal and vertical position of the light pen

[LPENH](#PENH), [LPENV](#PENV) shadow register of [PENH](#PENH) and [PENV](#PENV) 

[Display List Instruction table](#display_list_instruction_table) 

[HSCROL](#HSCROL), [VSCROL](#VSCROL) 

---
see [topic_list](#topic_list), [VBI_Vertical_Blank_Interrupt](#VBI_Vertical_Blank_Interrupt) 
### DLISTL

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS||SHADOW REGISTERS
|read/write |54274,54275|$D402,$D403|DLISTL, DLISTH|Start Address of the Display List|both|[SDLSTL](#SDLSTL), [SDLSTH](#SDLSTL) 

Attention: the display list can NOT cross a 1K-boundary unless you use a JMP instruction (1/$01) to cross the boundary (see [Display List Instruction table](#display_list_instruction_table))

---

see also: [Display List Topics](#Displaylist_topics), [SDLSTL](#SDLSTL), [SDLSTH](#SDLSTL) 

previous: [CHACTL](#CHACTL) 

next: [HSCROL](#HSCROL) 
### DMACTL

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS||SHADOW||DEFAULT
|read/write|54272|$D400 |DMACTL|Direct Memory Access (DMA) Control|all|[SDMCTL](#SDMCTL)|34/$22


Diese Speicherzelle der Kontrolle des direkten Speicherzugriffs ("Direct Memory Access", [DMA](#DMA)) des ANTIC auf den Speicher des Atari. Der 6502-Prozessor wird während des direkten Speicherzugriffs abgeschaltet. Durch die Abschaltung des DMA des [ANTIC](#ANTIC) können Programme beschleunigt (ca. 30%) werden. Anhand folgender Aufstellung sieht man, wie die einzelnen Bits dieses Registers das Aussehen des Bildschirms kontrollieren:

||Bit||Dec||Hex||Function||Default
|7   |    128 |    $80 |    not used|0
|6    |   64 |     $40  |   not used|0
|5	|32|	$20|	Direct Memory Access on=1/off=0/aus|1
|4|	16|	$10|	Einzeilige P/M-Auflösung on=1/off=0|0
|3|	8|	$8|	DMA für Player on=1/off=0|0
|2|	4|	$4|	DMA für Missiles on=1/off=0|0
|0,1|	3|	$3|	Breites Anzeigefeld (48 Zeichen)|
|0,1|	2|	$2|	Normales Anzeigefeld (40 Zeichen)|10
|0,1|	1|	$1|	Schmales Anzeigefeld (32 Zeichen)|
|0,1|	0|	$0|	Kein Anzeigefeld|

Mit Bit fünf kann man also den gesamten direkten Speicherzugriff des ANTIC kontrollieren. Das Bit vier dient dem Umschalten zwischen einzeiliger P/M-Auflösung und zweizeiliger Auflösung. Die Angabe der Zeichenbreite für das Anzeigefeld bezieht sich auf die Grafikstufe Null. Die Anzahlen der Zeichen entsprechen 192, 160 oder 128 Farbpunkten. Insgesamt kann der ANTIC 238 Farbpunkte (einschließlich des Randes) darstellen, davon sind jedoch je nach Fernseher/Monitor nur ca. 174 sichtbar. Es sind deshalb beim Einschalten eines breiten Anzeigefeldes nicht alle 48 Zeichen vollständig sichtbar (bzw. das Bild geht über den Rand des Monitors hinaus).

---
see also: [Player Missile Topics](#Pm_topics) 

previous: [PBCTL](#PBCTL) of PIA

next: [CHACTL](#CHACTL) 
### DOSINI

||ADR||HEXADR||NAME||Description||shadow||OS
|12,13|$0C,$0D|DOSINI| | |

Sprungvektor nach Booten von Diskette
### DOSVEC

||ADR||HEXADR||NAME||Description||shadow||OS
|10,11|$0A,$0B|DOSVEC| | |

DOS Einsprung-Vektor
### DRETRY

||ADR||HEXADR||NAME||Description||shadow||OS
|55|$0037|DRETRY|Number of device retries|none|A
|701|$02BD|DRETRY|Number of device retries|none|X
### DRKMSK

||ADR||HEXADR||NAME||Description||shadow||OS
|78|$004E|DRKMSK|Dark attract mask|none|All

Set to 254/$FE for normal brightness when the attract mode is inactive (see location 77/$4D [ATRACT](#ATRACT)). Set to 246/$F6 when the attract mode is active to guarantee screen color luminance will not exceed 50%. Initialized to 254/$FE.

See also:

[ATRACT](#ATRACT), [COLRSH](#COLRSH) 
### DSKFMS

||ADR||HEXADR||NAME||Description||shadow||OS
|24,25|$0018,$0019|DSKFMS| | |


Sprungvektor ins FMS (File Management System)
### DSKUTL

||ADR||HEXADR||NAME||Description||shadow||OS
|26,27|$001A,$001B|DSKUTL| | |


DUP EINSPRUNG
### DSTAT

||ADR||HEXADR||NAME||Description||shadow||OS
|76|$004C|DSTAT| |none|all
Display status and keyboard register used by the display handler. Also used to indicate memory is too small for the screen mode, cursor out of range error, and the BREAK abort status.
### FINE

||ADR||HEXADR||NAME||Description||shadow||OS
|622|$026E|FINE|Fine scroll enable|none|X

Fine-scroll enable for graphics mode 0 (text); POKE with 0 for coarse scrolling (the default) and 255 ($FF) for fine scrolling. Follow the POKE with GR.0 or an OPEN for device E:. Try listing a long program - it's slow and smooth! The display list for fine scrolling is one byte longer than for coarse scrolling. The OS places the address (64708; $FCC4) of a Display List Interrupt (DLI) at 512,513/$0200,$0201 [VDSLST](#VDSLST), replacing any you might have placed there. The color register at 53271/$D017 [COLPF1](#COLPF1) is altered for the last visible screen line.
If you enable fine scrolling and go immediately to DOS, you'll see that it's still enabled when you do a copy to screen or disk directory.
### FR0

212-217
$D4-$D9
FR0

Floating point register zero; holds a six-byte internal form of the FP number. The value at locations 212 and 213 are used to return a two-byte hexadecimal value in the range of zero to 65536 ($FFFF) to the BASIC program (low byte in 212, high byte in 213). The floating point package, if used, requires all locations from 212 to 255. All six bytes of FR0 can be used by a machine language routine, provided FR0 isn't used and no FP functions are used by that routine. To use 16 bit values in FP, you would place the two bytes of the number into the least two bytes of FR0 (212, 213; $D4, $D5), and then do a JSR to $D9AA (55722), which will convert the integer to its FP representation, leaving the result in FR0. To reverse this operation, do a JSR to $D9D2 (55762).
### FR1

224-229
$E0-$E5
FR1

Floating point register one; holds a six-byte internal form of the FP number as does FR0. The FP package frequently transfers data between these two registers and uses both for two-number arithmetic operations.
### GPRIOR

||ADR||HEXADR||NAME||Description||shadow of||OS
|623| $026F|GPRIOR|Priority Selection Register| [PRIOR](#PRIOR) |all

## Priority Settings
||Bit||Value||Description
|0|1|P0-P1-P2-P3 PF0-PF1-PF2-PF3 BAK
|1|2|P0-P1 PF0-PF1-PF2-PF3 P2-P3 BAK
|2|4|PF0-PF1-PF2-PF3 P0-P1-P2-P3 BAK
|3|8|PF0-PF1 P0-P1-P2-P3 PF2-PF3 BAK
|4|16|Four Missiles add up to be 5th player
|5|32|Overlapping Players have 3rd color
|6|64|GTIA Mode see next table
|7|128|GTIA Mode see next table
P0-P3 Players [PCOLR0](#PCOLR0).../[COLPM0](#COLPM0)...
PF0-PF3 Playfield colors [COLOR0](#COLOR0).../[COLPF0](#COLPF0)...
BAK background or border color [COLOR4](#COLOR4)/[COLBAK](#COLBAK) 

A logical OR is done to the colors of players 0/1 and 2/3 when they overlap. Only the 0/1, 2/3 combinations are allowed; you will not get a third color when players 1 and 3 overlap, the priorities set with bits 0…3 are applied.

If put together into a 5th player (set Bit 4 to '1') the missiles get the color of register 3 [COLOR3](#COLOR3). They still move independently, e.g. set their horizontal positions with [HPOSM0](#HPOSM0) - [HPOSM3](#HPOSM3) 

## GTIA Modes
This register can be used to select one of GTIA GRAPHICS modes 9, 10 and 11.
||GTIA Mode*||Bit 6||Bit 7||Description
|9|0|1|16 different luminances of the same hue (color)
|10|1|0|9 different colors
|11|1|1|16 different hues (colors) of the same luminance
* the same as GRAPHICS x in BASIC
---

see also: [Player Missile Topics](#Pm_topics) 

previous: [FINE](#FINE) 

next: [PADDL0](#PADDL0) 
### GRACTL

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|write |53277 |$D01D|GRACTL|controls PM and Triggers|both

This is a write only register.

||Bit || Function
|7 | unused
|6 | unused
|5 | unused
|4 | unused
|3 | unused
|2 | Latch Triggers when =1
|1 | Turn on players when =1
|0 | Turn on missiles when =1

Bit 0 and Bit 1 control players and missiles. Players and missiles are visible only when the respective bit is set to 1. [SDMCTL](#SDMCTL) needs to be set accordingly also.

"Latch Triggers" means that triggers of sticks and paddles stay in "pressed state" once pressed. To reset this, set Bit 2 to 0. This is valid for all triggers and cannot be set for single triggers only.

---

see also: [Player Missile Topics](#Pm_topics), [Controller Topics](#Controller_topics) 

previous: [VDELAY](#VDELAY) 

next: [HITCLR](#HITCLR) 
### GRAFM

||R/W||ADR||HEXADR||NAME||DESCRIPTION||SHADOW||OS
|Read |53265|$D011|TRIG1|Trigger 1|[STRIG1](#STRIG1)|both
|Write|53265|$D011|GRAFM|Graphics Shape for Missile 0-3| |both

### Read: Joystick Trigger 1 (645; $285)
||Button pressed | 0
||not pressed |1
see also [GRACTL](#GRACTL) 
### Write
||Bit|| Missile Nr.
|7,6| 3
|5,4| 2
|3,2| 1
|1,0| 0

---
see also:[Player Missile Topics](#Pm_topics), [Controller topics](#Controller_topics), [Latch triggers](#GRACTL) 

previous: R: [TRIG0](#GRAFP3), W: [GRAFP3](#GRAFP3) 
next: R: [TRIG2](#COLPM0), W: [COLPM0](#COLPM0) 
### GRAFP0

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53261 |$D00D|GRAFP0|Graphics Shape for Player 0|both
|Read| 53261 |$D00D|P1PL|Collision Player 1 with Player|both

### Read: Collision Player 1 with Player x

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Player x=| | | |  |3| 2| 1| 0
---
see also:[Player Missile Topics](#Pm_topics) 

previous: [SIZEM](#SIZEM), [P0PL](#SIZEM) 

next: [GRAFP1](#GRAFP1), [P2PL](#GRAFP1) 
### GRAFP1

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53262 |$D00E|GRAFP1|Graphics Shape for Player 1|both
|Read| 53262 |$D00E|P2PL|Collision Player 2 with Player|both

### Read: Collision Player 2 with Player x

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Player x=| | | |  |3| 2| 1| 0
---
see also:[Player Missile Topics](#Pm_topics) 

previous: [GRAFP0](#GRAFP0), [P1PL](#GRAFP0) 

next: [GRAFP2](#GRAFP2), [P3PL](#GRAFP2) 
### GRAFP2

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53263 |$D00F|GRAFP2|Graphics Shape for Player 2|both
|Read| 53263 |$D00F|P3PL|Collision Player 3 with Player|both

### Read: Collision Player 3 with Player x

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Player x=| | | |  |3| 2| 1| 0
---
see also:[Player Missile Topics](#Pm_topics) 

previous: [GRAFP1](#GRAFP1), [P2PL](#GRAFP1) 

next: [GRAFP3](#GRAFP3), [TRIG0](#GRAFP3) 
### GRAFP3

||R/W||ADR||HEXADR||NAME||DESCRIPTION||SHADOW||OS
|Write| 53264 |$D010|GRAFP3|Graphics Shape for Player 3| |both
|Read| 53264 |$D010|TRIG0|Trigger 0|[STRIG0](#STRIG0)|both

### Read: Joystick Trigger 0

||Button pressed | 0
||not pressed |1
see also [GRACTL](#GRACTL) 
### Write: Graphics Shape for Player 3
||Bit|| Missile Nr.
|7,6| 3
|5,4| 2
|3,2| 1
|1,0| 0

---
see also:[Player Missile Topics](#Pm_topics), [Controller topics](#Controller_topics) 

previous: [GRAFP2](#GRAFP2), [P3PL](#GRAFP2) 

next: [GRAFM](#GRAFM), [TRIG1](#GRAFM) 
### HELPFG

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|read/write |732|$02DC|HELPFG|Help key register|XL/XE

The Help-Key is read from [KBCODE](#KBCODE) and stored in HELPFG. There is no normal action when HELP is pressed. The programmer has to check HELPFG or KBCODE.

## Bits
||Bit||Function
|0| HELP
|4| HELP
|6| SHIFT
|7| CTRL

## Values
||Hex||Dec||Explanation
|$00|0|HELP Flag cleared
|$11|17|HELP key pressed
|$51|81|SHIFT HELP pressed
|$91|145|CTRL HELP pressed

---
see also: [Keyboard topics](#Keyboard_topics) [Console Keys](#CONSOL) 
### HITCLR

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|write|53278|$D01E|HITCLR|clear all collision registers|all

This is a write only register.
Write any number into this register to clear all collision registers.
---
see also: [Player Missile Topics](#Pm_topics) 

previous: [GRACTL](#GRACTL) 

next: [CONSOL](#CONSOL) 
### HOLD1

||ADR||HEXADR||NAME||Description||shadow||OS
|81|$0051|HOLD1| |none|all
Same as location 80 [TEMP](#TEMP). It is used also to hold the number of Display List entries.
### HPOSM0

%%tabbedSection
%%tab-english
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53252 |$D004|HPOSM0|horizontal position of missile 0|both
|Read| 53252 |$D004|P0PF|player 0 collision with playfield|both

### Write: Horizontal position of missile 0
Values from 0 to 255, missile is visible between 48 to 208 depending on playfield width (see [SDMCTL](#SDMCTL)) and width of missile (see [SIZEM](#SIZEM)/M0).
### Read: Player 0 collision with playfield

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Playfield| | | |  |3| 2| 1| 0
Playfield corresponds to [COLOR0](#COLOR0), ..., [COLOR3](#COLOR3) color register
/%
%%tab-deutsch
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53252 |$D004|HPOSM0|Horizontale Position Missile 0|both
|Read| 53252 |$D004|P0PF|Kollision Player 0 mit Playfield|both

### Write: Horizontale Position von Missile 0
Werte von 0 bis 255 möglich, Missile sichtbar zwischen 48?? bis 208?? abhängig von der Spielfeldbreite (siehe [SDMCTL](#SDMCTL)) und Breite des Missiles (siehe [SIZEM](#SIZEM)/M0).

### Read: Kollision Player 0 mit Playfield

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Playfield| | | |  |3| 2| 1| 0
Playfield entspricht dem Farbregister [COLOR0](#COLOR0), ..., [COLOR3](#COLOR3) 
/%
/%
---
see also:[Player Missile Topics](#Pm_topics) 

previous: [HPOSP3](#HPOSP3), [M3PF](#HPOSP3) 

next: [HPOSM1](#HPOSM1), [P1PF](#HPOSM1) 
### HPOSM1

%%tabbedSection
%%tab-english
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53253 |$D005|HPOSM1|horizontal position of missile 1|both
|Read| 53253 |$D005|P1PF|player 1 collision with playfield|both

### Write: Horizontal position of missile 1
Values from 0 to 255, missile is visible between 48 to 208 depending on playfield width (see [SDMCTL](#SDMCTL)) and width of missile (see [SIZEM](#SIZEM)/M1).
### Read: Player 1 collision with playfield

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Playfield| | | |  |3| 2| 1| 0
Playfield corresponds to [COLOR0](#COLOR0), ..., [COLOR3](#COLOR3) color register
/%
%%tab-deutsch
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53253 |$D005|HPOSM1|Horizontale Position Missile 1|both
|Read| 53253 |$D005|P1PF|Kollision Player 1 mit Playfield|both

### Write: Horizontale Position von Missile 1
Werte von 0 bis 255 möglich, Missile sichtbar zwischen 48?? bis 208?? abhängig von der Spielfeldbreite (siehe [SDMCTL](#SDMCTL)) und Breite des Missiles (siehe [SIZEM](#SIZEM)/M1).

### Read: Kollision Player 1 mit Playfield

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Playfield| | | |  |3| 2| 1| 0
Playfield entspricht dem Farbregister [COLOR0](#COLOR0), ..., [COLOR3](#COLOR3) 
/%
/%
---
see also:[Player Missile Topics](#Pm_topics) 

previous: [HPOSM0](#HPOSM0), [P0PF](#HPOSM0) 

next: [HPOSM2](#HPOSM2), [P2PF](#HPOSM2) 
### HPOSM2

%%tabbedSection
%%tab-english
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53254 |$D006|HPOSM2|horizontal position of missile 2|both
|Read| 53254 |$D006|P2PF|player 2 collision with playfield|both

### Write: Horizontal position of missile 2
Values from 0 to 255, missile is visible between 48 to 208 depending on playfield width (see [SDMCTL](#SDMCTL)) and width of missile (see [SIZEM](#SIZEM)/M2).
### Read: Player 2 collision with playfield

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Playfield| | | |  |3| 2| 1| 0
Playfield corresponds to [COLOR0](#COLOR0), ..., [COLOR3](#COLOR3) color register
/%
%%tab-deutsch
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53254 |$D006|HPOSM2|Horizontale Position Missile 2|both
|Read| 53254 |$D006|P2PF|Kollision Player 2 mit Playfield|both

### Write: Horizontale Position von Missile 2
Werte von 0 bis 255 möglich, Missile sichtbar zwischen 48?? bis 208?? abhängig von der Spielfeldbreite (siehe [SDMCTL](#SDMCTL)) und Breite des Missiles (siehe [SIZEM](#SIZEM)/M2).

### Read: Kollision Player 2 mit Playfield

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Playfield| | | |  |3| 2| 1| 0
Playfield entspricht dem Farbregister [COLOR0](#COLOR0), ..., [COLOR3](#COLOR3) 
/%
/%
---
see also:[Player Missile Topics](#Pm_topics) 

previous: [HPOSM1](#HPOSM1), [P1PF](#HPOSM1) 

next: [HPOSM3](#HPOSM3), [P3PF](#HPOSM3) 
### HPOSM3

%%tabbedSection
%%tab-english
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53255 |$D007|HPOSM3|horizontal position of missile 3|both
|Read| 53255 |$D007|P3PF|player 3 collision with playfield|both

### Write: Horizontal position of missile 3
Values from 0 to 255, missile is visible between 48 to 208 depending on playfield width (see [SDMCTL](#SDMCTL)) and width of missile (see [SIZEM](#SIZEM)/M3).
### Read: Player 3 collision with playfield

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Playfield| | | |  |3| 2| 1| 0
Playfield corresponds to [COLOR0](#COLOR0), ..., [COLOR3](#COLOR3) color register
/%
%%tab-deutsch
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53255 |$D007|HPOSM3|Horizontale Position Missile 3|both
|Read| 53255 |$D007|P3PF|Kollision Player 3 mit Playfield|both

### Write: Horizontale Position von Missile 3
Werte von 0 bis 255 möglich, Missile sichtbar zwischen 48?? bis 208?? abhängig von der Spielfeldbreite (siehe [SDMCTL](#SDMCTL)) und Breite des Missiles (siehe [SIZEM](#SIZEM)/M3).

### Read: Kollision Player 3 mit Playfield

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Playfield| | | |  |3| 2| 1| 0
Playfield entspricht dem Farbregister [COLOR0](#COLOR0), ..., [COLOR3](#COLOR3) 
/%
/%
---
see also:[Player Missile Topics](#Pm_topics) 

previous: [HPOSM2](#HPOSM2), [P2PF](#HPOSM2) 

next: [SIZEP0](#SIZEP0), [M0PL](#SIZEP0) 
### HPOSP0

%%tabbedSection
%%tab-english
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53248 |$D000|HPOSP0|horizontal position of player 0|both
|Read| 53248 |$D000|M0PF|missile 0 collision with playfield|both

### Write: Horizontal position of player 0
Values from 0 to 255, player is visible between 48 to 208 depending on playfield width (see [SDMCTL](#SDMCTL)) and width of player (see [SIZEP0](#SIZEP0)).
### Read: Missile 0 collision with playfield

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Playfield| | | |  |3| 2| 1| 0
Playfield corresponds to [COLOR0](#COLOR0), ..., [COLOR3](#COLOR3) color register
/%
%%tab-deutsch
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53248 |$D000|HPOSP0|Horizontale Position Player 0|both
|Read| 53248 |$D000|M0PF|Kollision Missile 0 mit Playfield|both

### Write: Horizontale Position von Player 0
Werte von 0 bis 255 möglich, Player sichtbar zwischen 48 bis 208 abhängig von der Spielfeldbreite (siehe [SDMCTL](#SDMCTL)) und Breite des Players (siehe [SIZEP0](#SIZEP0)).

### Read: Kollision Missile 0 mit Playfield

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Playfield| | | |  |3| 2| 1| 0
Playfield entspricht dem Farbregister [COLOR0](#COLOR0), ..., [COLOR3](#COLOR3) 
/%
/%
---
see also:[Player Missile Topics](#Pm_topics) 

previous: none

next: [HPOSP1](#HPOSP1), [M1PF](#HPOSP1) 
### HPOSP1

%%tabbedSection
%%tab-english
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53249 |$D001|HPOSP1|horizontal position of player 1|both
|Read| 53249 |$D001|M1PF|missile 1 collision with playfield|both

### Write: Horizontal position of player 1
Values from 0 to 255, player is visible between 48 to 208 depending on playfield width (see [SDMCTL](#SDMCTL)) and width of player (see [SIZEP1](#SIZEP1)).
### Read: Missile 1 collision with playfield

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Playfield| | | |  |3| 2| 1| 0
Playfield corresponds to [COLOR0](#COLOR0), ..., [COLOR3](#COLOR3) color register
/%
%%tab-deutsch
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53249 |$D001|HPOSP1|Horizontale Position Player 1|both
|Read| 53249 |$D001|M1PF|Kollision Missile 1 mit Playfield|both

### Write: Horizontale Position von Player 1
Werte von 0 bis 255 möglich, Player sichtbar zwischen 48 bis 208 abhängig von der Spielfeldbreite (siehe [SDMCTL](#SDMCTL)) und Breite des Players (siehe [SIZEP1](#SIZEP1)).

### Read: Kollision Missile 1 mit Playfield

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Playfield| | | |  |3| 2| 1| 0
Playfield entspricht dem Farbregister [COLOR0](#COLOR0), ..., [COLOR3](#COLOR3) 
/%
/%
---
see also:[Player Missile Topics](#Pm_topics) 

previous: [HPOSP0](#HPOSP0), [M0PF](#HPOSP0) 

next: [HPOSP2](#HPOSP2), [M2PF](#HPOSP2) 
### HPOSP2

%%tabbedSection
%%tab-english
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53250 |$D002|HPOSP2|horizontal position of player 2|both
|Read| 53250 |$D002|M2PF|missile 2 collision with playfield|both

### Write: Horizontal position of player 2
Values from 0 to 255, player is visible between 48 to 208 depending on playfield width (see [SDMCTL](#SDMCTL)) and width of player (see [SIZEP2](#SIZEP2)).
### Read: Missile 2 collision with playfield

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Playfield| | | |  |3| 2| 1| 0
Playfield corresponds to [COLOR0](#COLOR0), ..., [COLOR3](#COLOR3) color register
/%
%%tab-deutsch
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53250 |$D002|HPOSP2|Horizontale Position Player 2|both
|Read| 53250 |$D002|M2PF|Kollision Missile 2 mit Playfield|both

### Write: Horizontale Position von Player 2
Werte von 0 bis 255 möglich, Player sichtbar zwischen 48 bis 208 abhängig von der Spielfeldbreite (siehe [SDMCTL](#SDMCTL)) und Breite des Players (siehe [SIZEP2](#SIZEP2)).

### Read: Kollision Missile 2 mit Playfield

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Playfield| | | |  |3| 2| 1| 0
Playfield entspricht dem Farbregister [COLOR0](#COLOR0), ..., [COLOR3](#COLOR3) 
/%
/%
---
see also:[Player Missile Topics](#Pm_topics) 

previous: [HPOSP1](#HPOSP1), [M1PF](#HPOSP1) 

next: [HPOSP3](#HPOSP3), [M3PF](#HPOSP3) 
### HPOSP3

%%tabbedSection
%%tab-english
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53251 |$D003|HPOSP3|horizontal position of player 3|both
|Read| 53251 |$D003|M3PF|missile 3 collision with playfield|both

### Write: Horizontal position of player 3
Values from 0 to 255, player is visible between 48 to 208 depending on playfield width (see [SDMCTL](#SDMCTL)) and width of player (see [SIZEP3](#SIZEP3)).
### Read: Missile 3 collision with playfield

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Playfield| | | |  |3| 2| 1| 0
Playfield corresponds to [COLOR0](#COLOR0), ..., [COLOR3](#COLOR3) color register
/%
%%tab-deutsch
||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53251 |$D003|HPOSP3|Horizontale Position Player 3|both
|Read| 53251 |$D003|M3PF|Kollision Missile 3 mit Playfield|both

### Write: Horizontale Position von Player 3
Werte von 0 bis 255 möglich, Player sichtbar zwischen 48 bis 208 abhängig von der Spielfeldbreite (siehe [SDMCTL](#SDMCTL)) und Breite des Players (siehe [SIZEP3](#SIZEP3)).

### Read: Kollision Missile 3 mit Playfield

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Playfield| | | |  |3| 2| 1| 0
Playfield entspricht dem Farbregister [COLOR0](#COLOR0), ..., [COLOR3](#COLOR3) 
/%
/%
---
see also:[Player Missile Topics](#Pm_topics) 

previous: [HPOSP2](#HPOSP2), [M2PF](#HPOSP2) 

next: [HPOSM0](#HPOSM0), [P0PF](#HPOSM0) 
### HSCROL

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|write only|54276|$D404|HSCROL|Horizontal Fine Scrolling|both

If this location is set to a value other than zero, the ANTIC omits that number of color cycles in that line. In other words, ANTIC start displaying that number of color cycles line "later", the picture is shifted "left".

Only the lower 4 bits of this register are used, so the maximum value is 15.

This register should not be altered while ANTIC is drawing the screen. It has to be changed during vertical blank interrupt to get good results.


||ANTIC Mode||BASIC Mode||Max value for HSCROL||Comment
|$02|0|3|Text mode 0, normal text, 24 rows
|$03|na|3|Text with full size descenders (e.g. g,p,y,j,q)
|$04|12 XL/XE OS only|3|4-color-characters, 4 pixel width, 24 rows
|$05|13 XL/XE OS only|3|4-color-characters, 4 pixel width, double heigth, 12 rows
|$06|1|7|Text mode 1, double width text, 24 rows
|$07|2|7|Text mode 2, double width and height text, 12 rows
|$08|3| |Graphics Mode 3, 24 rows
|$09|4| |Graphics Mode 4, 48 rows
|$0A|5| |Graphics Mode 5, 48 rows
|$0B|6| |Graphics Mode 6, 96 rows
|$0C|14 XL/XE OS only| | Graphics Mode 14, 192 rows
|$0D|7| |Graphics Mode 7, 96 rows
|$0E|15 XL/XE OS only| |Graphics Mode 15, 192 rows
|$0F|8| |Graphics Mode 8, 192 rows

---
see also: [Display List topics](#Displaylist_topics) 

previous: [DLISTL](#DLISTL),[DLISTH](#DLISTL) 

next: [VSCROL](#VSCROL) 
### ICCOMT

||ADR||HEXADR||NAME||Description||shadow||OS
|23|$17|ICCOMT| | |


Aktuelles CIO-Kommando
### ICCOMZ

||ADR||HEXADR||NAME||Description||shadow||OS
|34|$0022|ICCOMZ| | |



COMMAND CODE
### ICDNOZ

||ADR||HEXADR||NAME||Description||shadow||OS
|33|$0021|ICDNOZ| | |


Device Nummer
### ICHIDZ

||ADR||HEXADR||NAME||Description||shadow||OS
|32|$20|ICHIDZ| | |


HANDLER INDEX NUMMER
### ICSTAZ

||ADR||HEXADR||NAME||DESCRIPTION||SHADOW||OS
|35|$0023|ICSTAZ| | |


Status der letzten IOCB-Aktion
### INITAD

||ADR||HEXADR||NAME||OS
|738,739|$02E2,$02E3|INITAD|both

Initialization address read from the disk. An autoboot file must load an address value into either RUNAD above or INITAD. The code pointed to by INITAD will be run as soon as that location is loaded. The code pointed to by RUNAD will be executed only after the entire load process has been completed. To return control to DOS after the execution of your program, end your code with an RTS instruction.

see also: [RUNAD](#RUNAD) 
### Interrupts

[VBI_Vertical_Blank_Interrupt](#VBI_Vertical_Blank_Interrupt) 

[DLI Display List Interrupt](#Displaylist_topics) 


---
see [topic_list](#topic_list) 
### IRQEN

||r/w||ADR||HEXADR||NAME||Description||Shadow||OS
|write|53774|$D20E|IRQEN|[POKMSK](#POKMSK)|Interrupt Request Enable|all
|read|53774|$D20E|IRQST|[POKMSK](#POKMSK)|Interrupt Request Status|all

## Write
||Bit||Function
|0|d
|1|d
|2|d
|3|d
|4|d
|5|d
|6|d
|7|d

Bit set to "0" (zero) turns interrupt off (disable)
Bit set to "1" (one) turns interrupt on (enable)

## Read
||Bit||Value||Function||Vector
|0|$01 1|Timer 1 (counted down to zero)|[VTIMR1](#VTIMR1) (528; $0210)
|1|$02 2|Timer 2 (counted down to zero)|[VTIMR2](#VTIMR2) (530; $0212)
|2|$04 4|Timer 4 (counted down to zero)|[VTIMR4](#VTIMR4) (532; $0214 - OS "B" and later ROMs only)
|3|$08 8|Serial output transmission down|[VSEROC](#VSEROC) (526; $020E)
|4|$10 16|Serial Output data needed|[VSEROR](#VSEROR) (524; $020C)
|5|$20 32|Serial input data ready|[VESRIN](#VESRIN) (522; $020A)
|6|$40 64|Other key pressed|[VKEYBD](#VKEYBD) (520; $0208)
|7|$80 128|Break key pressed|[BRKKY](#BRKKY) (566; $0236 - OS "B" and later ROMs only)

---
see also: [Keyboard topics](#Keyboard_topics) 

previous: [SERIN](#SEROUT),[SEROUT](#SEROUT) 

next: [SKCTL](#SKCTL),[SKSTAT](#SKCTL) 
### KBCODE

||r/w||ADR||HEXADR||NAME||Description||OS
|read|53769|$D209|KBCODE|internal key code|all
|write|53769|$D209|STIMER|Start the POKEY Timers|all

# Read

Enthält den internen Tastaturcode der zuletzt gedrückten Taste.

## Hexadecimal Values
|| ||$00||$01||$02||$03||$04||$05||$06||$07||$08||$09||$0A||$0B||$0C||$0D||$0E||$0F
|$00|L|J|;|F1|F2|K|+|*|O| |P|U|CR|I|-|=
|$10|V|Help|C|F3|F4|B|X|Z|4| |3|6|Esc|5|2|1
|$20|,|Spc|.|N| |M|/|Inv|R| |E|Y|Tab|T|W|Q
|$30|9| |0|7|BS|8|<|>|F|H|D| |Caps|G|S|A

together with Shift Key: add +$40

together with Control key: add +$80

## Decimal Values
|| ||7||6||5||4||3||2||1||0
|0|*|+|K|F2|F1|;|J|L
|8|=|-|I|CR|U|P| |O
|16|Z|X|B|F4|F3|C|Help|V
|24|1|2|5|Esc|6|3| |4
|32|inv|/|M| |N|.|Spc|,
|40|Q|W|T|Tab|Y|E| |R
|48|>|<|8|BS|7|0| |9
|56|A|S|G|Caps| |D|H|F

Spc SPACE, CR RETURN, Tab TAB, Caps CAPS, Inv INVERS/ATARI-Taste, Esc Escape, BS BACKSPACE, Help HELP

together with Shift Key: add 64

together with Control key: add 128


# Write
Start the POKEY timers (the AUDF registers above). You POKE any non-zero value here to load and start the timers; the value isn't itself used in the calculations. This resets all of the audio frequency dividers to their AUDF values. If enabled by [IRQEN](#IRQEN) below, these AUDF registers generate timer interrupts when they count down from the number you POKEd there to zero. The vectors for the [AUDF1](#AUDF1), [AUDF2](#AUDF2) and [AUDF4](#AUDF4) timer interrupts are located between 528 and 533 ($210 and $215) [VTIMR1](#VTIMR1), [VTIMR2](#VTIMR2), [VTIMR4](#VTIMR4). POKEY timer four interrupt is only enabled in the new "B" OS ROMs.

---
see also: [Keyboard topics](#Keyboard_topics) [Console Keys](#CONSOL) [HELP](#HELPFG) 

previous: [AUDCTL](#AUDCTL),[ALLPOT](#ALLPOT) 

next: [SKREST](#SKREST),[RANDOM](#SKREST) 
### Keyboard_topics

# Keyboard topics

[HELP](#HELPFG) 

[Console Keys](#CONSOL) 

[START key](#CONSOL) [SELECT key](#CONSOL) [OPTION key](#CONSOL) 

[Break key](#BRKKEY) 

[ATARI key](#CH) [Inverse key](#CH) 

[CTRL-1](#SSFLAG) 

[SHFLOK](#SHFLOK) 

[CH](#CH) [KBCODE](#KBCODE) [CH1](#CH1) key pressed/internal key code

[KEYDEL](#KEYDEL) key delay

[KRPDEL](#KRPDEL) key repeat delay

[KEYREP](#KEYREP) key repeat frequency

[NOCLIK](#NOCLIK) keyclick on/off

Check if the last Key is still pressed with [SKSTAT](#SKCTL), Bit 2

[Keyboard_Mapping](#Keyboard_Mapping) 

[Function Keys F1-F4](#fkeys) 

[TransKey-II](#TransKey-II) 
---
see [topic_list](#topic_list) 
### KEYDEF


KEYDEF $0079,$007A 121,122

Zeiger auf die Tastaturdefinitionstabelle (nur XL,XE).
### KEYDEL

||Adr||hex||Name||Description||OS
|753|$02F1|KEYDEL|key delay flag|all

Key delay flag or key debounce counter; used to see if any key has been pressed. If a zero is returned, then no key has been pressed. If three is returned, then any key. It is decremented every stage two VBLANK (1/60 or 1/30th second) until it reaches zero. If any key is pressed while KEYDEL is greater than zero, it is ignored as "bounce."

see also: [Keyboard topics](#Keyboard_topics), [CH](#CH), [CH1](#CH1) 
### KEYDIS

||ADR||HEXADR||NAME||Description||shadow||OS
|621|$026D|KEYDIS|Keyboard disable|none|X

POKE with 255 to disable the keyboard, 0 to reenable. You have to press RESET (all XL/XEs except 1200XL) to get control back if you are locked out; 1200XL users can press CTRL-F1 (toggles it on and off; LED 1 is on when the keyboard is disabled).
### KEYREP

||Adr||hex||Name||description||OS
|730|$02DA|KEYREP|rate of key repeat|XL/XE

The rate of the repeat; default is 6, which means ten characters per second (one each six VBLANK intervals after the delay above). POKE with the number of VBLANK intervals between repeats; with a value of 1, you get 60 characters per second (50 on PAL systems)! A value of 0 provides one key repeat only per press.

see also: [Keyboard topics](#Keyboard_topics), [NOCLIK](#NOCLIK), [KRPDEL](#KRPDEL) 

Bestimmt die Tastenwiederholrate in 1/50sek (Vertical Blanks). Standardwert ist 5.
### KRPDEL

||Adr||hex||Name||description||OS
|729|$02D9|KRPDEL|auto-repeat delay|XL/XE

Auto-delay rate; the time elapsed before keyboard repeat begins. Initially set at 48 ($30; $28 for PAL machines) for 0.8 seconds; you can POKE it with the number of VBLANK intervals (1/60 second each) before repeat begins. A value of 60 would be a one-second delay. A value of 0 means no repeat.

see also: [Keyboard topics](#Keyboard_topics), [NOCLIK](#NOCLIK), [KEYREP](#KEYREP) 

Bestimmt die Verzögerung der Tastenwiederholung 1/50sek (Vertical Blanks). Standardwert ist 40/$28 für PAL. Setzt man den Wert auf 0, prellt die Tastaur und Schreiben wird unmöglich.
### LCOUNT

||DEC||HEX||NAME||OS
|563|$233|LCOUNT|only X

Diese Speicherzelle dient als Hilfsregister für die Gerätetreiberladeroutine (Zähler für die Länge der Einträge).
### LINBUF

Forty-byte character line buffer, used to temporarily buffer one physical line of text when the screen editor is moving screen data. The pointer to this buffer is stored in 100, 101 ($64, $65) during the routine.

Dieser Puffer (40 ($28) Zeichen lang) wird vom Bildschirmtreiber benötigt, um hier temporär Daten während des Verschiebens des Bildschirminhaltes zu speichern. Auf diesen Puffer wird durch ADRESS (100,101; $64,$65) gezeigt. Bei den XL- und XE-Geräten ist dieser Puffer entfallen.
### LINFLG

||ADR||HEXADR||NAME||DESCRIPTION||SHADOW||OS
|0|$0000|LINFLG| | |X
Register für interne Zwecke.
### LINZBS

||ADR||HEXADR||NAME||Description||shadow||OS
|0,1|$0000,$0001|LINZBS| | |A

Es scheint, als ob diese Adresse genutzt wird, um den VBLANK Timer Wert zu speichern.

Ein Metronom-Programm aus dem De Re Atari (Seite 123) nutzt diese Speicherzelle:
%%prettify
```
5 ? " ":REM Bildschirm löschen
6 REM Routine zum Setzen einer Metronom-Rate.
7 REM Von M. Ekbers für Carla.
10 X=10:FOR I=l TO 2 STEP 0
20 TOP=l0:FOR J=l TO TOP:NEXT J:REM Verzögerungs-Schleife
50 IF STICK(0)=l3 THEN X=X+1:REM Nach oben = schneller
51 IF STICK (0)=14 THEN X=X-1:REM Nach unten = langsamer
52 IF X<l THEN X=1:REM X darf niemals kleiner als 1 oder
53 IF X>255 THEN X=255:REM grösser als 255 sein.
54 REM
56 ?"";INT(3600/X);" Schläge pro Minute "
60 POKE 0,X:REM In Speicherstelle $0000 steht die Rate
70 NEXT I:REM für die folgende Assembler-Routine.
-------------------------------------------------------------
40 *=$600
50 ; Metronom-Routine...benutzt $0000 zum Uebersetzen d. Rate.
60 ;
70 AUDF1 = $D200 Audio Frequenz-Register
80 AUDC1 = $D201 Audio Kontroll-Register
90 FREG = $08 AUDF1-Wert
0100 VOLUME = $AF WERT VON AUDC1
0110 OFF = $A0Lautstaerke ausschalten
0120 SETVBV = $E45C Routine zum Setzen des Timer-Wertes
0130 CDTMA2 = $0228 Vektor von Timer 2
0140 ZTIMER = $0000 VBLANK-Wert des Timers in Zero-Page
0150 ;
0160 START LDA #10
0170 STA ZTIMER
0180 INIT
0190 ; Setzen des Timer-Vektors
0200 ;
0210 LDA #CNTINT&255
0220 STA CDTMA2
0230 LDA #CNTINT/256
0240 STA CDTMA2+1
0250 ;
0260 ; Setzen dem Timers nach dem Voktor
0270 ;
0290 LDY ZTIMER Setzen von Timer 2 auf Zaehler
0290 JSR SETIME
0300 RTS
0310 ;
0320 ;
0330 ;
0340 CNTINT
0350 ;
0360 ; Bereitmachen das Audio-Kanals für "Klick"-
0370 ; Geraeusch
0380 LDA #VOLUME
0390 STA AUDC1
0400 LDA #FREQ
0410 STA AUDF1
0420 LDY #$FF
0430 DELAY
0440 DEY
0450 BNE DELAY
0460 STY AUDC1
0470 JMP INIT
0480 ;
0490 ; Unterroutine zum Setzen das Timers
0500 ;
0510 SETIME
0520 LDX #0 Niemals 256 VBLANKs
0530 LDA #2 Setzen von Timer 2
0540 JSR SETVBV System-Routine zum Setzen
0550 RTS der Timer
0560 *=$2E2
0570 .WORD START
0580 .END
```
/%
### LMARGN

||ADR||HEXADR||NAME||Description||shadow||OS
|82|$0052|LMARGN|Left margin of text|none|All

Column of the left margin of text (GR.0 or text window only). Zero is the value for the left edge of the screen; [LMARGN](#LMARGN) is initialized to two. You can POKE the margin locations to set them to your specific program needs, such as POKE 82,10 to make the left margin start ten locations from the edge of the screen.
### LOGCOL

||ADR||HEXADR||NAME||Description||shadow||OS
|99|$0063|LOGCOL| |none|all
Position of the cursor at the column in a logical line. A logical line can contain up to three physical lines, so [LOGCOL](#LOGCOL) can
range between zero and 119. Used by the display handler.
### LPENH

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS||SHADOW OF
|R|564|$234|LPENH|horizontale Position des Lightpens|both|[PENH](#PENH) 54284 $D40C

Der Wert diese Speicherzelle gibt die horizontale Position des Lightpens an. Wertebereich zwischen 0 und 227 ($E3) für NTSC.

see also: [Display List Topics](#Displaylist_topics), [VCOUNT](#VCOUNT) 

previous: [LCOUNT](#LCOUNT) 

next: [LPENV](#LPENV) 
### LPENV

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS||SHADOW OF
|R|565|$235|LPENV|horizontale Position des Lightpens|both|[PENV](#PENV) 54285 $D40D

Der Wert diese Speicherzelle gibt die vertikale Position des Lightpens an. Wertebereich zwischen 16 und 111 für NTSC.

Wird nur jede 1/50 Sekunde aktualisiert

see also: [Display List Topics](#Displaylist_topics), [VCOUNT](#VCOUNT) 

previous: [LPENH](#LPENH) 

next: [BRKKY](#BRKKY) 
### M0PF

[{SET_alias-'HPOSP0'}](#{SET_alias-'HPOSP0'}) 
### M1PF

[{SET_alias-'HPOSP1'}](#{SET_alias-'HPOSP1'}) 
### MEMTOP

||ADR||HEXADR||NAME||Description||shadow||OS
|741,742|$02E5,$02E6|MEMTOP aka HIMEM| | |all

Zeiger auf das letzte für den Anwender freie Byte im Speicher. Das entspricht jedoch nicht dem Ende des RAM. Oberhalb von MEMTOP liegen noch die Display-List und die Bildspeicherdaten. Der Wert von MEMTOP kann sich ändern beim Wechsel der Grafikstufe, Öffnen eines Kanals für den Bildschirm, RESET und POWER-UP.

Von BASIC wird diese Speicherstelle als [HIMEM](#MEMTOP) bezeichnet.

Wenn ein Wechsel der Grafikstufe dazu führt, dass Speicher unterhalb der von [APPMHI](#APPMHI) angegebenen Adresse benötigt wird, dann wird der Bildschirm zurück in GRAPHICS 0 gesetzt, MEMTOP wird aktuallisert und ein Fehler wird ausgegeben. Andernfalls wird der Wechsel der Grafikstufe durchgeführt und MEMTOP wird auf den neuen Wert gesetzt.

Es ist Vorsicht geboten, wenn Daten unterhalb von MEMTOP abgelegt werden, da diese durch einen Wechsel der Grafikstufe zerstört werden können. Um dies zu vermeiden, muss sichergestellt werden, dass APPMHI einen Wert hat, der oberhalb der relevanten Daten liegt.

---

Siehe auch:
*[MEMTOP](#TOPSTK) - BASIC MEMTOP/TOPSTK (Ende des Runtime Stack und damit des Ende des BASIC-Programmes)
*[APPMHI](#APPMHI) - Adresse oberhalb derer die Bildschirmdaten und die Displaylist liegen können
### NEWCOL

||ADR||HEXADR||NAME||Description||shadow||OS
|97,98|$0061,$0062|NEWCOL| |none|A
Point (column) to which DRAWTO and XIO 18 (FILL) will go. [NEWROW](#NEWROW) and [NEWCOL](#NEWCOL) are initialized to the values in [ROWCRS](#ROWCRS) and [COLCRS](#COLCRS) (84 to 86; $54 to $56) above, which represent the destination end point of the DRAW and FILL functions. This is done so that [ROWCRS](#ROWCRS) and [COLCRS](#COLCRS) can be altered during these routines.
### NEWROW

||ADR||HEXADR||NAME||Description||shadow||OS
|96|$0060|NEWROW| |none|A
Point (row) to which DRAWTO and XIO 18 (FILL) will go. For explanation see [NEWCOL](#NEWCOL) 
### NGFLAG

||ADR||HEXADR||NAME||Description||shadow||OS
|1|$0001|NGFLAG| | |X

Diese Speicherzelle dient zur Feststellung ob RAM- oder ROM-Fehler bei der Speicherüberprüfung während des Bootvorgangs aufgetreten sind.

Dazu wird im Flag beim Start des Bootvorgangs Bit Null gesetzt. Bei jedem Fehler wird das Register um ein Bit nach rechts verschoben.

||Null:|es wurden Speicher-Fehler während des Bootvorgangs festgestellt
||Eins:|keine Speicherfehler
### NMIEN

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS||DEFAULT VALUE
|read only|54286|$D40E|NMIEN|Non Maskable Interrupt Enable|both|64/$40


||Bit||Value||Interrupt
|7|$80/128|DLI (Display List INTERRUPT) enable
|6|$40/64|VBI (Vertical Blank INTERRUPT) enable
|5|$20/32|SYSTEM RESET enable
|4| |not used
|3| |not used
|2| |not used
|1| |not used
|0| |not used


Bit 7 does NOT switch on/off the Display List itself, but the display List INTERRUPTS!

---

see also: [Display List topics](#Displaylist_topics) 

previous: [PENV](#PENV) 

next: [NMIST](#NMIST),[NMIRST](#NMIST) 
### NMIST

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|read|54287|$D40F|NMIST|Non Maskable Interrupt Status|both
|write|54287|$D40F|NMIRES|Non Maskable Interrupt Reset|both

NMIST: NMI status, holds cause for the NMI interrupt in BITs 5, 6 and 7

NMIRES: Reset for NMIST. Clears the interrupt request register and resets all of the NMI status together.

||Bit||Interrupt
|7|DLI (Display List)
|6|VBI (Vertical Blank)
|5|SYSTEM RESET
|4|not used
|3|not used
|2|not used
|1|not used
|0|not used

---

see also: [Display List topics](#Displaylist_topics), [VVBLKI](#VVBLKI), [WARMSV](#WARMSV) 

previous: [NMIEN](#NMIEN) 
### NOCLIK

||Adr||hex||Name||Description||OS
|731|$02DB|NOCLIK|keyboard click on/off|XL/XE

This is the keyboard click disable register; POKE with any non-zero number to disable the annoying keyboard sound produced through your TV. POKE again with 0 to enable the sound. On the 1200XL, CTRL-F3 toggles the sound as well.


Tastenklick, $FF schaltet den Klick aus (XL/XE). Standerdwert für "Ton an" ist 0.

---
see also: [Sound_Topics](#Sound_Topics), [Keyboard topics](#Keyboard_topics) 
### OLDADR

||ADR||HEXADR||NAME||Description||shadow||OS
|94,95|$005E,$005F|OLDADR| |none|all
Retains the memory location of the current cursor location. Used with location 93 [OLDCHR](#OLDCHR) to restore the character under the cursor when the cursor moves
### OLDCHR

||ADR||HEXADR||NAME||Description||shadow||OS
|93|$005D|OLDCHR| |none|all
Retains the value of the character under the cursor used to restore that character when the cursor moves
### OLDCOL

||ADR||HEXADR||NAME||Description||shadow||OS
|91,92|$005B,$005C|OLDCOL| |none|all
Previous graphics cursor column. Updated from locations 85,86/$55,$56 [COLCRS](#COLCRS) before every operation. These locations are used by the DRAWTO and XIO 18 (FILL) commands to determine the starting column of the DRAW or FILL
### OLDROW

||ADR||HEXADR||NAME||Description||shadow||OS
|90|$005A|OLDROW| |none|all
Previous graphics cursor row. Updated from location 84/$54 [ROWCRS](#ROWCRS) before every operation. Used to determine the starting row for the DRAWTO and XIO 18 (FILL command).
### PBCTL

||ADR||HEXADR||NAME||Description||OS
|54019|$D303|PBCTL|Port B Control|only A (400/800)

||Bit||Function||Description
|7|PA7|Interrupt status of SIO
|6|PA6|always 0
|5|PA5|always 1
|4|PA4|always 1
|3|PA3|Status of command line of SIO
|2|PA2|1=use Port B for data input/output, 0=define data direction, see below
|1|PA1|always 0
|0|PA0|Interrupt of PROCEED line on/off, set to 0 by OS

To define the data direction of PORT B, set Bit 2 of [PBCTL](#PBCTL) to 0. Then write a byte to [PORTB](#PORTB), where Bits set to 1 indicate WRITE and Bits set to 0 indicate READ. Normally [PORTB](#PORTB) is set to %00000000 (=all input).

---
see also: [Controller topics](#Controller_topics) 

previous: [PACTL](#PACTL) 

next: [DMACTL](#DMACTL) of ANTIC
### PBPNT

||ADR||HEXADR||NAME||Description||shadow||OS
|29|$001D|PBPNT|Print Buffer Pointer|none|A
Print buffer pointer; points to the current position (byte) in the print buffer. Ranges from zero to the value in location 30 [PBUFSZ](#PBUFSZ).
### PBUFSZ

||ADR||HEXADR||NAME||Description||shadow||OS
|30|$001E|PBUFSZ|Print buffer size|none|A
Print buffer size of printer record for current mode. Normal buffer size and line size equals 40 bytes; double-width print equals 20 bytes (most printers use their own control codes for expanded print); sideways printing equals 29 bytes (Atari 820 printer only). Printer status request equals four. PBUFSZ is initialized to 40. The printer handler checks to see if the same value is in PBPNT and, if so, sends the contents of the buffer to the printer.
### PBUFSZT

||ADR||HEXADR||NAME||Description||shadow||OS
|30|$001E|PBUFSZ| |none|A
Print buffer size of printer record for current mode. Normal buffer size and line size equals 40 bytes; double-width print equals 20 bytes (most printers use their own control codes for expanded print); sideways printing equals 29 bytes (Atari 820 printer only). Printer status request equals four. PBUFSZ is initialized to 40. The printer handler checks to see if the same value is in PBPNT and, if so, sends the contents of the buffer to the printer.
### PCOLR0

||ADR||HEXADR||NAME||DESCRIPTION||SHADOW OF||OS
|704|$02C0|PCOLR0|Color of Player and Missile 0|[COLPM0](#COLPM0) |all

Missiles have the same color as corresponding Players (e.g. P0=M0, P1=M1) except when joined together as 5th player by setting Bit 4 of [PRIOR](#PRIOR)/[GPRIOR](#GPRIOR). Then they have the color of register 3 [COLOR3](#COLOR3)/[COLPF3](#COLPF3).

---
see also: [Color topics](#Color_topics), [Player Missile Topics](#Pm_topics) 

previous: 703, $02BF, [BOTSCR](#BOTSCR) 

next: 705, $02C1, [PCOLR1](#PCOLR1), Player/Missile 1 Color Register
### PCOLR1

||ADR||HEXADR||NAME||DESCRIPTION||SHADOW OF||OS
|705|$02C1|PCOLR1|Color of Player and Missile 1|[COLPM1](#COLPM1) |all

Missiles have the same color as corresponding Players (e.g. P0=M0, P1=M1) except when joined together as 5th player by setting Bit 4 of [PRIOR](#PRIOR)/[GPRIOR](#GPRIOR). Then they have the color of register 3 [COLOR3](#COLOR3)/[COLPF3](#COLPF3).

---
see also: [Color topics](#Color_topics), [Pm_topics](#Pm_topics) 

previous: 704, $02C0, [PCOLR0](#PCOLR0), Player/Missile 0 Color Register

next: 706, $02C2, [PCOLR2](#PCOLR2), Player/Missile 2 Color Register
### PCOLR2

||ADR||HEXADR||NAME||DESCRIPTION||SHADOW OF||OS
|706|$02C2|PCOLR2|Color of Player and Missile 2|[COLPM2](#COLPM2) |all

Missiles have the same color as corresponding Players (e.g. P0=M0, P1=M1) except when joined together as 5th player by setting Bit 4 of [PRIOR](#PRIOR)/[GPRIOR](#GPRIOR). Then they have the color of register 3 [COLOR3](#COLOR3)/[COLPF3](#COLPF3).

---
see also: [Color topics](#Color_topics), [Pm_topics](#Pm_topics) 

previous: 705, $02C1, [PCOLR1](#PCOLR1), Player/Missile 1 Color Register

next: 707, $02C3, [PCOLR3](#PCOLR3), Player/Missile 3 Color Register
### PCOLR3

||ADR||HEXADR||NAME||DESCRIPTION||SHADOW OF||OS
|707|$02C3|PCOLR3|Color of Player and Missile 3|[COLPM3](#COLPM3) |all

Missiles have the same color as corresponding Players (e.g. P0=M0, P1=M1) except when joined together as 5th player by setting Bit 4 of [PRIOR](#PRIOR)/[GPRIOR](#GPRIOR). Then they have the color of register 3 [COLOR3](#COLOR3)/[COLPF3](#COLPF3).

---
see also: [Color topics](#Color_topics), [Pm_topics](#Pm_topics) 

previous: 706, $02C2, [PCOLR2](#PCOLR2), Player/Missile 2 Color Register

next: 708, $02C4, [COLOR0](#COLOR0), Color Register 0
### PENH

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS||SHADOW
|R|54284|$D40C|PENH|horizontale Position des Lightpens|both|[LPENH](#LPENH) 564/$234

Der Wert diese Speicherzelle gibt die horizontale Position des Lightpens an. Wertebereich zwischen 0 und 227 ($E3) für NTSC.

---
see also: [Display List Topics](#Displaylist_topics), [VCOUNT](#VCOUNT) 

previous: [VCOUNT](#VCOUNT) 

next: [PENV](#PENV) 
### PENV

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS||SHADOW
|R|54285|$D40D|PENV|vertikale des Lightpens|both|[LPENV](#LPENV) 565/$235

Der Wert diese Speicherzelle gibt die vertikale Position des Lightpens an. Wertebereich zwischen 16 und 111 für NTSC.

---
see also: [Display List Topics](#Displaylist_topics), [VCOUNT](#VCOUNT) 

previous: [PENH](#PENH) 

next: [NMIEN](#NMIEN) 
### PM-collisions

# Collision Registers
Player to Player Collisions [P0PL](#P0PL) [P1PL](#P1PL) [P2PL](#P2PL) [P3PL](#P3PL) 

Missile to Player Collisions [M0PL](#M0PL) [M1PL](#M1PL) [M2PL](#M2PL) [M3PL](#M3PL) 

Player to Playfield Collisions [P0PF](#HPOSM0) [P1PF](#HPOSM1) [P2PF](#HPOSM2) [P3PF](#HPOSM3) 

Missile to Plafield Collisions [M0PF](#HPOSP0) [M1PF](#HPOSP1) [M2PF](#HPOSP2) [M3PF](#HPOSP3) 

Clear all Collision register [HITCLR](#HITCLR) 
### PM-line-resolution

For switching between single and double line resolution see Bit 5 of [SDMCTL](#SDMCTL) 

To get a Player or Missile in every possible row when using double line resolution use [VDELAY](#VDELAY).

see also:[Player Missile Topics](#Pm_topics) 
### Pm-memory-map

# Memory Map for Player Missile Graphics
||single line resolution|| | || double line resolution||
||dec ||hex ||data ||dec ||hex
|0-767 |$0000-$02FF |not used by PM graphicse.g. can be used for storing horizontal position of players or shapes |0-383 |$0000-$017F
|768-1023 |$0300-$03FF |Missiles |384-511 |$0180-$01FF
|1024-1279 |$0400-$04FF |Player 0 |512-639 |$0200-$027F
|1280-1535 |$0500-$05FF |Player 1 |640-767 |$0280-$02FF
|1536-1791 |$0600-$06FF |Player 2 |768-895|$0300-$037F
|1792-2047 |$0700-$07FF|Player 3 |896-1023|$0380-$03FF

for switching between single and double line resolution see Bit 5 of [SDMCTL](#SDMCTL) 

for adjusting the vertical position in double line resolution see [VDELAY](#VDELAY) 

for setting the base address of the PM memory map see [PMBASE](#PMBASE) 

see also:[Player Missile Topics](#Pm_topics) 
### PMBASE

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|write |54279 |$D407|PMBASE|PM data base address (MSB)|both

The PMBASE write-only register sets the base of memory occupied by Player-Missile Graphics.
According to bit 4 of [DMACTL](#DMACTL):
- when it is 0, the PMG memory area occupies 1024 ($400) bytes of memory and only upper 6 bits of PMBASE matter, so the PM memory area can be set to begin of 1KB boundary.
- when it is 1, the PMG memory area occupies 2048 ($800) bytes of memory and only upper 5 bits of PMBASE matter, so the PM memory area can be set to begin of 2KB boundary.
---
see also: [Player Missile Topics](#Pm_topics) [Pm-memory-map](#Pm-memory-map) 

previous: [VSCROL](#VSCROL) 

next: [CHBASE](#CHBASE) 
### PM_examples

### PMG examples.

Because some people do have problems every time they try to set PMG, here is simple example showing "A" letter using PMG with mentioning which setting is obligatory and which not.
In addition, in normal "legal" use (system interrupts on), shadow-registers must be used otherwise efect of writing to registers lasts for at most 1 frame.

It is worth noting, that PMG is drawn by ANTIC (GTIA is fed with bytes read by ANTIC DMA), thus some registers belong to ANTIC, some to GTIA.

```
        org $4000
        ; to avoid blink, here should be a loop waiting for interrupt
        lda #%111110    ; obligatory, double line, no missle DMA;
        sta $22f        ; DMACTL - 62 - single line, normal playfield
        lda #$80        ; obligatory
        sta $D407       ; PMBASE
        lda #$7c        ; obligatory
        sta $D000       ; HPOSP
        lda #1          ; default is good for this example, may be skipped
        sta $26f        ; first PM then PF
        lda #%11        ; obligatory
        sta $D01D       ; GRACTL -set both players and missles        
        lda #2          ; default is good for this example, may be skipped
        sta $D008       ; SIZEP
        lda #$2f        ; this is the color of the
        sta $2c0        ; PCOLR0, surely may be skipped.

        ldx #7
        ; let's display 'A' letter
show
        lda $e108,x     ; get 'A' letter rows from char generator 
        sta $8440,x     ; store it in PLAYER0 memory chunk.
        dex
        bpl show        ; do it eight times
end
        bne end         ; wait for eternity.
        }}}
```
### PM_topics

# Player Missile Topics

[Memory Map PM Graphics](#pm-memory-map) 

[PMBASE](#PMBASE) 

[SDMCTL](#SDMCTL) 

[GRACTL](#GRACTL) 

[GPRIOR](#GPRIOR) 

[VDELAY](#VDELAY) 

[GRAFP0](#GRAFP0) [GRAFP1](#GRAFP1) [GRAFP2](#GRAFP2) [GRAFP3](#GRAFP3) [GRAFM](#GRAFM) 

PM Resolution, see Bit 4 of [SDMCTL](#SDMCTL) and [VDELAY](#VDELAY), [Memory Map PM Graphics](#pm-memory-map) 

PM Width [SIZEP0](#SIZEP0) [SIZEP1](#SIZEP1) [SIZEP2](#SIZEP2) [SIZEP3](#SIZEP3) [SIZEM](#SIZEM) 

PM Colors [PCOLR0](#PCOLR0) [PCOLR1](#PCOLR1) [PCOLR2](#PCOLR2) [PCOLR3](#PCOLR3) 

PM positions horizontal [HPOSP0](#HPOSP0) [HPOSM0](#HPOSM0) [HPOSP1](#HPOSP1) [HPOSM1](#HPOSM1) [HPOSP2](#HPOSP2) [HPOSM2](#HPOSM2) [HPOSP3](#HPOSP3) [HPOSM3](#HPOSM3) 

PM collisions [M0PF](#HPOSP0) [M1PF](#HPOSP1) [M2PF](#HPOSP2) [M3PF](#HPOSP3) [P0PF](#HPOSM0) [P1PF](#HPOSM1) [P2PF](#HPOSM2) [P3PF](#HPOSM3) [M0PL](#SIZEP0) [M1PL](#SIZEP1) [M2PL](#SIZEP2) [M3PL](#SIZEP3) [P0PL](#SIZEM) [P1PL](#GRAFP0) [P2PL](#GRAFP1) [P3PL](#GRAFP2) [HITCLR](#HITCLR) 

[Player-missile graphics examples](#PM_examples) 
---
see [topic_list](#topic_list) 
### POKMSK

||ADR||HEXADR||NAME||Description||shadow||OS
|16|$10|POKMSK|Interrupt-Maske für POKEY |[IRQEN](#IRQEN)|



||BIT||DECIMAL||FUNCTION
|7|128| BREAK key is enabled.
|6|64| "other key" interrupt is enabled.
|5|32| Serial input data ready interrupt is enabled.
|4|16| Serial output data required interrupt is enabled.
|3|8| Serial out transmission finished interrupt is enabled.
|2|4| POKEY timer four interrupt is enabled (only in the "B" or later versions of the OS ROMs).
|1|2| POKEY timer two interrupt is enabled.
|0|1| POKEY timer one interrupt is enabled.
### PORTA

||ADR||HEXADR||NAME||Description||shadow||OS
|54016|$D300|PORTA| | [STICK0](#STICK0) [STICK1](#STICK1) | all

Read or write data from the control ports (joystick ports), depending on how the data direction is set (default: 0 "read/input"). To set the direction, set Bit 2 of [PACTL](#PACTL) to "0" and define the direction by setting the bits of PORTA (0=read, 1=write) for each input/output line. Then set Bit 2 of [PACTL](#PACTL) to "1" again.

Example:
```
PACTL=PACTL && %11111011 ;set Bit 2 to 0
PORTA=%11110000          ;set Port 2 to output/write, Port 1 is input/read
PACTL=PACTL %% %00000100 ;set Bit 2 to 1
```

||Bit||Function||Description||Joystick direction||Paddletrigger
|7|PA7|Joystick Port 2 Pin 4|Right|Paddle 4 [PTRIG3](#PTRIG3) 
|6|PA6|Joystick Port 2 Pin 3|Left|Paddle 3 [PTRIG2](#PTRIG2) 
|5|PA5|Joystick Port 2 Pin 2|Down|not used
|4|PA4|Joystick Port 2 Pin 1|Up |not used
|3|PA3|Joystick Port 1 Pin 4|Right|Paddle 2 [PTRIG1](#PTRIG1) 
|2|PA2|Joystick Port 1 Pin 3|Left|Paddle 1 [PTRIG0](#PTRIG0) 
|1|PA1|Joystick Port 1 Pin 2|Down|not used
|0|PA0|Joystick Port 1 Pin 1|Up|not used

Joystick direction Bit=0 when pushed in that direction

Paddletrigger Bit=0 when pressed
---
see also: [Controller topics](#Controller_topics) 

previous: [SKCTL](#SKCTL),[SKSTAT](#SKCTL) of POKEY

next: [PORTB](#PORTB) 
### PORTB

# For 400, 800 (OS A)
||ADR||HEXADR||NAME||Description||shadow||OS
|54017|$D301|PORTB| | [STICK2](#STICK2) [STICK3](#STICK3) [PTRIG4](#PTRIG4) [PTRIG5](#PTRIG5) [PTRIG6](#PTRIG6) [PTRIG7](#PTRIG7)| 400/800

Read or write data from the control ports (joystick ports), depending on how the data direction is set (default: 0 "read/input"). To set the direction, set Bit 2 of [PBCTL](#PBCTL) to "0" and define the direction by setting the bits of PORTB (0=read, 1=write) for each input/output line. Then set Bit 2 of [PBCTL](#PBCTL) to "1" again.

Example:
```
PACTL=PACTL && %11111011 ;set Bit 2 to 0
PORTA=%11110000          ;set Port 2 to output/write, Port 1 is input/read
PACTL=PACTL %% %00000100 ;set Bit 2 to 1
```

||Bit||Function||Description||Joystick direction||Paddletrigger
|7|PA7|Joystick Port 4 Pin 4|Right|Paddle 8 [PTRIG7](#PTRIG7) 
|6|PA6|Joystick Port 4 Pin 3|Left|Paddle 7 [PTRIG6](#PTRIG6) 
|5|PA5|Joystick Port 4 Pin 2|Down|not used
|4|PA4|Joystick Port 4 Pin 1|Up |not used
|3|PA3|Joystick Port 3 Pin 4|Right|Paddle 6 [PTRIG5](#PTRIG5) 
|2|PA2|Joystick Port 3 Pin 3|Left|Paddle 5 [PTRIG4](#PTRIG4) 
|1|PA1|Joystick Port 3 Pin 2|Down|not used
|0|PA0|Joystick Port 3 Pin 1|Up|not used

Joystick direction sets Bit=0 when pushed in that direction

Paddletrigger Bit=0 when pressed

# For 600XL, 800XL, 1200XL

||ADR||HEXADR||NAME||Description||OS
|54017|$D301|PORTB| Memory Management | XL/XE

1200XL
||Bit||Function||Description
|7|$5000-$57FF|0=Self test, 1=RAM
|6|not used|
|5|not used|
|4|not used|
|3|LED2|0=off, 1=on
|2|LED1|0=off, 1=on
|1|not used
|0|$C000-$FFFF|0=RAM, 1=OS-ROM

600XL/800XL
||Bit||Function||Description
|7|$5000-$57FF|0=Self test, 1=RAM
|6|not used|
|5|not used|
|4|not used|
|3|not used|
|2|not used|
|1|$A000-$BFFF|0=ATARI BASIC ROM, 1=RAM
|0|$C000-$FFFF|0=RAM, 1=OS-ROM

# For 130XE
Bits 2,3,4,5 set the behavior of extended RAM which is always mapped to $4000-$7FFF area.
||Bit||Function||Description
|7|$5000-$57FF|0=Self test, 1=RAM
|6|not used|
|5|ANTIC|0=ANTIC has access to extended RAM, 1=ANTIC has access to main RAM
|4|CPU|0=CPU has access to extended RAM, 1=CPU has access to main RAM
|3|$4000-$7FFF|Bank selection bit
|2|$4000-$7FFF|Bank selection bit
|1|$A000-$BFFF|0=ATARI BASIC ROM, 1=RAM
|0|$C000-$FFFF|0=RAM, 1=OS-ROM

Compatibility mode (only main bank enabled)
||Bit 5   ||Bit 4   ||Bit 3   ||Bit 2   ||CPU accesses   ||ANTIC accesses
|VBE     |CPE     |Bank selection|Bank selection| |
|1       |1       |doesn't matter|doesn't matter|M $4000-$7FFF|   M $4000-$7FFF

CPU extended RAM mode
||Bit 5   ||Bit 4   ||Bit 3   ||Bit 2   ||CPU accesses   ||ANTIC accesses
|VBE     |CPE     |Bank selection |Bank selection| |
|1       |0       |0       |0       |E $0000-$3FFF   |M $4000-$7FFF
|1       |0       |0       |1       |E $4000-$7FFF   |M $4000-$7FFF
|1       |0       |1       |0       |E $8000-$BFFF   |M $4000-$7FFF
|1       |0       |1       |1       |E $C000-$FFFF   |M $4000-$7FFF

Video (ANTIC) extended RAM mode
||Bit 5   ||Bit 4   ||Bit 3   ||Bit 2   ||CPU accesses  ||ANTIC accesses
|VBE     |CPE     |Bank selection|Bank selection| |
|0       |1       |0       |0       |M $4000-$7FFF   |E $0000-$3FFF
|0       |1       |0       |1       |M $4000-$7FFF   |E $4000-$7FFF
|0       |1       |1       |0       |M $4000-$7FFF   |E $8000-$BFFF
|0       |1       |1       |1       |M $4000-$7FFF   |E $C000-$FFFF

General extended RAM Mode
||Bit 5   ||Bit 4   ||Bit 3   ||Bit 2   ||CPU accesses   ||ANTIC accesses
|VBE     |CPE     |Bank selection|Bank selection| |
|0       |0       |0       |0       |E $0000-$3FFF   |E $0000-$3FFF
|0       |0       |0       |1       |E $4000-$7FFF   |E $4000-$7FFF
|0       |0       |1       |0       |E $8000-$BFFF   |E $8000-$BFFF
|0       |0       |1       |1       |E $C000-$FFFF   |E $C000-$FFFF

---
see also: [Controller topics](#Controller_topics) 

previous: [PORTA](#PORTA) 

next: [PACTL](#PACTL) 
### POT0

[{SET_alias-'AUDF1'}](#{SET_alias-'AUDF1'}) 
### POT1

[{SET_alias-'AUDC1'}](#{SET_alias-'AUDC1'}) 
### POT2

[{SET_alias-'AUDF2'}](#{SET_alias-'AUDF2'}) 
### POT3

[{SET_alias-'AUDC2'}](#{SET_alias-'AUDC2'}) 
### POT4

[{SET_alias-'AUDF3'}](#{SET_alias-'AUDF3'}) 
### POT5

[{SET_alias-'AUDC3'}](#{SET_alias-'AUDC3'}) 
### POT6

[{SET_alias-'AUDF4'}](#{SET_alias-'AUDF4'}) 
### POT7

[{SET_alias-'AUDC4'}](#{SET_alias-'AUDC4'}) 
### POTGO

||Read/Write||ADR||HEXADR||NAME||Description||OS
|Write|53771|$D20B|POTGO|Start Pot reading sequence|all

Start the POT scan sequence. You must read your POT values first and then start the scan sequence, since POTGO resets the POT registers to zero. Written by the stage two VBLANK sequence.

---
see also: [Controller topics](#Controller_topics), [POT0](#POT0)-[POT7](#POT7), [ALLPOT](#ALLPOT), [PADDL0](#PADDL0)-[PADDL7](#PADDL7) 

previous: [RANDOM](#SKREST),[SKREST](#SKREST) 

next: [SEROUT](#SEROUT),[SERIN](#SEROUT) 
### PRIOR

||ADR||HEXADR||NAME||Description||shadow||OS
|53275|$D01B|PRIOR|Priority Selection Register|[GPRIOR](#GPRIOR)|all

## Priority Settings
||Bit||Value||Description
|0|1|P0-P1-P2-P3 PF0-PF1-PF2-PF3 BAK
|1|2|P0-P1 PF0-PF1-PF2-PF3 P2-P3 BAK
|2|4|PF0-PF1-PF2-PF3 P0-P1-P2-P3 BAK
|3|8|PF0-PF1 P0-P1-P2-P3 PF2-PF3 BAK
|4|16|Four Missiles add up to be 5th player
|5|32|Overlapping Players have 3rd color
|6|64|GTIA Mode see next table
|7|128|GTIA Mode see next table
P0-P3 Players [PCOLR0](#PCOLR0).../[COLPM0](#COLPM0)...
PF0-PF3 Playfield colors [COLOR0](#COLOR0).../[COLPF0](#COLPF0)...
BAK background or border color [COLOR4](#COLOR4)/[COLBK](#COLBK) 

A logical OR is done to the colors of players 0/1 and 2/3 when they overlap. Only the 0/1, 2/3 combinations are allowed; you will not get a third color when players 1 and 3 overlap, the priorities set with bits 0…3 are applied.

If put together into a 5th player (set Bit 4 to '1') the missiles get the color of register 3 [COLOR3](#COLOR3). They still move independently, e.g. set their horizontal positions with [HPOSM0](#HPOSM0) - [HPOSM3](#HPOSM3) 

## GTIA Modes
This register can be used to select one of GTIA GRAPHICS modes 9, 10 and 11.
||GTIA Mode*||Bit 6||Bit 7||Description
|9|0|1|16 different luminances of the same hue (color)
|10|1|0|9 different colors
|11|1|1|16 different hues (colors) of the same luminance
* the same as GRAPHICS x in BASIC
---

see also: [Player Missile Topics](#Pm_topics) 

previous: [COLBK](#COLBK) 

next: [VDELAY](#VDELAY) 
### PTEMP

||ADR||HEXADR||NAME||Description||shadow||OS
|31|$001F|PTEMP| |none|A
Temporary register used by the printer handler for the value of the character being output to the printer.
### PTIMOT

||ADR||HEXADR||NAME||Description||shadow||OS
|28|$001C|PTIMOT|Printer timeout|none|A
Printer timeout, called every printer status request. Initialized to 30, which represents 32 seconds (the value is 64 seconds per 60 increments in this register); typical timeout for the Atari 825 printer is five seconds. The value is set by your printer handler software. It is updated after each printer status request operation. It gets the specific timeout status from location 748 ($2EC), which is loaded there by SIO.

The new "B" type OS ROMs have apparently solved the problem of timeout that haunted the "A" ROMs; you saw it when the printer or the disk drive periodically went to sleep (timed out) for a few seconds, causing severe anxiety attacks in the owners who thought their Ataris had just mysteriously died. This is compounded when one removes a disk from the drive, believing the I/O process to be finished--only to have the drive start up again after the timeout and trying to write to or read from a nonexistent disk. Usually both the system and the user crash simultaneously at this point. See the appendix for more information on the new ROMs.
### PTRIG0

||ADR||HEXADR||NAME||Description||shadow of||OS
|636| $027C|PTRIG0|Paddle 1 Trigger| [PORTA](#PORTA) |all
0 when trigger pressed

1 when trigger released

Paddle 1 trigger is the same as Joystick 1 pushed left

---
see also: [Controller topics](#Controller_topics), [Latch triggers](#GRACTL) 

previous:

next: [PTRIG1](#PTRIG1) 
### PTRIG1

||ADR||HEXADR||NAME||Description||shadow of||OS
|637| $027D|PTRIG1|Paddle 2 Trigger| [PORTA](#PORTA) |all
0 when trigger pressed

1 when trigger released

Paddle 1 trigger is the same as Joystick 1 pushed right

---
see also: [Controller topics](#Controller_topics), [Latch triggers](#GRACTL) 


previous: [PTRIG0](#PTRIG0) 

next: [PTRIG2](#PTRIG2) 
### PTRIG2

||ADR||HEXADR||NAME||Description||shadow of||OS
|638| $027E|PTRIG2|Paddle 3 Trigger| [PORTA](#PORTA) |all
0 when trigger pressed

1 when trigger released

Paddle 1 trigger is the same as Joystick 2 pushed left

---
see also: [Controller topics](#Controller_topics), [Latch triggers](#GRACTL) 


previous: [PTRIG1](#PTRIG1) 

next: [PTRIG3](#PTRIG3) 
### PTRIG3

||ADR||HEXADR||NAME||Description||shadow of||OS
|639| $027F|PTRIG3|Paddle 4 Trigger| [PORTA](#PORTA) |all
0 when trigger pressed

1 when trigger released

Paddle 1 trigger is the same as Joystick 2 pushed right

---
see also: [Controller topics](#Controller_topics), [Latch triggers](#GRACTL) 


previous: [PTRIG2](#PTRIG2) 

next: [PTRIG4](#PTRIG4) 
### PTRIG4

||ADR||HEXADR||NAME||Description||shadow of||OS
|640| $0280|PTRIG4|Paddle 5 Trigger| [PORTB](#PORTB) |OS A and B
0 when trigger pressed

1 when trigger released

Paddle 1 trigger is the same as Joystick 3 pushed left

---
see also: [Controller topics](#Controller_topics), [Latch triggers](#GRACTL) 


previous: [PTRIG3](#PTRIG3) 

next: [PTRIG5](#PTRIG5) 
### PTRIG5

||ADR||HEXADR||NAME||Description||shadow of||OS
|641| $0281|PTRIG5|Paddle 6 Trigger| [PORTB](#PORTB) |OS A and B
0 when trigger pressed

1 when trigger released

Paddle 1 trigger is the same as Joystick 3 pushed right

---
see also: [Controller topics](#Controller_topics), [Latch triggers](#GRACTL) 


previous: [PTRIG4](#PTRIG4) 

next: [PTRIG6](#PTRIG6) 
### PTRIG6

||ADR||HEXADR||NAME||Description||shadow of||OS
|642| $0282|PTRIG6|Paddle 7 Trigger| [PORTB](#PORTB) |OS A and B
0 when trigger pressed

1 when trigger released

Paddle 1 trigger is the same as Joystick 4 pushed left

---
see also: [Controller topics](#Controller_topics), [Latch triggers](#GRACTL) 

previous: [PTRIG5](#PTRIG5) 

next: [PTRIG7](#PTRIG7) 
### PTRIG7

||ADR||HEXADR||NAME||Description||shadow of||OS
|643| $0283|PTRIG7|Paddle 8 Trigger| [PORTB](#PORTB) |OS A and B
0 when trigger pressed

1 when trigger released

Paddle 1 trigger is the same as Joystick 4 pushed right

---
see also: [Controller topics](#Controller_topics), [Latch triggers](#GRACTL) 

previous: [PTRIG6](#PTRIG6) 

next: [STRIG0](#STRIG0) 
### RAMLO

||ADR||HEXADR||NAME||Description||shadow||OS
|4,5|$0004,$0005|RAMLO| | |all

RAMLO hat mehrere Verwendungsmöglichkeiten, allerdings keine, die für den Nutzer relevant sind.

Diese Speicherzelle wird als Zeiger für den Speichertest während des Einschaltvorgangs benutzt.
(RAMLO, [TRAMSZ](#TRAMSZ) und [TSTDAT](#TSTDAT) arbeiten hierbei zusammen.)

Hier wird auch die Adresse für die Fortsetzung des Disketten- oder Kassettenbootvorgangs (dies ist die Ladeadresse plus sechs - normalerweise 1798;$0706) abgelegt.
### RAMSIZ

||ADR||HEXADR||NAME||Description||OS
|740|$02E4|RAMSIZ|RAM Size, high byte/number of pages|both

RAM size, high byte only; this is the number of pages that the top of RAM represents (one page equals 256 bytes). Since there can never be less than a whole page, it becomes practical to measure RAM in those page units. This is the same value as in [RAMTOP](#RAMTOP) location 106 ($6A), passed here from [TRAMSZ](#TRAMSZ), location 6. Space saved by moving [RAMSIZ](#RAMSIZ) or [RAMTOP](#RAMTOP) has the advantage of being above the display area. Initialized to 160 for a 48K Atari.

see also: [RAMTOP](#RAMTOP) 
### RAMTOP

||ADR||HEXADR||NAME||Description||OS
|106|$006A|RAMTOP|RAM Size|both

RAM size, defined by powerup as passed from [TRAMSZ](#TRAMSZ) (location 6), given in the total number of available pages (one page equals 256 bytes, so PEEK(106) * 256 will tell you where the Atari thinks the last usable address --byte-- of RAM is). [MEMTOP](#MEMTOP) (741,742; $2E5. $2E6) may not extend below this value. In a 48K Atari, [RAMTOP](#RAMTOP) is initialized to 160 ($A0), which points to location 40960 ($A000).

The user's highest address will be one byte less than this value.
This is initially the same value as in location 740. PEEK(740) / 4 or PEEK(106) / 4 gives the number of 1K blocks.

You can fool the computer into thinking you have less memory than you actually have, thus reserving a relatively safe area for data (for your new character set or player/missile characters, for example) or machine language subroutines by:

```
see also: [TRAMSZ], [MEMTOP]
```
### README.md
### RMARGN

||ADR||HEXADR||NAME||Description||shadow||OS
|83|$0053|RMARGN|Right margin of text|none|All


Right margin of the text screen initialized to 39 ($27). Both locations 82 and 83 are user-alterable, but ignored in all GRAPHICS modes except zero and the text window.
Margins work with the text window and blackboard mode and are reset to their default values by pressing RESET. Margins have no effect on scrolling or the printer. However, DELETE LINE and INSERT LINE keys delete or insert 40 character lines (or delete one program line), which always start at the left margin and wrap around the screen edge back to the left margin again. The right margin is ignored in the process. Also, logical lines are always three physical lines no matter how long or short you make those lines.
The beep you hear when you are coming to the end of the logical line works by screen position independent of the margins. Try setting your left margin at 25 (POKE 82,25) and typing a few lines of characters. Although you have just a few characters beyond 60, the buzzer will still sound on the third line of text.

Previous: [LMARGN](#LMARGN) 

Next: [ROWCRS](#ROWCRS) 
### ROWCRS

||ADR||HEXADR||NAME||Description||shadow||OS
|84|$0054|ROWCRS|Current cursor row|none|All

Current graphics or text screen cursor row, value ranging from zero to 191 ($BF) depending on the current GRAPHICS mode (maximum number of rows, minus one). This location, together with location 85 below, defines the cursor location for the next element to be read/written to the screen. Rows run horizontally, left to right across the TV screen. Row zero is the topmost line; row 192 is the maximum value for the bottom-most line.

Previous: [RMARGN](#RMARGN) 

Next: [COLCRS](#COLCRS) 
### ROWINC

||ADR||HEXADR||NAME||Description||shadow||OS
|121|$0079|ROWINC| |none|A

The row increment or decrement value (plus or minus one). For explanation see [COLINC](#COLINC) 
### RTCLOK

||ADR||HEXADR||NAME||DESCRIPTION||DEFAULT||SHADOW||OS
|18-20|$12-$14|RTCLOK|Interne Uhr| | |all

Die Register 18, 19 und 20 sind die "interne Uhr" des Atari.

Die Speicherzelle 20 ist ein Jiffie-Zähler, d.h. der Inhalt wird alle 1/50 Sekunde (während jedes Vertikal-Blanks) um 1 erhöht und erreicht daher alle 5,12 Sekunden den Wert 255.

Immer wenn Register 20 den Wert 255 erreicht hat und wieder bei Null beginnt (alle 5,1 Sekunden), wird der Inhalt von Register 19 um Eins erhöht. Gleiches geschieht mit Speicherzelle 18, wenn 19 den Wert 255 erreicht hat (alle 21:50,72 Minuten). Somit ergibt sich eine Dauer von 96:29:01 Stunden, bis auch Zelle 18 wieder bei 0 beginnt.

Diese Uhr wird vom Betriebssystem nicht benutzt und wird auch während zeitkritischer I/0-Operationen weiter erhöht, sie kann vom Benutzer ohne Einschränkungen verwendet werden.
### RUNAD

||ADR||HEXADR||NAME||OS
|736,737|$02E0,$02E1|RUNAD|both

Used by DOS for the run address read from the disk sector one or from a binary file. Upon completion of any binary load, control will normally be passed back to the DOS menu. However, DOS can be forced to pass control to any specific address by storing that address here. If RUNAD is set to 40960 ($A000), then the left cartridge (BASIC if inserted) will be called when the program is booted.

With DOS 1.0, if you POKE the address of your binary load file here, the file will be automatically run upon using the DOS Binary Load (selection L).

Using DOS 1.0's append (/A) option when saving a binary file to disk, you can cause the load address POKEd here to be saved with the data.

In DOS 2.0, you may specify the initialization and the run address with the program name when you save it to disk (i.e., GAME.OBJ,2000,4FFF,4F00,4000). DOS 2.0 uses the /A option to merge files. In order to prevent your binary files from running automatically upon loading in DOS 2.0, use the /N appendage to
the file name when loading the file.

see also:
[INITAD](#INITAD) 
### SAVMSC

||ADR||HEXADR||NAME||Description||shadow||OS
|88,89|$0058,$0059|SAVMSC| | |All

The lowest address of the screen memory, corresponding to the upper left corner of the screen (where the value at this address will be displayed). The upper left corner of the text window is stored at locations [TXTMSC](#TXTMSC) 660, 661 ($294, $295).
### SDLSTL

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS||SHADOW OF
|read/write |560,561 |$230,$231|SDLSTL, SDLSTH|Start Address of the Display List|both|[DLISTL](#DLISTL), [DLISTH](#DLISTL) 

Attention: the display list must not cross a 1K-boundary unless you use a JMP instruction to cross the boundary (see [Display List Instruction table](#display_list_instruction_table))

---

see also: [Display List Topics](#Displaylist_topics), [DLISTL](#DLISTL), [DLISTH](#DLISTL) 
### SDMCTL

%%tabbedSection
%%tab-english

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS||SHADOW||DEFAULT
|read/write|559|$022F |SDMCTL|Direct Memory Access (DMA) Control|all|[DMACTL](#DMACTL)|34/$22

This memory location is the shadow register of [DMACTL](#DMACTL) (54272; $D400). It is used to control the [ANTIC](#ANTIC)'s direct memory access ("DMA") to the memory of the Atari. The 6502 processor is halted during direct memory access. By switching the ANTIC's DMA off programs can be accelerated (approx. 30%). The following list shows how the individual bits of this register control the appearance of the screen:

||Bit||Dec||Hex||Function||Default
|7   |    128 |    $80 |    not used|0
|6    |   64 |     $40  |   not used|0
|5	|32|	$20|	Direct Memory Access on=1/off=0|1
|4|	16|	$10|	One-line P/M-vertical resolution on=1/off=0|0
|3|	8|	$8|	DMA for Players on=1/off=0|0
|2|	4|	$4|	DMA for Missiles on=1/off=0|0
|0,1|	3|	$3|	Wide playfield (48 bytes/chars)|
|0,1|	2|	$2|	Normal playfield (40 bytes/chars)|10
|0,1|	1|	$1|	Narrow playfield (32 bytes/chars)|
|0,1|	0|	$0|	Playfield off|

Bit #5 can therefore be used to control the entire direct memory access of the ANTIC. Bit #4 is used to switch between single-line P/M resolution and two-line resolution. The specification of the character width for the display playfield refers to the graphic mode 0. The numbers of characters correspond to 192, 160 or 128 color cycles. In total, the ANTIC can display 238 color cycles (including the border), but only about 174 of these are visible, depending on the TV/monitor. Therefore, not all 48 characters are completely visible when a wide display field is switched on (or the image extends beyond the edge of the monitor).

To switch on the Display List Interrupt see [NMIEN](#NMIEN).
---
/%
%%tab-deutsch

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS||SHADOW||DEFAULT
|read/write|559|$022F |SDMCTL|Direct Memory Access (DMA) Control|all|[DMACTL](#DMACTL)|34/$22


Diese Speicherzelle ist das Schattenregister zu [DMACTL](#DMACTL) (54272; $D400). Sie dient der Kontrolle des direkten Speicherzugriffs ("Direct Memory Access", [DMA](#DMA)) des ANTIC auf den Speicher des Atari. Der 6502-Prozessor wird während des direkten Speicherzugriffs abgeschaltet. Durch die Abschaltung des DMA des [ANTIC](#ANTIC) können Programme beschleunigt (ca. 30%) werden. Anhand folgender Aufstellung sieht man, wie die einzelnen Bits dieses Registers das Aussehen des Bildschirms kontrollieren:

||Bit||Dec||Hex||Function||Default
|7   |    128 |    $80 |    not used|0
|6    |   64 |     $40  |   not used|0
|5	|32|	$20|	Direct Memory Access on=1/off=0/aus|1
|4|	16|	$10|	Einzeilige P/M-Auflösung on=1/off=0|0
|3|	8|	$8|	DMA für Player on=1/off=0|0
|2|	4|	$4|	DMA für Missiles on=1/off=0|0
|0,1|	3|	$3|	Breites Anzeigefeld (48 Zeichen)|
|0,1|	2|	$2|	Normales Anzeigefeld (40 Zeichen)|10
|0,1|	1|	$1|	Schmales Anzeigefeld (32 Zeichen)|
|0,1|	0|	$0|	Kein Anzeigefeld|

Mit Bit fünf kann man also den gesamten direkten Speicherzugriff des ANTIC kontrollieren. Das Bit vier dient dem Umschalten zwischen einzeiliger P/M-Auflösung und zweizeiliger Auflösung. Die Angabe der Zeichenbreite für das Anzeigefeld bezieht sich auf die Grafikstufe Null. Die Anzahlen der Zeichen entsprechen 192, 160 oder 128 Farbpunkten. Insgesamt kann der ANTIC 238 Farbpunkte (einschließlich des Randes) darstellen, davon sind jedoch je nach Fernseher/Monitor nur ca. 174 sichtbar. Es sind deshalb beim Einschalten eines breiten Anzeigefeldes nicht alle 48 Zeichen vollständig sichtbar (bzw. das Bild geht über den Rand des Monitors hinaus).

Zum Einschalten des Display List Interrupts siehe [NMIEN](#NMIEN).
---
/%


see also: [Player Missile Topics](#Pm_topics), [Display List Topics](#Displaylist_topics) 

previous: [CDTMF5](#CDTMF5) 

next: [SDLSTL](#SDLSTL),[SDLSTH](#SDLSTL) 
### SEROUT

||Read/Write||ADR||HEXADR||NAME||Description||OS
|Read|53773|$D20D|SERIN|Serial Port Data Output|all
|Write|53773|$D20D|SEROUT|Serial Port Data Input|all


# Write
Serial port data output. Usually written to in the event of a serial data out interrupt. Writes to the eight (one byte) parallel holding register that is transferred to the serial shift register when a full byte of data has been transmitted. This "holding" register is used to contain the bits to be transmitted one at a time (serially) as a one-byte unit before transmission.

# Read
Serial port input. Reads the one-byte parallel holding register that is loaded when a full byte of serial input data has been received. As above, this holding register is used to hold the bits as they are received one bit at a time until a full byte is received. This byte is then taken by the computer for processing. Also used to verify the checksum value at location 49 ($31).
The serial bus is the port on the Atari into which you plug your cassette or disk cable. For the pin values of this port, see the OS User's Manual, p. 133, and the Hardware Manual.

---
See also:

previous: [POTGO](#POTGO) 

next: [IRQEN](#IRQEN),[IRQST](#IRQEN) 
### SETVBV

||ADR||HEXADR||NAME||Description||OS
|58460|$E45C|SETVBV|Set system timers and interrupt vectors|both

Sets an interrupt vector or system timer vector.

## Usage:

Assembler
```
LDX MSB
LDY LSB
LDA (value see table below)
JSR $E45C
```
Action!
```
PROC SETVBV=*$E45C(BYTE VECTOR,MSB,LSB)
RETURN
```


||Register||Value
|X|MSB
|Y|LSB
|A|vector to be changed, see below

||Value||Vector
|0|[VIMIRQ](#VIMIRQ) 
|1|[TIMCOUNT1](#TIMCOUNT1) 
|2|[TIMCOUNT2](#TIMCOUNT2) 
|3|[TIMCOUNT3](#TIMCOUNT3) 
|4|[TIMCOUNT4](#TIMCOUNT4) 
|5|[TIMCOUNT5](#TIMCOUNT5) 
|6|[VVBLKI](#VVBLKI) 
|7|[VVBLKD](#VVBLKD) 


---
see also: [VBI_Vertical_Blank_Interrupt](#VBI_Vertical_Blank_Interrupt) 
### SHFLOK

||Adr||Hex||Name||Description||OS||default
|702|$02BE|SHFLOK|Keyboard lock state|all|$40/64

Register contains information about "lock" status of the keyboard, eg. SHIFT-lock or CTRL-lock

||Value hex||Value dec||Explanation
|$00|0|small letters
|$40|64|Caps Lock capital letters
|$80|128|CTRL lock graphic characters

Siehe auch: [CH](#CH) [Keyboard topics](#Keyboard_topics) 
### SIO_topics

# SIO Topics

to be completed…


---
see also: [topic_list](#topic_list) 
### SIZEM

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53260 |$D00C|SIZEM|Size of Missiles 0-3|both
|Read| 53260 |$D00C|P0PL|Collision Player 0 with Player x|both

### Write: Width of Missiles 0-3
||Bit ||7,6||5,4||3,2||1,0
|Missile | M3| M2| M1| M0

||Size ||Bit combination||example
|normal | 0, 0 | *
|double | 0, 1 | **
|normal | 1, 0 | *
|quadruple | 1, 1 | ****

### Read: Collision Player 0 with Player x

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Player x=| | | |  |3| 2| 1| 0
---
see also:[Player Missile Topics](#Pm_topics) 

previous: [SIZEP3](#SIZEP3), [M3PL](#SIZEP3) 

next: [GRAFP0](#GRAFP0), [P1PL](#GRAFP0) 
### SIZEP0

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53256 |$D008|SIZEP0|Size Player 0|both
|Read| 53256 |$D008|M0PL|Collision Missile 0 with Player|both

### Write: Width Player 0
||decimal||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|0|normal| | | | | | | 0| 0
|1|double| | | | | | | 0| 1
|2|normal| | | | | | | 1| 0
|3|quadruple| | | | | | | 1| 1

### Read: Collision Missile 0 with Player x

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Player x=| | | |  |3| 2| 1| 0
---
see also:[Player Missile Topics](#Pm_topics) 

previous: [HPOSM3](#HPOSM3), [P3PF](#HPOSM3) 

next: [SIZEP1](#SIZEP1), [M1PL](#SIZEP1) 
### SIZEP1

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53257 |$D009|SIZEP1|Size Player 1|both
|Read| 53257 |$D009|M1PL|Collision Missile 1 with Player|both

### Write: Width Player 1
||decimal||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|0|normal| | | | | | | 0| 0
|1|double| | | | | | | 0| 1
|2|normal| | | | | | | 1| 0
|3|quadruple| | | | | | | 1| 1

### Read: Collision Missile 1 with Player x

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Player x=| | | |  |3| 2| 1| 0
---
see also:[Player Missile Topics](#Pm_topics) 

previous: [SIZEP0](#SIZEP0), [M0PL](#SIZEP0) 

next: [SIZEP2](#SIZEP2), [M2PL](#SIZEP2) 
### SIZEP2

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53258 |$D00A|SIZEP2|Size Player 2|both
|Read| 53258 |$D00A|M2PL|Collision Missile 2 with Player|both

### Write: Width Player 2
||decimal||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|0|normal| | | | | | | 0| 0
|1|double| | | | | | | 0| 1
|2|normal| | | | | | | 1| 0
|3|quadruple| | | | | | | 1| 1

### Read: Collision Missile 2 with Player x

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Player x=| | | |  |3| 2| 1| 0
---
see also:[Player Missile Topics](#Pm_topics) 

previous: [SIZEP1](#SIZEP1), [M1PL](#SIZEP1) 

next: [SIZEP3](#SIZEP3), [M2PL](#SIZEP3) 
### SIZEP3

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|Write| 53259 |$D00B|SIZEP3|Size Player 3|both
|Read| 53259 |$D00B|M3PL|Collision Missile 3 with Player|both

### Write: Width Player 3
||decimal||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|0|normal| | | | | | | 0| 0
|1|double| | | | | | | 0| 1
|2|normal| | | | | | | 1| 0
|3|quadruple| | | | | | | 1| 1

### Read: Collision Missile 3 with Player x

||Bit ||7|| 6|| 5|| 4|| 3|| 2|| 1 ||0
|Player x=| | | |  |3| 2| 1| 0
---
see also:[Player Missile Topics](#Pm_topics) 

previous: [SIZEP2](#SIZEP2), [M2PL](#SIZEP2) 

next: [SIZEM](#SIZEM), [P0PL](#SIZEM) 
### SKCTL

||r/w||ADR||HEXADR||NAME||Description||Shadow||OS
|write|53775|$D20F|SKCTL|Serial Port Control|[SSKCTL](#SSKCTL)|all
|read|53775|$D20F|SKSTAT|Serial Port Status|[SSKCTL](#SSKCTL)|all

## Write
||Bit||Function
|0|Enable keyboard debounce circuits.
|1|Enable keyboard scanning circuit.
|2|Fast pot scan: the pot scan counter completes its sequence in two TV line times instead of one frame time (228 scan lines). Not as accurate as the normal pot scan, however.
|3|Serial output is transmitted as a two-tone signal rather than a logic true/false. POKEY two-tone mode.
|4,5,6|Serial port mode control used to set the bi-directional clock lines so that you can either receive external clock data or provide clock data to external devices (see the Hardware Manual, p. II.27). There are two pins on the serial port for Clock IN and Clock OUT data. See the OS User's Manual, p. 133.
|7|Force break (serial output to zero)

## Read
||Bit||Function
|0|not used by SKSTAT
|1|Serial input shift register busy
|2|the last key is still pressed
|3|the SHIFT key is pressed
|4|Data can be read directly from the serial input port, ignoring the shift register.
|5|Keyboard over-run. Reset BITs 7 to 5 (latches) to one writing any number to [SKREST](#SKREST) at 53770 ($D20A).
|6|Serial data input over-run. Reset latches as above.
|7|Serial data input frame error caused by missing or extra bits. Reset latches as above.



---
see also: [Keyboard topics](#Keyboard_topics) 

previous: [IRQEN](#IRQEN),[IRQST](#IRQEN) 

next: [PORTA](#PORTA) of PIA
### SKREST

||Read/Write||ADR||HEXADR||NAME||Description||OS
|Read|53770|$D20A|RANDOM|random number generator|all
|Write|53770|$D20A|SKREST|serial status register reset|all

# SKREST (Write)
Resets the bits 5,6,7 of the serial port status register 53775 [SKCTL](#SKCTL) to "1"

# RANDOM (Read)
Read the high order 8 bits of the 17-bit polynominal counter and returns a pseudo random number from 0-255

---
see also: [SKCTL](#SKCTL), [Sound_Topics](#Sound_Topics) 

previous: [STIMER](#KBCODE),[KBCODE](#KBCODE) 

next: [POTGO](#POTGO) 
### Sound_Topics

# Sound Topics

[AUDF1](#AUDF1) [AUDC1](#AUDC1) 

[AUDF2](#AUDF2) [AUDC2](#AUDC2) 

[AUDF3](#AUDF3) [AUDC3](#AUDC3) 

[AUDF4](#AUDF4) [AUDC4](#AUDC4) 

[AUDCTL](#AUDCTL) 

[STIMER](#KBCODE) 

[CONSOL](#CONSOL) 

[NOCLIK](#NOCLIK) 


---
see also: [topic_list](#topic_list) 
### SSFLAG

767    $02FF    SSFLAG


```
Value
$00    0      screen output not stopped
$FF    255    screen output stopped
```

Set to zero by RESET and powerup.
### SSKCTL

||Adr||HexAdr||Name||Description||Shadow||OS
|562|$0232|SSKCTL| |[SKCTL](#SKCTL)|both

### Standard_colors

# Standard color values
||SETCOLOR||Color||Luminance||Color name||Address||Name||Address||Name||Default Value dec||Default Value hex||in GR.0||in GR.1/2||GR.3,5,7
|0,2,8|	2|	8|	Orange|	708|	[COLOR0](#COLOR0)|	53270|	[COLPF0](#COLPF0)|40|$28|n.a.|Uppercase|COLOR 1
|1,12,10|12|	10|	Green|	709|	[COLOR1](#COLOR1)|	53271|	[COLPF1](#COLPF1)|202|$CA|Text (only Luminance)|Lowercase|COLOR 2 and Textwindow LUM
|2,9,4|	9|	4|	Blue|	710|	[COLOR2](#COLOR2)|	53272|	[COLPF2](#COLPF2)|148|$94|Screen|Inverse|COLOR 3 and Textwindow Background
|3,4,6|	4|	6|	Pink|    711|	[COLOR3](#COLOR3)|	53273|	[COLPF3](#COLPF3)|70|$46|n.a.|Inverse Lowercase|n.a.
|4,0,0|	0|	0|	Black|712|	[COLOR4](#COLOR4)|	53274|	[COLBK](#COLBK)|0|$00|Border|n/a|Background and Border (COLOR 0)


![](#attachments/STD-COLORS.png)



see also: [Color topics](#Color_topics) 
### STICK0

||ADR||HEXADR||NAME||Description||shadow of||OS
|632| $0278|STICK0|Joystick 1| [PORTA](#PORTA) |all

This denotes the direction of Joystick 1, where 15 means "centered". It is the lower nibble of [PORTA](#PORTA) 54016 $d300.
This address is only updated every 1/50 second during VBlank!

||dec ||left|| ||right
|up|10|14|&nbsp;6
| |11|15| &nbsp;7
|down|&nbsp;9|13|&nbsp;5

||hex ||left|| ||right
|up|$0A|$0E|$06
| |$0B|$0F|$07
|down|$09|$0D|$05

||bin ||left|| ||right
|up|1010|1110|0110
| |1011|1111|0111
|down|1001|1101|0101

---
see also [Controller topics](#Controller_topics) 

previous: [PADDL7](#PADDL7) 

next: [Joystick 2](#STICK1) 
### STICK1

||ADR||HEXADR||NAME||Description||shadow of||OS
|633| $0279|STICK1|Joystick 2| [PORTA](#PORTA) |all

This denotes the direction of Joystick 2, where 15 means "centered". It is the higher nibble of [PORTA](#PORTA) 54016 $d300.
This address is only updated every 1/50 second during VBlank!

||dec ||left|| ||right
|up|10|14|&nbsp;6
| |11|15| &nbsp;7
|down|&nbsp;9|13|&nbsp;5

||hex ||left|| ||right
|up|$0A|$0E|$06
| |$0B|$0F|$07
|down|$09|$0D|$05

||bin ||left|| ||right
|up|1010|1110|0110
| |1011|1111|0111
|down|1001|1101|0101

---
see also [Controller topics](#Controller_topics) 

previous: [Joystick 1](#STICK0) 

next: [Joystick 3](#STICK2) 
### STICK2

||ADR||HEXADR||NAME||Description||shadow of||OS
|634| $027A|STICK2|Joystick 3| [PORTB](#PORTB) |A

This denotes the direction of Joystick 3, where 15 means "centered". It is the lower nibble of [PORTB](#PORTB) 54017 $d301.
Joystick 3 is only available on ATARI 400/800 machines. In XL and XE OS's this register has the same content as [STICK0](#STICK0).

||dec ||left|| ||right
|up|10|14|&nbsp;6
| |11|15| &nbsp;7
|down|&nbsp;9|13|&nbsp;5

||hex ||left|| ||right
|up|$0A|$0E|$06
| |$0B|$0F|$07
|down|$09|$0D|$05

||bin ||left|| ||right
|up|1010|1110|0110
| |1011|1111|0111
|down|1001|1101|0101

---
see also [Controller topics](#Controller_topics) 

previous: [Joystick 2](#STICK1) 

next: [Joystick 4](#STICK3) 
### STICK3

||ADR||HEXADR||NAME||Description||shadow of||OS
|635| $027B|STICK3|Joystick 4| [PORTB](#PORTB) |A

This denotes the direction of Joystick 4, where 15 means "centered". It is the higher nibble of [PORTB](#PORTB) 54017 $d301.
Joystick 4 is only available on ATARI 400/800 machines. In XL and XE OS's this register has the same content as [STICK1](#STICK1).

||dec ||left|| ||right
|up|10|14|&nbsp;6
| |11|15| &nbsp;7
|down|&nbsp;9|13|&nbsp;5

||hex ||left|| ||right
|up|$0A|$0E|$06
| |$0B|$0F|$07
|down|$09|$0D|$05

||bin ||left|| ||right
|up|1010|1110|0110
| |1011|1111|0111
|down|1001|1101|0101

---
see also [Controller topics](#Controller_topics) 

previous: [Joystick 3](#STICK2) 
### STRIG0

||ADR||HEXADR||NAME||Description||shadow of||OS
|644| $0284|STRIG0|Stick 1 Trigger| [TRIG0](#GRAFP3) |all
0 when trigger pressed

1 when trigger released

This address is only updated every 1/50 second during VBlank!

---
see also: [Controller topics](#Controller_topics), [Latch triggers](#GRACTL) 

previous: [PTRIG7](#PTRIG7) 

next: [STRIG1](#STRIG1) 
### STRIG1

||ADR||HEXADR||NAME||Description||shadow of||OS
|645| $0285|STRIG1|Stick 2 Trigger| [TRIG1](#GRAFM) |all

0 when trigger pressed

1 when trigger released

This address is only updated every 1/50 second during VBlank!

---
see also: [Controller topics](#Controller_topics), [Latch triggers](#GRACTL) 

previous: [STRIG0](#STRIG0) 

next: [STRIG2](#STRIG2) 
### STRIG2

||ADR||HEXADR||NAME||Description||shadow of||OS
|646| $0286|STRIG2|Stick 3 Trigger| [TRIG2](#COLPM0) |OS A and B
only on 400 and 800 machines, else a copy of [STRIG0](#STRIG0). This address is only updated every 1/50 second during VBlank!

0 when trigger pressed

1 when trigger released

---
see also: [Controller topics](#Controller_topics), [Latch triggers](#GRACTL) 

previous: [STRIG1](#STRIG1) 

next: [STRIG3](#STRIG3) 
### STRIG3

||ADR||HEXADR||NAME||Description||shadow of||OS
|647| $0287|STRIG3|Stick 4 Trigger| [TRIG3](#TRIG3) |OS A and B
only on 400 and 800 machines, else a copy of [STRIG1](#STRIG1). This address is only updated every 1/50 second during VBlank!

0 when trigger pressed

1 when trigger released

---
see also: [Controller topics](#Controller_topics), [Latch triggers](#GRACTL) 

previous: [STRIG2](#STRIG2) 

next: [CSTAT](#CSTAT) 
### SYSVBL

||ADR||HEXADR||NAME||Description||OS
|59345|$E7D1|SYSVBL| |see below

The VBLANK routines start here, including frame counter, update timer, update hardware registers from shadow registers, update the attract mode counter and the realtime clock.

The vertical blank immediate vector, [VVBLKI](#VVBLKI), normally pointed to by locations 546,547/$0222,$0223), points to here.

The Updated OS ROMs point to 59310/$E7AE.

see also: [VBI_Vertical_Blank_Interrupt](#VBI_Vertical_Blank_Interrupt) 
### SYSVBV

||ADR||HEXADR||NAME||Description||OS
|58463|$E45F|SYSVBV| |both

Stage one VBLANK calculations entry. It performs the processing of a VBLANK interrupt. Contains JMP instruction for the vector in the next two addresses (58464, 58465; $E460, $E461). This is the address normally found in VVBLKI (546, 547; $222, $223). It is initialized to 59345 ($E7D1), which is the VBLANK routine entry. Initialized to 59345 ($E7D1) old ROMs, 59310 ($E7AE) new ROMs.

see also: [VDSLST](#VDSLST), [VVBLKI](#VVBLKI), [VVBLKD](#VVBLKD), [Interrupt](#Interrupt) 
### Table_of_Modes_and_Screen_Formats

# Table of Modes and Screen Format

This is the corrected version of 'Table of Modes and Screen Format' taken from the Atari Basic Errata

|Gr.Mode|Mode Type|Hor. Columns|Vert. Rows Split Screen|Vert. Rows Full Screen|Number of Color Regs.|Split Screen 1)|RAM Required (Bytes) Full Screen 1)|RAM required ScreenMem/ScreenMen w/ Split Screen|
|-------|---------|------------|-----------------------|----------------------|---------------------|---------------|-----------------------------------|------------------------------------------------|
|0|Text|40|-|24|1,5|-|992|dec:960/- hex:$03c0/-
|1|Text|20|20|24|5|674|672|dec:480/400 hex:$01E0/$0190
|2|Text|20|10|12|5|424|420|dec:240/200 hex:$00F0/$00C8
|3|Graphics|40|20|24|4|434|432|dec:240/200 hex:$00F0/$00C8
|4|Graphics|80|40|28|2|694|696|dec:480/400 hex:$01E0/$0190
|5|Graphics|80|40|48|4|1174|1176|dec:960/800 hex:$0496/$0498
|6|Graphics|160|80|96|2|2174|2184|dec:1920/1600 hex:$0780/$0640
|7|Graphics|160|80|96|4|4190|4200|dec:3840/3200 hex:$0F00/$0C80
|8|Graphics|320|160|192|1,5|8112|8138|dec:7680/6400 hex:$1E00/$1900

Note 1) RAM required includes RAM for Display List


## Picture
![](#attachments/Table_of_Modes_and_Screen_Formats-Corrected.jpg)
'Table of Modes and Screen Formats' taken from the Atari Basic Errata

---
see [Color Topics](#Color_topics), [topic_list](#topic_list), [Display List Instruction Table](#Display_list_instruction_table) 
### TEMP

||ADR||HEXADR||NAME||Description||shadow||OS
|80|$0050|TEMP| |none|all
Temporary register used by the display handler in moving data to and from screen. Also called TMPCHR.
### TINDEX

||DEC||HEX||NAME||OS
|659|$293|TINDEX|all

Contains the current split-screen text window GRAPHICS mode. It is the split-screen equivalent to [DINDEX](#DINDEX) (location 87; $57) and is always equal to zero when location [SWPFLG](#SWPFLG) 123 ($7B) equals zero. Initialized to zero (which represents GR.0). You can alter the display list to change the text window into any GRAPHICS mode desired. If you do so, remember to change [TINDEX](#TINDEX) to reflect that alteration.

see also:

previous: [TXTCOL](#TXTCOL) 

next: [TXTMSC](#TXTMSC) 
### Topic_list

# Topics

[4 color text](#4_color_character) 

[Character_Sets](#Character_Sets) 

[Color](#Color_topics) 

[Connectors](#Connectors) 

[Controllers](#controller_topics) 

[Display List Topics](#displaylist_topics) 

[DOS](#DOS_topics) 

[Interrupts](#Interrupts) 

[Keyboard](#keyboard_topics) 

[Memory_Map](#Memory_Map) 

[Player Missile Graphics](#pm_topics) 

[SIO Serial Input Output](#SIO_topics) 

[Sound_Topics](#Sound_Topics) 

---
see also: [Memory_Map](#Memory_Map) 
### TOPSTK

||ADR||HEXADR||NAME||Description||shadow||OS
|144,145|$0090,$0091|MEMTOP/TOPSTK| | |all

*Das Register zeigt auf das Ende des Runtime-Stack (daher TOPSTK). Der Runtime-Stack ist der hinterste Bereich, den ein BASIC-Programm im RAM nutzt und damit ist auch ein
*Zeiger auf das Ende des BASIC-PRogrammes. Der Platz zwischen MEMTOP und dem Bildspeicher wird durch die FRE(0)-Funktion angegeben.

Grundsätzlich ist der Speicher oberhalb von MEMTOP/TOPSTK bis zur Display-List verfügbar. Da der Runtime-Stack sich jedoch während der Programmausführung verändern kann, ist Vorsicht geboten.

---

Hilfsprgramm für das Reservieren von Speicherplatz:
%%prettify
```
10 ANZPAGE = 1 : REM ANZAHL DER ZU RESERVIERENDEN SEITEN
20 SIZE = (PEEK(106) - ANZPAGE) * 256
30 IF SIZE <= PEEK(144) + PEEK(145) * 256 THEN PRINT "PROGRAMM ZU GROSS!"
40 END 
```
/%

---
Siehe auch:
*[MEMTOP](#MEMTOP) - OS MEMTOP
*[RUNSTK](#RUNSTK) - Runtime-Stack-Pointer
*[SDLSTL](#SDLSTL) - Display-List-Adresse
### TRAMSZ

||ADR||HEXADR||NAME||Description||OS
|6|$0006|TRAMSZ|Temporary Register for RAM size|both


Temporary Register for RAM size; used during powerup sequence to test RAM availability. This value is then moved to [RAMTOP](#RAMTOP), location 106 ($6A). Reads one when the BASIC or the A (left) cartridge is plugged in.

see also: [RAMTOP](#RAMTOP), [MEMTOP](#MEMTOP) 
### TRNSMZ

||ADR||HEXADR||NAME||Description||OS
|6|$0006|TRNSMZ| |XL

Zwischenregister für den Speichergrößentest beim Kaltstart.
### TSTDAT

||ADR||HEXADR||NAME||Description||OS
|7|$0007|TSTDAT| |XL

Datenregister für den RAM-Test
### TXTCOL

||DEC||HEX||NAME||OS
|657,658|$291,$292|TXTCOL|all

Text window cursor column; value ranges from zero to 39. Unless changed by the user, location 658 will always be zero (there are only 40 columns in the display, so the MSB will be zero). Since POSITION, PLOT, LOCATE and similar commands refer to the graphics cursor in the display area above the text window, you must use POKE statements to write to this area if PRINT statements are insufficient.

see also:

previous: [TXTROW](#TXTROW) 

next: [TINDEX](#TINDEX) 
### TXTMSC

||DEC||HEX||NAME||OS
|660,661|$294,$295|TXTMSC|both

Address of the upper left corner of the text window. Split-screen equivalent of locations [SAVMSC](#SAVMSC) 88, 89 ($58, $59)

see also:

previous: [TINDEX](#TINDEX) 

next: [TXTOLD](#TXTOLD) 
### TXTOLD

||DEC||HEX||NAME||OS
|662-667|$296-$29B|TXTOLD|both

These locations contain the split-screen equivalents of [OLDROW](#OLDROW) (90; $5A), [OLDCOL](#OLDCOL) (91, 92; $5B, $5C), [OLDCHR](#OLDCHR) (93, $5D) and [OLDADR](#OLDADR) (94, 95; $5E, $5F). They hold the split-screen cursor data.

see also:

previous: [TXTMSC](#TXTMSC) 

next: [TMPX1](#TMPX1) 
### TXTROW

||DEC||HEX||NAME||OS
|656|$290|TXTROW|all

Text window cursor row; value ranges from zero to three (the text window has only four lines). TXTROW specifies where the next read or write in the text window will occur

see also:

previous: [NEWADR](#NEWADR) [BLIM](#BLIM) 

next: [TXTCOL](#TXTCOL) 
### VBI_Vertical_Blank_Interrupt

[NMIEN](#NMIEN) enable/disable non maskable interrupts (NMI's)

[SETVBV](#SETVBV) sets an interrupt vector or system timer vector

[XITVBV](#XITVBV) exit the vertical blank interrupt routine

[SYSVBV](#SYSVBV) vertical blank interrupt routine entry point

[VVBLKI](#VVBLKI) vector to the immediate vertical blank interrupt routine

[VVBLKD](#VVBLKD) vector to the deferred vertical blank interrupt routine

[SYSVBL](#SYSVBL) the vertical blank interrupt routine


---
see [Interrupts](#Interrupts), [Topic_list](#Topic_list) 
### VCOUNT

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|read only|54283|$D40B|VCOUNT| current scanline/2|both

Dieses Register enthält die aktuelle Scanline (Bildschirmzeile) geteilt durch 2.
Werte zwischen 0 und 195 ($9B) für PAL oder 0 und 130 ($82) für NTSC.

---
see also: [Display List Topics](#Displaylist_topics), [PENH](#PENH), [PENV](#PENV) 

previous: [WSYNC](#WSYNC) 

next: [PENH](#PENH) 
### VDELAY

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|write |53276 |$D01C|VDELAY|Vertical Delay for PM|both

Vertical Delay register. When using double line resolution for players and missiles you can normally only use every second line. Setting bit in this register moves the object down one scan line on the screen.

||Bit||Object
|7|Player 3
|6|Player 2
|5|Player 1
|4|Player 0
|3|Missile 3
|2|Missile 2
|1|Missile 1
|0|Missile 0


For switching between single and double line resolution see Bit 5 of [SDMCTL](#SDMCTL) 

---
see also: [Player Missile Topics](#Pm_topics), [SDMCTL](#SDMCTL) 

previous: [PRIOR](#PRIOR) 

next: [GRACTL](#GRACTL) 
### VDSLST

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS||DEFAULT VALUE
|read/write |512,513|$0200,$0201|VDSLST|Vector to Display List Interrupt routine|both|59315/$E7B3 (a RTI instruction)

Attention:
- All 6502 registers have to be saved before and restored after the interrupt (before the RTI instruction).
- an example to save registers and variables in the language "Action!" [Interrupts_in_ACTION](#Interrupts_in_ACTION)
- The interrupt routine must end with an RTI (return from interrupt).

## Example for saving and restoring the processor registers

```
     ;we need to push to stack, first A, then X, then Y
 PHA ;push ACCU to Stack
 TXA ;transfer X to ACCU
 PHA ;push ACCU (now X) to Stack
 TYA ;transfer Y to ACCU
 PHA ;push ACCU (now Y) to Stack
     ;
     ;... routine goes in here ...
     ;
     ;now we need to pull from stack first Y, then X, then A
 PLA ;pull Y from STACK to ACCU
 TAY ;transfer ACCU to Y
 PLA ;pull X from STACK to ACCU
 TAX ;transfer ACCU to X
 PLA ;pull ACCU from STACK
 RTI ;end interrupt routine with ReTurn from Interrupt
```

## Example for setting your interrupt routine
- Set bit 7 in the [display list](#display_list_instruction_table) line you want the interrupt to occur
- clear bit 7 of [NMIEN](#NMIEN) to disable the interrupt
- set [VDSLST](#VDSLST) to your routine
- set bit 7 of [NMIEN](#NMIEN) to enable the interrupt


---

see also: [Display List Topics](#Displaylist_topics), [NMIEN](#NMIEN), [Display List Instruction table](#display_list_instruction_table) 
### VSCROL

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|write only|54277|$D405|VSCROL|Vertical Fine Scrolling|both

If this location is set to a value other than zero, the ANTIC starts displaying every line with bit 5 set (enable vertical scrolling) that number of scan line "later", the picture is shifted "up".

This register should not be altered while ANTIC is drawing the screen. It has to be changed during vertical blank interrupt to get good results.

```
VSCROL=0  VSCROL=2 
........  ..####..
...##...  .##..##.
..####..  .######.
.##..##.  .##..##.
.######.  .##..##.
.##..##.  ........
.##..##.  ........
........  .##..##.

........  .##..##.
.##..##.  .######.
.##..##.  .##..##.
.######.  .##..##.
.##..##.  .##..##.
.##..##.  ........
.##..##.  ........
........  ........
```

If there are several consecutive lines set for vertical fine scrolling (display list instruction with bit 5 set to "1"), the last line to be scrolled has to have bit 5 set to 0, to inhibit lines "jumping" into the screen.


---
see also: [Display List topics](#Displaylist_topics) 

previous: [HSCROL](#HSCROL) 

next: [PMBASE](#PMBASE) 
### VVBLKD

||ADR||HEXADR||NAME||Description||OS
|548,549|$0224,$0225|VVBLKD|Vertical Blank Deferred Register|both

VBLANK deferred register; system return from interrupt, initialized to 59710 ($E93E, in the new OS "B" ROMs; 59653; $E905), the exit for the VBLANK routine. NMI.

These two VBLANK vectors point to interrupt routines that occur at the beginning of the VBLANK time interval. The stage one VBLANK routine is executed; then location [CRITIC](#CRITIC) 66/$42 is tested for the time-critical nature of the interrupt and, if a critical code section has been interrupted, the stage two VBLANK routine is not executed with a JMP made through the immediate vector [VVBLKI](#VVBLKI). If not critical, the deferred interrupt VVBLKD is used. Normally the VBLANK interrupt bits are enabled (BIT 6 at location [NMIEN](#NMIEN) 54286/$D40E is set to one). To disable them, clear BIT 6 (set to zero).

The normal seguence for VBLANK interrupt events is: after the OS test, JMP to the user immediate VBLANK interrupt routine through the vector [VVBLKI](#VVBLKI) at 546,547, then through [SYSVBV](#SYSVBV) at 58463/$E45F. This is directed by the OS through the VBLANK interrupt service routine at 59345/$E7D1 and then on to the user-deferred VBLANK interrupt routine vectored at 548,549. it then exits the VBLANK interrupt routine through [XITVBV](#XITVBV) 58466/$E462 and an RTI instruction.

If you are changing the VBLANK vectors during the interrupt routine, use the [SETVBV](#SETVBV) routine at 58460/$E45C. An immediate VBI has about 3.800 machine cycles of time to use, a deferred VBI has about 20.000 cycles. Since many of these cycles are executed while the electron beam is being drawn, it is suggested that you do not execute graphics routines in deferred VBI's.

If you create your own VBI's, terminate an immediate VBI with a JMP to [SYSVBV](#SYSVBV) 58463/$E45F and a deferred VBI with a JMP to [XITVBV](#XITVBV) 58466/$E462. To bypass the OS VBI routine [SYSVBL](#SYSVBL) at 59345/$E7D1 entirely, terminate your immediate VBI with a JMP to [XITVBV](#XITVBV) 58466/$E462.

see also: [VDSLST](#VDSLST), [VVBLKI](#VVBLKI), [SYSVBV](#SYSVBV), [Interrupt](#Interrupt) 
### VVBLKI

||ADR||HEXADR||NAME||Description||OS
|546,547|$0222,$0223|VVBLKI|Vertical Blank Immediate Register|both

VBLANK immediate register. Normally jumps to the stage one VBLANK vector NMI interrupt processor at location 59345 ($E7D1); in the new OS "B" ROMs; 59310, $E7AE). The NMI status register tests to see if the interrupt was due to a VBI (after testing for a DLI) and, if so, vectors through here to VBI the routine, which may be user-written. On powerup, VBI's are enabled and DLI's are disabled. See [VDSLST](#VDSLST) location 512/$200.


see also: [VDSLST](#VDSLST), [VVBLKD](#VVBLKD), [Interrupts](#Interrupts) 
### WARMST

||ADR||HEXADR||NAME||Description||OS
|8|$0008|WARMST| |all

Register für den Warmstart:

|__Kaltstart__| 0 / $00
|__Warmstart__| 255 / $FF
### WARMSV

Warmstart entry point (RESET button vector). Initializes the OS RAM region. The RESET key produces an NMI interrupt and a chip reset. Jump to here on an NMI caused by pressing the RESET key. Initialized to 61723 ($F11B).
### WSYNC

||R/W||ADR||HEXADR||NAME||DESCRIPTION||OS
|W|54282|$D40A|WSYNC|Stops CPU until end of scanline is reached|all

Wird eine beliebige Zahl in dieses Register geschrieben, wird die CPU (6502) solange angehalten, bis das Ende der Scanline (Bildschirmzeile) erreicht ist. Es ist sinnvoll einen Display List Interrupt in der Zeile VOR der gewünschten Zeile zu setzen, damit beim Zeilen-Strahlrücklauf der Interrupt abgearbeitet werden kann, ohne z.B. Flackern bei einer Farbumschaltung zu verursachen.

Die "Klick"-Routine der Tastatur benutzt dieses Register zur Verzögerung.

---
see also: [Interrupts](#Interrupts) 

previous: [CHBASE](#CHBASE) 

next: [VCOUNT](#VCOUNT) 
### XITVBV

||ADR||HEXADR||NAME||Description||OS
|58466|$E462|XITVBV|Exit from the VBLANK routine|both

Exit from the VBLANK routine, entry point. Contains JMP to the address stored in next two locations (58467, 58468; $E463, $E464). This is the address normally found in [VVBLKD](#VVBLKD) (548,549; $0224,$0225).

### OS A/B
Initialized to 59710/$E93E, which is the VBLANK exit routine. It is used to restore the computer to its pre-interrupt state and to resume normal processing.

### XL/XE OS
Initialized to 59710/$E93E old ROMs, 59653/$E905.

see also: [SETVBV](#SETVBV), [VVBLKI](#VVBLKI), [VVBLKD](#VVBLKD), [SYSVBV](#SYSVBV), [Interrupts](#Interrupts) 
### ZCHAIN

||ADR||HEXADR||NAME||Description||shadow||OS
|74,75|$004a,$004B|ZCHAIN| |none|X

Temporary storage registers for general-purpose peripheral handler loader.

### Atari 1200XL Function Keys

On the ATARI 1200XL there are 4 function keys named F1 to F4

|Function Key|produces|
|------------|--------|
|F1| Cursor up
|F2| Cursor down
|F3| Cursor left
|F4| Cursor right
|Shift F1| Cursor Home
|Shift F2| Cursor End
|Shift F3| Cursor to beginning of line
|Shift F4| Cursor to end of line
|CTRL F1| toggles Keyboard enable/disable
|CTRL F2| toggles DMA enable/disable
|CTRL F3| toggles Key-Click
|CTRL F4| toggles Standard/International character set
|Shift CTRL F1| ignored
|Shift CTRL F2| ignored
|Shift CTRL F3| ignored
|Shift CTRL F4| ignored

---
see also: [Keyboard_topics](#Keyboard_topics) 

