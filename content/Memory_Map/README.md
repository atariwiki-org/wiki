# Memory Map
  
[Differences Atari 400/800 - 1200XL - 600/800XL](DiffOldOs2XL/README.md)  
  
### Page 0
  
|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|0,1|$0000,$0001|[LINZBS](LINZBS/README.md)| |A|  
|0|$0000|[LINFLG](LINFLG/README.md)| |X  
|1|$0001|[NGFLAG](NGFLAG/README.md)| |X  
|2,3|$0002,$0003|[CASINI](CASINI/README.md)| |  
|4,5|$0004,$0005|[RAMLO](RAMLO/README.md)| |  
|6|$0006|[TRAMSZ](TRAMSZ/README.md)| |A  
|6|$0006|[TRNSMZ](TRNSMZ/README.md)| |X  
|7|$0007|[TSTDAT](TSTDAT/README.md)| |A  
|7|$0007|[TSTDAT](TSTDAT/README.md)| |X  
|8|$0008|[WARMST](WARMST/README.md)| |  
|9|$0009|[BOOT?](BOOT?/README.md)| |  
|10,11|$000A,$000B|[DOSVEC](DOSVEC/README.md)| |  
|12,13|$000C,$000D|[DOSINI](DOSINI/README.md)| |  
|14,15|$000E,$000F|[APPMHI](APPMHI/README.md)| |  
|16|$0010|[POKMSK](POKMSK/README.md)| |  
|17|$0011|[BRKKEY](BRKKEY/README.md)| |  
|18-20|$0012-$0014|[RTCLOK](RTCLOK/README.md)| |  
|21,22|$0015,$0016|[BUFADR](BUFADR/README.md)| |  
|23|$0017|[ICCOMT](ICCOMT/README.md)| |  
|24,25|$0018,$0019|[DSKFMS](DSKFMS/README.md)| |  
|26,27|$001A,$001B|[DSKUTL](DSKUTL/README.md)| |  
|28|$001C|[PTIMOT](PTIMOT/README.md)| |A  
|29|$001D|[PBPNT](PBPNT/README.md)| |A  
|30|$001E|[PBUFSZ](PBUFSZ/README.md)| |A  
|31|$001F|[PTEMP](PTEMP/README.md)| |A  
|28-31|$001C-$001F|[ABUFPT](ABUFPT/README.md)| |X  
|32|$0020|[ICHIDZ](ICHIDZ/README.md)| |  
|33|$0021|[ICDNOZ](ICDNOZ/README.md)| |  
|34|$0022|[ICCOMZ](ICCOMZ/README.md)| |  
|35|$0023|[ICSTAZ](ICSTAZ/README.md)| |  
|36,37|$0024,$0025|[ICBALZ](ICBALZ/README.md),[ICBAHZ](ICBAHZ/README.md)| |  
|38,39|$0026,$0027|[ICPTLZ](ICPTLZ/README.md),[ICPTHZ](ICPTHZ/README.md)| |  
|40,41|$0028,$0029|[ICBLLZ](ICBLLZ/README.md),[ICBLHZ](ICBLHZ/README.md)| |  
|42|$002A|[ICAX1Z](ICAX1Z/README.md)| |  
|43|$002B|[ICAX2Z](ICAX2Z/README.md)| |  
|44,45|$002C,$002D|[ICAX3Z](ICAX3Z/README.md),[ICAX4Z](ICAX4Z/README.md)| |  
|46|$002E|[ICAX5Z](ICAX5Z/README.md)| |  
|47|$002F|[ICAX6Z](ICAX6Z/README.md)| |  
|48|$0030|[STATUS](STATUS/README.md)| |  
|49|$0031|[CHKSUM](CHKSUM/README.md)| |  
|50,51|$0032,$0033|[BUFRLO](BUFRLO/README.md),[BUFRHI](BUFRHI/README.md)| |  
|52,53|$0034,$0035|[BFENLO](BFENLO/README.md),[BFENHI](BFENHI/README.md)| |  
|54|$0036|[CRETRY](CRETRY/README.md)| |A  
|55|$0037|[DRETRY](DRETRY/README.md)| |A  
|54,55|$0036,$0037|[LTEMP](LTEMP/README.md)| |X  
|56|$0038|[BUFRFL](BUFRFL/README.md)| |  
|57|$0039|[RECVDN](RECVDN/README.md)| |  
|58|$003A|[XMTDON](XMTDON/README.md)| |  
|59|$003B|[CHKSNT](CHKSNT/README.md)| |  
|60|$003C|[NOCKSM](NOCKSM/README.md)| |  
|61|$003D|[BPTR](BPTR/README.md)| |  
|62|$003E|[FTYPE](FTYPE/README.md)| |  
|63|$003F|[FEOF](FEOF/README.md)| |  
|64|$0040|[FREQ](FREQ/README.md)| |  
|65|$0041|[SOUNDR](SOUNDR/README.md)| |  
|66|$0042|[CRITIC](CRITIC/README.md)| |  
|67-73|$0043-$0049|[FMZSPG](FMZSPG/README.md)| |  
|67,68|$0043,$0044|[ZBUFP](ZBUFP/README.md)| |  
|69,70|$0045,$0046|[ZDRVA](ZDRVA/README.md)| |  
|71,72|$0047,$0048|[ZSBA](ZSBA/README.md)| |  
|73|$0049|[ERRNO](ERRNO/README.md)| |  
|74|$004A|[CKEY](CKEY/README.md)| |A  
|75|$004B|[CASSBT](CASSBT/README.md)| |A  
|74,75|$004A,$004B|[ZCHAIN](ZCHAIN/README.md)| |X  
|76|$004C|[DSTAT](DSTAT/README.md)| |  
|77|$004D|[ATRACT](ATRACT/README.md)| |  
|78|$004E|[DRKMSK](DRKMSK/README.md)| |  
|79|$004F|[COLRSH](COLRSH/README.md)| |  
|80|$0050|[TEMP](TEMP/README.md)| |  
|81|$0051|[HOLD1](HOLD1/README.md)| |  
|82|$0052|[LMARGN](LMARGN/README.md)| |  
|83|$0053|[RMARGN](RMARGN/README.md)| |  
|84|$0054|[ROWCRS](ROWCRS/README.md)| |  
|85,86|$0055,$0056|[COLCRS](COLCRS/README.md)| |  
|87|$0057|[DINDEX](DINDEX/README.md)| |  
|88,89|$0058,$0059|[SAVMSC](SAVMSC/README.md)| |  
|90|$005A|[OLDROW](OLDROW/README.md)| |  
|91,92|$005B,$005C|[OLDCOL](OLDCOL/README.md)| |  
|93|$005D|[OLDCHR](OLDCHR/README.md)| |  
|94,95|$005E,$005F|[OLDADR](OLDADR/README.md)| |  
|96|$0060|[NEWROW](NEWROW/README.md)| |A  
|96,97|$0060,$0061|[FKDEF](FKDEF/README.md)| |X  
|97,98|$0061,$0062|[NEWCOL](NEWCOL/README.md)| |A  
|98|$0062|[PALNTS](PALNTS/README.md)| |X  
|99|$0063|[LOGCOL](LOGCOL/README.md)| |  
|100,101|$0064;$0065|[ADRESS](ADRESS/README.md)| |  
|102,103|$0066,$0067|[MLTTMP](MLTTMP/README.md)| |  
|104,105|$0068,$0069|[SAVADR](SAVADR/README.md)| |  
|106|$006A|[RAMTOP](RAMTOP/README.md)| |  
|107|$006B|[BUFCNT](BUFCNT/README.md)| |  
|108,109|$006C,$006D|[BUFSTR](BUFSTR/README.md)| |  
|110|$006E|[BITMSK](BITMSK/README.md)| |  
|111|$006F|[SHFAMT](SHFAMT/README.md)| |  
|112,113|$0070,$0071|[ROWAC](ROWAC/README.md)| |  
|114,115|$0072,$0073|[COLAC](COLAC/README.md)| |  
|116,117|$0074,$0075|[ENDPT](ENDPT/README.md)| |  
|118|$0076|[DELTAR](DELTAR/README.md)| |  
|119,120|$0077,$0078|[DELTAC](DELTAC/README.md)| |  
|121|$0079|[ROWINC](ROWINC/README.md)| |A  
|122|$007A|[COLINC](COLINC/README.md)| |A  
|121,122|$0079,$007A|[KEYDEF](KEYDEF/README.md)| |X  
|123|$007B|[SWPFLG](SWPFLG/README.md)| |  
|124|$007C|[HOLDCH](HOLDCH/README.md)| |  
|125|$007D|[INSDAT](INSDAT/README.md)| |  
|126,127|$007E,$007F|[COUNTR](COUNTR/README.md)| |  
|128,129|$0080,$0081|[LOMEM](LOMEM/README.md)| |  
|130,131|$0082,$0083|[VNTP](VNTP/README.md)| |  
|132,133|$0084,$0085|[VNTD](VNTD/README.md)| |  
|134,135|$0086,$0087|[VVTP](VVTP/README.md)| |  
|136,137|$0088,$0089|[STMTAB](STMTAB/README.md)| |  
|138,139|$008A,$008B|[STMCUR](STMCUR/README.md)| |  
|140,141|$008C,$008D|[STARP](STARP/README.md)| |  
|142,143|$008E,$008F|[RUNSTK](RUNSTK/README.md)| |  
|144,145|$0090,$0091|[MEMTOP](TOPSTK/README.md)| |  
|146-202|$0092-$00CA| |reserved for BASIC ROM|  
|186,187|$00BA,$00BB|[STOPLN](STOPLN/README.md)| |  
|195|$00C3|[ERRSAVE](ERRSAVE/README.md)| |  
|201|$00C9|[PTABW](PTABW/README.md)| |  
|203-207|$00CB-$00CF| |unused by BASIC and ASSEMBLER|  
|208,209|$00D0,$00D1| |unused by BASIC|  
|210,211|$00D2,$00D3| |reserved for BASIC or cartridge use|  
|212-217|$00D4-$00D9|[FR0](FR0/README.md)|Floating point register zero; holds a six-byte internal form of the FP number|  
|218-223|$00D1-$00DF|[FRE](FRE/README.md)|FP extra register|  
|224-229|$00E0-$00E5|[FR1](FR1/README.md)|Floating point register one; holds a six-byte internal form of the FP number as does FR0|  
|230-235|$00E6-$00EB|[FR2](FR2/README.md)|FP register two|  
|236|$00EC|[FRX](FRX/README.md)|FP spare register|  
|237|$00ED|[EEXP](EEXP/README.md)|The value of E (the exponent)|  
|238|$00EE|[NSIGN](NSIGN/README.md)|The sign of the FP number|  
|239|$00EF|[ESIGN](ESIGN/README.md)|The sign of the exponent|  
|240|$00F0|[FCHRFLG](FCHRFLG/README.md)|The first character flag|  
|241|$00F1|[DIGRT](DIGRT/README.md)|The number of digits to the right of the decimal|  
|242|$00F2|[CIX](CIX/README.md)|Character (current input) index. Used as an offset to the input text buffer pointed to by INBUFF below.|  
|243,244|$00F3,$00F4|[INBUFF](INBUFF/README.md)|Input ASCII text buffer pointer|  
|245,246|$00F5,$00F6|[ZTEMP1](ZTEMP1/README.md)|Temporary register|  
|247,248|$00F7,$00F8|[ZTEMP4](ZTEMP4/README.md)|Temporary register|  
|249,250|$00F9,$00FA|[ZTEMP3](ZTEMP3/README.md)|Temporary register|  
|251|$00FB|[RADFLG](RADFLG/README.md)|Also called DEGFLG. When 0 all functions are performed in radians; when set to 6, they are done in degrees|  
|252,253|$00FC,$00FD|[FLPTR](FLPTR/README.md)|Points to the user's FP number|  
|254,255|$00FE,$00FF|[FPTR2](FPTR2/README.md)|Pointer to the user's second FP operation.|  
  
### Page 1
  
|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|256-511|$0100-$01FF| |The OS/DOS/BASIC stack |  
  
### Page 2
  
|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|512,513|$0200,$0201|[VDSLST](VDSLST/README.md)|Vector to Display List Interrupt routine |  
|514,515|$0202,$0203|[VPRCED](VPRCED/README.md)| |  
|516,517|$0204,$0205|[VINTER](VINTER/README.md)| |  
|518,519|$0206,$0207|[VBREAK](VBREAK/README.md)| |  
|520,521|$0208,$0209|[VKEYBD](VKEYBD/README.md)| |  
|522,523|$020A,$020B|[VSERIN](VSERIN/README.md)| |  
|524,525|$020C,$020D|[VSEROR](VSEROR/README.md)| |  
|526,527|$020E,$020F|[VSEROC](VSEROC/README.md)| |  
|528,529|$0210,$0211|[VTIMR1](VTIMR1/README.md)| |  
|530,531|$0212,$0213|[VTIMR2](VTIMR2/README.md)| |  
|532,533|$0214,$0215|[VTIMR4](VTIMR4/README.md)| |  
|534,535|$0216,$0217|[VIMIRQ](VIMIRQ/README.md)| |  
|536,537|$0218,$0219|[CDTMV1](CDTMV1/README.md)| |  
|538,539|$021A,$021B|[CDTMV2](CDTMV2/README.md)| |  
|540,541|$021C,$021D|[CDTMV3](CDTMV3/README.md)| |  
|542,543|$021E,$021F|[CDTMV4](CDTMV4/README.md)| |  
|544,545|$0220,$0221|[CDTMV5](CDTMV5/README.md)| |  
|546,547|$0222,$0223|[VVBLKI](VVBLKI/README.md)|Vector to Vertical Blank I_MMEDIATE Routine|  
|548,549|$0224,$0225|[VVBLKD](VVBLKD/README.md)|Vector to Vertical Blank D_EFERRED Routine|  
|550,551|$0226,$0227|[CDTMA1](CDTMA1/README.md)| |  
|552,553|$0228,$0229|[CDTMA2](CDTMA2/README.md)| |  
|554|$022A|[CDTMF3](CDTMF3/README.md)| |  
|555|$022B|[SRTIMR](SRTIMR/README.md)| |  
|556|$022C|[CDTMF4](CDTMF4/README.md)| |  
|557|$022D|[INTEMP](INTEMP/README.md)| |  
|558|$022E|[CDTMF5](CDTMF5/README.md)| |  
|559|$022F|[SDMCTL](SDMCTL/README.md)|Shadow of [DMACTL](DMACTL/README.md)|  
|560,561|$0230,$0231|[SDLSTL](SDLSTL/README.md),[SDLSTH](SDLSTH/README.md)|Shadow Pointer to Display List|  
|562|$0232|[SSKCTL](SSKCTL/README.md)| |  
|563|$0233|[SPARE](SPARE/README.md)| |A  
|563|$0233|[LCOUNT](LCOUNT/README.md)| |X  
|564|$0234|[LPENH](LPENH/README.md)|Shadow Light Pen Horizontal Value|  
|565|$0235|[LPENV](LPENV/README.md)|Shadow Light Pen Vertical Value |  
|566,567|$0236,$0237|[BRKKY](BRKKY/README.md)|Break key Interrupt vector|OS B/X?  
|568,569|$0238,$0239| |two spare bytes|A  
|568,569|$0238,$0239|[VPIRQ](VPIRQ/README.md)| |X  
|570|$023A|[CDEVIC](CDEVIC/README.md)| |  
|571|$023B|[CCOMND](CCOMND/README.md)| |  
|572|$023C|[CAUX1](CAUX1/README.md)| |  
|573|$023D|[CAUX2](CAUX2/README.md)| |  
|574|$023E|[TEMP](TEMP/README.md)| |  
|575|$023F|[ERRFLG](ERRFLG/README.md)| |  
|576|$0240|[DFLAGS](DFLAGS/README.md)| |  
|577|$0241|[DESECT](DESECT/README.md)| |  
|578,579|$0242,$0243|[BOOTAD](BOOTAD/README.md)| |  
|580|$0244|[COLDST](COLDST/README.md)| |  
|581|$0245| |spare |A  
|581|$0245|[RECLEN](RECLEN/README.md)| |X  
|582|$0246|[DSKTIM](DSKTIM/README.md)| |  
|583-622|$0247-$026E|[LINBUF](LINBUF/README.md)| |A  
|583|$0247|[PDVMSK](PDVMSK/README.md)| |X  
|584|$0248|[SHPDVS](SHPDVS/README.md)| |X  
|585|$0249|[PDIMSK](PDIMSK/README.md)| |X  
|586,587|$024A,$024B|[RELADR](RELADR/README.md)| |X  
|588|$024C|[PPTMPA](PPTMPA/README.md)| |X  
|589|$024D|[PPTMPX](PPTMPX/README.md)| |X  
|590-618|$024E-$026A| |reserved |X  
|619|$026B|[CHSALT](CHSALT/README.md)| |X  
|620|$026C|[VSFLAG](VSFLAG/README.md)| |X  
|621|$026D|[KEYDIS](KEYDIS/README.md)| |X  
|622|$026E|[FINE](FINE/README.md)|Fine Scroll Flag|X  
|623|$026F|[GPRIOR](GPRIOR/README.md)|Shadow of [PRIOR](PRIOR/README.md) |  
|624|$0270|[PADDL0](PADDL0/README.md)|Shadow Paddle 0|  
|625|$0271|[PADDL1](PADDL1/README.md)|Shadow Paddle 1|  
|626|$0272|[PADDL2](PADDL2/README.md)|Shadow Paddle 2|  
|627|$0273|[PADDL3](PADDL3/README.md)|Shadow Paddle 3|  
|628|$0274|[PADDL4](PADDL4/README.md)|Shadow Paddle 4 (nur 400/800)|  
|629|$0275|[PADDL5](PADDL5/README.md)|Shadow Paddle 5 (nur 400/800)|  
|630|$0276|[PADDL6](PADDL6/README.md)|Shadow Paddle 6 (nur 400/800)|  
|631|$0277|[PADDL7](PADDL7/README.md)|Shadow Paddle 7 (nur 400/800)|  
|632|$0278|[STICK0](STICK0/README.md)|Shadow Stick 0|  
|633|$0279|[STICK1](STICK1/README.md)|Shadow Stick 1|  
|634|$027A|[STICK2](STICK2/README.md)|Shadow Stick 2 (nur 400/800)|  
|635|$027B|[STICK3](STICK3/README.md)|Shadow Stick 3 (nur 400/800)|  
|636|$027C|[PTRIG0](PTRIG0/README.md)|Shadow Paddle Trigger 0|  
|637|$027D|[PTRIG1](PTRIG1/README.md)|Shadow Paddle Trigger 1|  
|638|$027E|[PTRIG2](PTRIG2/README.md)|Shadow Paddle Trigger 2|  
|639|$027F|[PTRIG3](PTRIG3/README.md)|Shadow Paddle Trigger 3|  
|640|$0280|[PTRIG4](PTRIG4/README.md)|Shadow Paddle Trigger 4 (nur 400/800)|  
|641|$0281|[PTRIG5](PTRIG5/README.md)|Shadow Paddle Trigger 5 (nur 400/800)|  
|642|$0282|[PTRIG6](PTRIG6/README.md)|Shadow Paddle Trigger 6 (nur 400/800)|  
|643|$0283|[PTRIG7](PTRIG7/README.md)|Shadow Paddle Trigger 7 (nur 400/800)|  
|644|$0284|[STRIG0](STRIG0/README.md)|Shadow Stick Trigger 0|  
|645|$0285|[STRIG1](STRIG1/README.md)|Shadow Stick Trigger 1|  
|646|$0286|[STRIG2](STRIG2/README.md)|Shadow Stick Trigger 2 (nur 400/800)|  
|647|$0287|[STRIG3](STRIG3/README.md)|Shadow Stick Trigger 3 (nur 400/800)|  
|648|$0288|[CSTAT](CSTAT/README.md)| |A  
|648|$0288|[HIBZTE](HIBZTE/README.md)| |A  
|649|$0289|[WMODE](WMODE/README.md)| |  
|650|$028A|[BLIM](BLIM/README.md)| |  
|651-655|$028B-$028F| |unused|A  
|651|$028B|[IMASK](IMASK/README.md)| |X  
|652,653|$028C,$028D|[JVECK](JVECK/README.md)| |X  
|654,655|$028E,$028F|[NEWADR](NEWADR/README.md)| |X  
|656|$0290|[TXTROW](TXTROW/README.md)| |  
|657,658|$0291,$0292|[TXTCOL](TXTCOL/README.md)| |  
|659|$0293|[TINDEX](TINDEX/README.md)| |  
|660,661|$0294,$0295|[TXTMSC](TXTMSC/README.md)| |  
|662-667|$0296-$029B|[TXTOLD](TXTOLD/README.md)| |  
|668|$029C|[TMPX1](TMPX1/README.md)| |A  
|668|$029C|[CRETRY](CRETRY/README.md)| |X  
|669|$029D|[HOLD3](HOLD3/README.md)| |  
|670|$029E|[SUBTMP](SUBTMP/README.md)| |  
|671|$029F|[HOLD2](HOLD2/README.md)| |  
|672|$02A0|[DMASK](DMASK/README.md)| |  
|673|$02A1|[TMPLBT](TMPLBT/README.md)| |  
|674|$02A2|[ESCFLG](ESCFLG/README.md)| |  
|675-689|$02A3-$02B1|[TABMAP](TABMAP/README.md)| |  
|690-693|$02B2-$02B5|[LOGMAP](LOGMAP/README.md)| |  
|694|$02B6|[INVFLG](INVFLG/README.md)| |  
|695|$02B7|[FILFLG](FILFLG/README.md)| |  
|696|$02B8|[TMPROW](TMPROW/README.md)| |  
|697,698|$02B9,$02BA|[TMPCOL](TMPCOL/README.md)| |  
|699|$02BB|[SCRFLG](SCRFLG/README.md)| |  
|700|$02BC|[HOLD4](HOLD4/README.md)| |  
|701|$02BD|[HOLD5](HOLD5/README.md)| |A  
|701|$02BD|[DRETRY](DRETRY/README.md)| |X  
|702|$02BE|[SHFLOK](SHFLOK/README.md)| |  
|703|$02BF|[BOTSCR](BOTSCR/README.md)| |  
|704|$02C0|[PCOLR0](PCOLR0/README.md)|Color of Player 0 and Missile 0 | both  
|705  |  $02C1  |  [PCOLR1](PCOLR1/README.md)  |  Color of Player 1 and Missile 1 | both  
|706  |  $02C2  |  [PCOLR2](PCOLR2/README.md)  |  Color of Player 3 and Missile 2 | both  
|707  |  $02C3  |  [PCOLR3](PCOLR3/README.md)  |  Color of Player 3 and Missile 3 | both  
|708  |  $02C4  |  [COLOR0](COLOR0/README.md)  |  Color Register 0  | both  
|709  |  $02C5  |  [COLOR1](COLOR1/README.md) | Color Register 1 | both  
|710  |  $02C6  |  [COLOR2](COLOR2/README.md) | Color Register 2 | both  
|711  |  $02C7  |  [COLOR3](COLOR3/README.md) | Color Register 3 | both  
|712  |  $02C8  |  [COLOR4](COLOR4/README.md) | Color Register 4 | both  
|713,714|$02C9,$02CA|[RUNADR](RUNADR/README.md)| |X  
|715,716|$02CB,$02CC|[HIUSED](HIUSED/README.md)| |X  
|717,718|$02CD,$02CE|[ZHIUSE](ZHIUSE/README.md)| |X  
|719,720|$02CF,$02D0|[GBYTEA](GBYTEA/README.md)| |X  
|721,722|$02D1,$02D2|[LOADAD](LOADAD/README.md)| |X  
|723,724|$02D3,$02D4|[ZLOADA](ZLOADA/README.md)| |X  
|725,726|$02D5,$02D6|[DSCTLN](DSCTLN/README.md)| |X  
|727,728|$02D7,$02D8|[ACMISR](ACMISR/README.md)| |X  
|729|$2D9|[KRPDEL](KRPDEL/README.md)| |X  
|730|$2DA|[KEYREP](KEYREP/README.md)| |X  
|731|$2DB|[NOCLIK](NOCLIK/README.md)| |X  
|732|$02FC|[HELPFG](HELPFG/README.md)| |X  
|733|$02DD|[DMASAV](DMASAV/README.md)| |X  
|734|$02DE|[PBPNT](PBPNT/README.md)| |X  
|735|$02DF|[PBUFSZ](PBUFSZ/README.md)| |X  
|736,737|$02E0,$02E1|[RUNAD](RUNAD/README.md)| |both  
|738,739|$02E2,$02E3|[INITAD](INITAD/README.md)| |both  
|740|$02E4|[RAMSIZ](RAMSIZ/README.md)| |both  
|741,742|$02E5,$02E6|[MEMTOP](MEMTOP/README.md)| |both  
|743,744|$02E7,$02E8|[MEMLO](MEMLO/README.md)| |both  
|745|$02E9|[HNDLOD](HNDLOD/README.md)| |X  
|746-749|$02EA-$02ED|[DVSTAT](DVSTAT/README.md)| |both  
|750,751|$02EE,$02EF|[CBAUDLCBAUDH](CBAUDLCBAUDH/README.md)| |both  
|752|$02F0|[CRSINH](CRSINH/README.md)|Cursor visibility|both  
|753|$02F1|[KEYDEL](KEYDEL/README.md)| |both  
|754|$02F2|[CH1](CH1/README.md)| |both  
|755|$02F3|[CHACT](CHACT/README.md)| |both  
|756|$02F4|[CHBAS](CHBAS/README.md)|Pointer to base address (high byte) of charset|both  
|757|$02F5|[NEWROW](NEWROW/README.md)| |X  
|758,759|$02F6,$02F7|[NEWCOL](NEWCOL/README.md)| |X  
|760|$02F8|[ROWINC](ROWINC/README.md)| |X  
|761|$02F9|[COLINC](COLINC/README.md)| |X  
|762|$02FA|[CHAR](CHAR/README.md)| |both  
|763|$02FB|[ATACHR](ATACHR/README.md)| |both  
|764|$02FC|[CH](CH/README.md)| | both  
|765|$02FD|[FILDAT](FILDAT/README.md)| |both  
|766|$02FE|[DSPFLG](DSPFLG/README.md)| |both  
|767|$02FF|[SSFLAG](SSFLAG/README.md)| |both  
  
### Page 3  
|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--| 
|768|$0300|[DDEVIC](DDEVIC/README.md)| |both  
|769|$0301|[DUNIT](DUNIT/README.md)| |both  
|770|$0302|[DCOMND](DCOMND/README.md)| |both  
|771|$0303|[DSTATS](DSTATS/README.md)| |both  
|772,773|$0304,$0305|[DBUFLO](DBUFLO/README.md),[DBUFHI](DBUFHI/README.md)| |both  
|774|$0306|[DTIMLO](DTIMLO/README.md)| |both  
|775|$0307|[DUNUSE](DUNUSE/README.md)| |both  
|776,777|$0308,$0309|[DBYTLO](DBYTLO/README.md),[DBYTHI](DBYTHI/README.md)| |both  
|778,779|$030A,$030B|[DAUX1](DAUX1/README.md),[DAUX2](DAUX2/README.md)| |both  
|780,781|$030C,$030D|[TIMER1](TIMER1/README.md)| |both  
|782|$030E|[ADDCOR](ADDCOR/README.md)| |A  
|782|$030E|[JMPERS](JMPERS/README.md)| |X  
|783|$030F|[CASFLG](CASFLG/README.md)| |both  
|784,785|$0310,$0311|[TIMER2](TIMER2/README.md)| |both  
|786,787|$0312,$0313|[TEMP1](TEMP1/README.md)| |both  
|788|$0314|[TEMP2](TEMP2/README.md)| |A  
|788|$0314|[PTIMOT](PTIMOT/README.md)| |X  
|789|$0315|[TEMP3](TEMP3/README.md)| |both  
|790|$0316|[SAVIO](SAVIO/README.md)| |both  
|791|$0317|[TIMFLG](TIMFLG/README.md)| |both  
|792|$0318|[STACKP](STACKP/README.md)| |both  
|793|$0319|[TSTAT](TSTAT/README.md)| |both  
|794-831|$031A-$033F|[HATABS](HATABS/README.md)|38 Bytes Handler Address Table|both  
|829|$033D|[PUPBT1](PUPBT1/README.md)| |X  
|830|$033E|[PUPBT2](PUPBT2/README.md)| |X  
|831|$033F|[PUPBT3](PUPBT3/README.md)| |X  
|832-847|$0340-$034F|[IOCB0](IOCB0/README.md)| |both  
|848-863|$0350-$035F|[IOCB1](IOCB1/README.md)| |both  
|864-879|$0360-$036F|[IOCB2](IOCB2/README.md)| |both  
|880-895|$0370-$037F|[IOCB3](IOCB3/README.md)| |both  
|896-911|$0380-$038F|[IOCB4](IOCB4/README.md)| |both  
|912-927|$0390-$039F|[IOCB5](IOCB5/README.md)| |both  
|928-943|$03A0-$03AF|[IOCB6](IOCB6/README.md)| |both  
|944-959|$03B0-$03BF|[IOCB7](IOCB7/README.md)| |both  
|960-999|$03C0-$03E7|[PRNBUF](PRNBUF/README.md)| |both  
|1000-1020|$03E8-$03FC| |reserved buffer|both  
|1000|$03E8|[SUPERF](SUPERF/README.md)|Flag for function keys|1200XL  
|1001|$03E9|[CKEY](CKEY/README.md)| |X  
|1002|$03EA|[CASSBT](CASSBT/README.md)| |X  
|1003|$03EB|[CARTCK](CARTCK/README.md)| |X  
|1004|$03EC|[DEERF](DEERF/README.md)| |X  
|1005-1015|$03ED-$03F7|[ACMVAR](ACMVAR/README.md)| |X  
|1016|$03F8|[BASICF](BASICF/README.md)| |X  
|1017|$03F9|[MINTLK](MINTLK/README.md)| |X  
|1018|$03FA|[GINTLK](GINTLK/README.md)| |X  
|1019,1020|$3FB,$3FC|[CHLINK](CHLINK/README.md)| |X  
  
### Page 4  
|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|1021-1151|$03FD-$047F|[CASBUF](CASBUF/README.md)| |both  
|1152-1279|$0480-$04FF| |128 free bytes|   

### Page 5  
|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|1280-1405|$0500-$057D| | |  
|1406|$057E|[LBPR1](LBPR1/README.md)|LBUFF prefix one|  
|1407|$057F|[LBPR2](LBPR2/README.md)|LBUFF prefix two|  
|1408-1535|$0580-$05FF|[LBUFF](LBUFF/README.md)|BASIC line Buffer |  
|1504|$05E0|[PLYARG](PLYARG/README.md)|Polynominal arguments|  
|1510-1515|$05E6-$05EB|[FPSCR](FPSCR/README.md)|Floating Point scratch pad use|  
|1516-1535|$05EC-$05FF|[FPSCR1](FPSCR1/README.md)|Floating Point scratch pad use|  
 
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
|43234|$A8E2| |[shows revision of BASIC](How_to_find_the_revision_number_of_Atari_Basic/README.md)|  
|49146|$BFFA| |Cartridge Start Address low |  
|49147|$BFFB| |Cartridge Start Address high |  
|49148|$BFFC| |Cartridge present?|  
|49149|$BFFD| |Option Byte|  
|49150|$BFFE| |Cartridge Initialization Address low |  
|49151|$BFFF| |Cartridge Initialization Address high |  
  
### [GTIA](GTIA/README.md) (CTIA)  

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|53248|$D000|[HPOSP0](HPOSP0/README.md),[M0PF](HPOSP0/README.md)| |both  
|53249|$D001|[HPOSP1](HPOSP1/README.md),[M1PF](HPOSP1/README.md)| |both  
|53250|$D002|[HPOSP2](HPOSP2/README.md),[M2PF](HPOSP2/README.md)| |both  
|53251|$D003|[HPOSP3](HPOSP3/README.md),[M3PF](HPOSP3/README.md)| |both  
|53252|$D004|[HPOSM0](HPOSM0/README.md),[P0PF](HPOSM0/README.md)| |both  
|53253|$D005|[HPOSM1](HPOSM1/README.md),[P1PF](HPOSM1/README.md)| |both  
|53254|$D006|[HPOSM2](HPOSM2/README.md),[P2PF](HPOSM2/README.md)| |both  
|53255|$D007|[HPOSM3](HPOSM3/README.md),[P3PF](HPOSM3/README.md)| |both  
|53256|$D008|[SIZEP0](SIZEP0/README.md),[M0PL](SIZEP0/README.md)| |both  
|53257|$D009|[SIZEP1](SIZEP1/README.md),[M1PL](SIZEP1/README.md)| |both  
|53258|$D00A|[SIZEP2](SIZEP2/README.md),[M2PL](SIZEP2/README.md)| |both  
|53259|$D00B|[SIZEP3](SIZEP3/README.md),[M3PL](SIZEP3/README.md)| |both  
|53260|$D00C|[SIZEM](SIZEM/README.md),[P0PL](SIZEM/README.md)| |both  
|53261|$D00D|[GRAFP0](GRAFP0/README.md),[P1PL](GRAFP0/README.md)| |both  
|53262|$D00E|[GRAFP1](GRAFP1/README.md),[P2PL](GRAFP1/README.md)| |both  
|53263|$D00F|[GRAFP2](GRAFP2/README.md),[P3PL](GRAFP2/README.md)| |both  
|53264|$D010|[GRAFP3](GRAFP3/README.md),[TRIG0](GRAFP3/README.md)| |both  
|53265|$D011|[GRAFM](GRAFM/README.md),[TRIG1](GRAFM/README.md)| |both  
|53266|$D012|[COLPM0](COLPM0/README.md),[TRIG2](COLPM0/README.md)| |both  
|53267|$D013|[COLPM1](COLPM1/README.md),[TRIG3](COLPM1/README.md)| |both  
|53268|$D014|[COLPM2](COLPM2/README.md),[PAL](COLPM2/README.md)| |both  
|53269|$D015|[COLPM3](COLPM3/README.md)| |both  
|53270|$D016|[COLPF0](COLPF0/README.md)| |both  
|53271|$D017|[COLPF1](COLPF1/README.md)| |both  
|53272|$D018|[COLPF2](COLPF2/README.md)| |both  
|53273|$D019|[COLPF3](COLPF3/README.md)| |both  
|53274|$D01A|[COLBK](COLBK/README.md)| |both  
|53275|$D01B|[PRIOR](PRIOR/README.md)| |both  
|53276|$D01C|[VDELAY](VDELAY/README.md)| |both  
|53277|$D01D|[GRACTL](GRACTL/README.md)| |both  
|53278|$D01E|[HITCLR](HITCLR/README.md)| |both  
|53279|$D01F|[CONSOL](CONSOL/README.md)| |both  
|53280-53503|$D020-$D0FF| |repeats 53248-53279, do not use |  

### Reserved 
|Address|Hex-Address|Name|Description|OS| 
|-------|-----------|----|-----------|--|
|53504-53759|$D100-$D1FF| |reserved for future use|B  
  
### POKEY  

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|53760|$D200|[AUDF1](AUDF1/README.md),[POT0](POT0/README.md)| |  
|53761|$D201|[AUDC1](AUDC1/README.md),[POT1](POT1/README.md)| |  
|53762|$D202|[AUDF2](AUDF2/README.md),[POT2](POT2/README.md)| |  
|53763|$D203|[AUDC2](AUDC2/README.md),[POT3](POT3/README.md)| |  
|53764|$D204|[AUDF3](AUDF3/README.md),[POT4](POT4/README.md)| |  
|53765|$D205|[AUDC3](AUDC3/README.md),[POT5](POT5/README.md)| |  
|53766|$D206|[AUDF4](AUDF4/README.md),[POT6](POT6/README.md)| |  
|53767|$D207|[AUDC4](AUDC4/README.md),[POT7](POT7/README.md)| |  
|53768|$D208|[AUDCTL](AUDCTL/README.md),[ALLPOT](ALLPOT/README.md)| |  
|53769|$D209|[STIMER](KBCODE/README.md),[KBCODE](KBCODE/README.md)| |  
|53770|$D20A|[SKREST](SKREST/README.md),[RANDOM](SKREST/README.md)| |  
|53771|$D20B|[POTGO](POTGO/README.md)| |  
|53772|$D20C| |unused|  
|53773|$D20D|[SEROUT](SEROUT/README.md),[SERIN](SEROUT/README.md)| |  
|53774|$D20E|[IRQEN](IRQEN/README.md),[IRQST](IRQEN/README.md)| |  
|53775|$D20F|[SKCTL](SKCTL/README.md),[SKSTAT](SKCTL/README.md)| |  
|53776-54015|$D210-$D2FF| |repeats 53760-53775, no special use|  
   
### PIA  

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|54016|$D300|[PORTA](PORTA/README.md)| |   
|54017|$D301|[PORTB](PORTB/README.md)| |  
|54018|$D302|[PACTL](PACTL/README.md)| |  
|54019|$D303|[PBCTL](PBCTL/README.md)| |  
|54020-54271|$D304-$D3FF| |repeats 54016-54019, no special use |  
  
### ANTIC  

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|54272|$D400|[DMACTL](DMACTL/README.md)| |  
|54273|$D401|[CHACTL](CHACTL/README.md)| |  
|54274,54275|$D402,$D403|[DLISTL](DLISTL/README.md),[DLISTH](DLISTL/README.md)| |  
|54276|$D404|[HSCROL](HSCROL/README.md)| |  
|54277|$D405|[VSCROL](VSCROL/README.md)| |  
|54278|$D406| |unused|  
|54279|$D407|[PMBASE](PMBASE/README.md)| |  
|54280|$D408| |unused|  
|54281|$D409|[CHBASE](CHBASE/README.md)| |  
|54282|$D40A|[WSYNC](WSYNC/README.md)| |  
|54283|$D40B|[VCOUNT](VCOUNT/README.md)| |  
|54284|$D40C|[PENH](PENH/README.md)| |  
|54285|$D40D|[PENV](PENV/README.md)| |  
|54286|$D40E|[NMIEN](NMIEN/README.md)| |  
|54287|$D40F|[NMIST](NMIST/README.md),[NMIRES](NMIST/README.md)| |  
|54288-54303|$D410-$D41F| |repeats 54272-54287|  
 
### Cartridge Port
  
|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
| |$D500-$D5FF| |Any read or write to an address in this range enables the cartridge control line [CCNTL](CCNTL/README.md) on the cartridge interface (same as ATARI 400 and ATARI 800)|B  
 
### Reserved
  

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
| |$D600-$D6FF| |reserved for future use|B
| |$D700-$D7FF| |reserved for future use|B  

### OS ROM

|Address|Hex-Address|Name|Description|OS|
|-------|-----------|----|-----------|--|
|55296|$D800|[AFP](AFP/README.md)|ASCII to Floating Point (FP) conversion|  
|55526|$D8E6|[FASC](FASC/README.md)|FP value to ASCII conversion|  
|55722|$D9AA|[IFP](IFP/README.md)|Integer to FP conversion|  
|55762|$D9D2|[FPI](FPI/README.md)|FP to integer conversion|  
|55876|$DA44|[ZFR0](ZFR0/README.md)|Clear [FR0](FR0/README.md) at 212 to 217 ($d$-$DB) by setting all bytes to zero|  
|55878|$DA46|[ZF1](ZF1/README.md)|Clear the FP number from [FR1](FR1/README.md), locations 224 to 229 ($E0 to $E5), by setting all bytes to zero.|  
|55904|$DA60|[FSUB](FSUB/README.md)|FP subtract routine, the value in [FR0](FR0/README.md) minus the value in [FR1](FR1/README.md).|  
|55910|$DA66|[FADD](FADD/README.md)|FP addition routine; [FR0](FR0/README.md) plus [FR1](FR1/README.md).|  
|56027|$DADB|[FMUL](FMUL/README.md)|FP multiplication routine; [FR0](FR0/README.md) times [FR1](FR1/README.md).|  
|56104|$DB28|[FDIV](FDIV/README.md)|FP division routine; [FR0](FR0/README.md) divided by [FR1](FR1/README.md).|  
|56640|$DD40|[PLYEVL](PLYEVL/README.md)|FP polynomial evaluation.|  
|56713|$DD89|[FLD0R](FLD0R/README.md)|Load the FP number into [FR0](FR0/README.md) from the 6502 X,Y registers.|  
|56717|$DD8D|[FLD0P](FLD0P/README.md)|Load the FP number into [FR0](FR0/README.md) from user routine, using [FLPTR](FLPTR/README.md) at 252 ($FC).|  
|56728|$DD98|[FLD1R](FLD1R/README.md)|Load the FP number into [FR1](FR1/README.md) from the 6502 X,Y registers.|  
|56732|$DD9C|[FLD1P](FLD1P/README.md)|Load the FP number into [FR1](FR1/README.md) from user program, using [FLPTR](FLPTR/README.md).|  
|56743|$DDA7|[FSTOR](FSTOR/README.md)|Store the FP number into the 6502 X,Y registers from [FR0](FR0/README.md).|  
|56747|$DDAB|[FSTOP](FSTOP/README.md)|Store the FP number from [FR0](FR0/README.md), using [FLPTR](FLPTR/README.md).|  
|56758|$DDB6|[FMOVE](FMOVE/README.md)|Move the FP number from [FR0](FR0/README.md) to [FR1](FR1/README.md).|  
|56768|$DDC0|[EXP](EXP/README.md)|FP base e exponentiation.|  
|56780|$DDCC|[EXP10](EXP10/README.md)|FP base 10 exponentiation.|  
|57037|$DECD|[LOG](LOG/README.md)|FP natural logarithm.|  
|57041|$DED1|[LOG10](LOG10/README.md)|FP base 10 logarithm.|  
| | | | |  
|57344|$E000| |Standard ATARI character set, beginning with punctuations and numbers|  
|57600|$E100| |capital letters|  
|57856|$E200| |special graphics|  
|58112|$E300| |lower case letters|  
|58367|$E3FF| |end of ATARI standard charset|  
| | | | |  
|58368|$E400|[EDITRV](EDITRV/README.md)|Screen editor (E:) entry point table|  
|58348|$E410|[SCRENV](SCRENV/README.md)|Display handler (television screen) (S:)|  
|58400|$E420|[KEYBDV](KEYBDV/README.md)|Jump Table for Keyboard driver "K:"|OSA/OSB/XL  
|58416|$E430|[PRINTV](PRINTV/README.md)|Printer handler (P:)|  
|58432|$E440|[CASETV](CASETV/README.md)|Cassette handler (C:)|  
|58448|$E450|[DISKIV](DISKIV/README.md)|Disk handler initialization vector, initialized to 60906 ($EDEA)|  
|58451|$E453|[DSKINV](DSKINV/README.md)|Disk handler (interface) entry; checks the disk status. Initialized to 60912 ($EDF0).|  
|58454|$E456|[CIOV](CIOV/README.md)| |  
|58457|$E459|[SIOV](SIOV/README.md)| |  
|58460|$E45C|[SETVBV](SETVBV/README.md)| |  
|58463|$E45F|[SYSVBV](SYSVBV/README.md)| |  
|58466|$E462|[XITVBV](XITVBV/README.md)|Exit from the VBLANK routine|  
|58469|$E465|[SIOINV](SIOINV/README.md)|SIO utility initialisation, OS use only|  
|58472|$E468|[SENDEV](SENDEV/README.md)|Send enable routine, OS use only|  
|58475|$E46B|[INTINV](INTINV/README.md)|Interrupt handler initialisation, OS use only|  
|58478|$E46E|[CIOINV](CIOINV/README.md)|CIO utility initialisation, OS Use only|  
|58481|$E471|[BLKBDV](BLKBDV/README.md)|Blackboard Mode Entry|  
|58484|$E474|[WARMSV](WARMSV/README.md)|Warm Start Vector|  
|58487|$E477|[COLDSV](COLDSV/README.md)|Cold Start Vector|  
|58490|$E47A|[RBLOKV](RBLOKV/README.md)|reads block from C:|  
|58493|$E47D|[CSOPIV](CSOPIV/README.md)|opens channel for C:|  
|58496|$E480|[PUPDIV](PUPDIV/README.md)|Vector for Self Test|X  
|58499|$E483|[SLFTSV](SLFTSV/README.md)| |X  
|58502|$E486|[PHENTV](PHENTV/README.md)| |X  
|58505|$E489|[PHULNV](PHULNV/README.md)| |X  
|58508|$E48C|[PHINIV](PHINIV/README.md)| |X  
|58511|$E48F|[GPDVV](GPDVV/README.md)| |X  
| | | | |  
| | | | |to be completed ...  
| | | | |  
|59310|$E7AE|[SYSVBL](SYSVBL/README.md)|X|  
|59345|$E7D1|[SYSVBL](SYSVBL/README.md)|A|  
| | | | |  
|65527|$FFF7| |[can be used to identify OS version](OS_Versions/README.md)|  
|65528|$FFF8|[CHKSUN](CHKSUN/README.md)|[can be used to identify OS version](OS_Versions/README.md)|  
|65530,65531|$FFFA,$FFFB|[PVECT](PVECT/README.md)| |  
