#
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * *
		Created by Peter Langston

Permission to copy, either in whole or in part, is  hereby
granted  to  anyone  wishing to do so with the restriction
that this entire notice must accompany any copies.

Copyright (c) 1976 by Peter S. Langston
			Commercial Union Leasing
			645 Madison Avenue
			New York, NY 10022
* * * * * * * * * * * * * * * * * * * * * * * * * * * * */


#define infofil "/sys/games/info/gom_txt"
char memory[11][11];
char in[80], crtflg, ttyflg, ttysiz, crt_clr[8], home_up[8], *hspac;
int hbd[441], cbd[441], hist[200][2];
int bsize, bsiz1, bsiz2;
char dd[8];
char *gexclams[] {
	"Whee! ", "Oh boy! ", "Aha! ", "Heh, heh ", "Well... ", "","",""
};
char *bexclams[] {
	"Oh NO! ", "Dum-ta-dum-dum ", "Uh oh...", "Oooops! ", "Eeeeek! ",
	"Well...","","","",""
};
int bestmov, bestval, bestnum;
int movenum, movesleft, max1, max2, memf;
char code[] { 0,	/* 0:0 */
	-1,-1,-1,-1,
	1,2,3,4,	/* 1:1 1:2 1:3 1:4 */
	5,6,7,-1,	/* 2:1 2:2 2:3 */
	8,9,-1,-1,	/* 3:1 3:2 */
	10,-1,-1,-1,	/* 4:1 */
	};

char	*term_types[] {
#define	ADDS580		0
	"adds/580",
#define	ADDS980		ADDS580+1
	"adds/980",
#define	BEEHIVE		ADDS980+1
	"beehive",
#define	DECSCOPE	BEEHIVE+1
	"decscope",
#define	TELERAY		DECSCOPE+1
	"teleray",
#define	TELETYPE	TELERAY+1
	"teletype",
#define	DATAPOINT	TELETYPE+1
	"datapoint",
#define	DIGILOG		DATAPOINT+1
	"digilog",
#define	SPECIAL		DIGILOG+1
	"special (other)",
	0
};

main()
{
	register int i, j, k;
	int x, y, z, *bd, *obd;

	for (i=0; i<11; i++)
		memory[i][10] = memory[10][i] = 1;
	if ((memf = open("gomoku.mem",2)) > 0) {
		read(memf,memory,121);
		printf("*** ");
	} else memf = creat("gomoku.mem",0604);
	printf("Welcome to HRSTS Go-moku!\n");
	getmodes();
	srand(0);
	info();
sizeask:
	printf("What size board would you like to play on? (19 max) ");
	read(0,in,80);
	bsize = atoi(in);
	if (bsize > 19 || bsize < 1) goto sizeask;
	bsiz1 = bsize+1;
	bsiz2 = bsize+2;
	movesleft = bsize*bsize;
	dd[0] = 1;
	dd[1] = bsiz2+1;
	dd[2] = bsiz2;
	dd[3] = bsiz2-1;
	dd[4] = -1;
	dd[5] = -bsiz2-1;
	dd[6] = -bsiz2;
	dd[7] = -bsiz2+1;
	for (i=0; i<bsiz2; i++) {
		hbd[i]=cbd[i]=hbd[i+bsiz1*bsiz2]=cbd[i+bsiz1*bsiz2] = -99;
		hbd[bsiz2*i] = cbd[bsiz2*i] = -99;
		hbd[bsiz2*i+bsiz1] = cbd[bsiz2*i+bsiz1] = -99;
	}
	for (i=1; i<bsiz1; i++) for (j=1; j<bsiz1; j++) {
		k = i*bsiz2+j;
		hbd[k] = cbd[k] = 0;
	}
	board(0);
loopy:
	printf("Your move? ");
	if (crtflg) printf("    ");
	if (read(0,in,20)>4) {
oops:		info();
		goto loopy;
	}
	if (in[0] == '?') {
		board(0);
		goto loopy;
	}
	y = in[2] < '0'?in[1]-'0' : (in[1]-'0')*10+in[2]-'0';
	if ((x=in[0]-'a'+1)<1 || x>bsize || y<0 || y>bsize) goto oops;
	x = x*bsiz2 + y;
	if (hbd[x] == -1 || hbd[x] == -2) goto oops;
	z = hbd[x];
	hbd[x] = -2;
	cbd[x] = -1;
	if (crtflg) board(y);
	hist[movenum][0] = x;
	hist[movenum++][1] = z;
	if (moves2win(z) == 1) {
		lose();
		goto again;
	}
	if (--movesleft == 0) goto draw;
	update(x,hbd,cbd);
	bestval = 99;
	for (i=bsiz2; i<bsiz1*bsiz2; i++) {
		if (cbd[i] == -99) continue;
		if ((x=moves2win(cbd[i])) && x<bestval) {
			printf(gexclams[x-1]);
			bestval = x;
			bestmov = i;
		}
	}
	for (i=bsiz2; i<bsiz1*bsiz2; i++) {
		if (hbd[i] == -99) continue;
		if ((x=moves2win(hbd[i])) && x<bestval) {
			printf(bexclams[x-1]);
			bestval = x;
			bestmov = i;
		}
	}
	if (bestval == 99) bestmov = miscmove();
	x = bestmov;
	z = cbd[x];
	hbd[x] = -1;
	cbd[x] = -2;
	printf("		I'll move @ %c%d    \n",x/bsiz2+'a'-1,x%bsiz2);
	if (crtflg) board(x%bsiz2);
	if (bestval == 1 && moves2win(z) == 1) goto again;
	update(x,cbd,hbd);
	if (--movesleft > 0) goto loopy;
draw:
	printf("Gosh!  It's a draw!  I'm doing lots better, huh?\n");
again:
	printf("Let's play again, ok? ");
	read(0,in,80);
	if (*in != 'n') {
		printf("%cOkay, this time ",12);
		goto sizeask;
	}
	printf("Well, it was fun...\n");
	unlink("gomok.log");
}
/**/
miscmove()
{
	register int i, misc;
	int x, y, n;

	x = y = n = 0;
	for (i=bsiz2; i<bsiz1*bsiz2; i++) {
		if (cbd[i] == 0 || cbd[i] == -99) continue;
		x =+ i/bsiz2;
		y =+ i%bsiz2;
		n++;
	}
	misc = (x/n)*bsiz2 + y/n;
	while (hbd[misc] < 0) {
		do {
			i = dd[rand()>>4&7];
		} while (hbd[misc+i] == -99);
		misc =+ i;
	}
	return(misc);
}
/**/
pattern(x,d,b)
int b[];
{
	register int i, j, hi;
	int lo, nst, bnst, n5p, x0;

	d = dd[d%4];
	bnst = n5p = 0;
	for (hi=1; hi<5; hi++) {
		x0 = x+hi*d;
		if (b[x0] == -99 || b[x0] == -1) break;
	}
	--hi;
	for (lo=1; lo<5; lo++) {
		x0 = x-lo*d;
		if (b[x0] == -99 || b[x0] == -1) break;
	}
	--lo;
	if (hi+lo < 4) return(0);
	for (i = -lo; i < hi-3; i++) {
		x0 = x+i*d;
		if (b[x0-d] == -2 || b[x0+5*d] == -2) continue;
		nst = 0;
		for (j=0; j<5; j++) {
			if (b[x0] == -2) nst++;
			x0 =+ d;
		}
		if (!nst || nst<bnst) continue;
		if (nst != bnst) {
			bnst = nst;
			n5p = 0;
		}
		n5p++;
	}
	return(code[bnst*4+n5p]);
}
/**/
update(x,a,b)
int a[], b[];
{
	register int i, j, d;
	int ddd, shift, mask, x0, q;

	for (ddd=0; ddd<4; ddd++) {
		d = dd[ddd];
		shift = ddd<<2;
		mask = ~(017<<shift);
		/* effect on opponent */
		for (i = -1; i > -5; --i) {
			j = b[x+i*d];
			if (j == -99 || j == -1) break;
		}
		while (i++ < 4) {
			j = b[x0 = x+i*d];
			if (j == -99 || (j == -1 && i)) break;
			if (-2 <= j && j <= 0) continue;
			q = pattern(x0,ddd,b)<<shift;
			j =& mask;
			b[x0] = j | q;
		}
		/* effect on player */
		for (i = -1; i > -6; --i) {
			j = a[x+i*d];
			if (j == -99 || j == -1) break;
		}
		while (i++ < 5) {
			j = a[x0 = x+i*d];
			if (j == -99 || j == -1) break;
			if (j == -2) continue;
			q = pattern(x0,ddd,a)<<shift;
			j =& mask;
			a[x0] = j | q;
		}
	}
}
/**/
board(y)
{
	register int i, j;

	printf("%s",home_up);
	if (!y) {
		printf("%s  ",crt_clr);
		for (j=0; j<bsize; j++) printf("%s%c",hspac,'a'+j);
	}
	printf("\n");
	for (i=1; i<bsiz1; i++) {
		if (y && y!=i) goto next_line;
		printf("%2d",i);
		for (j=1; j<bsiz1; j++) {
			switch(hbd[j*bsiz2+i]) {
			case -1: printf("%s*",hspac);
				break;
			case -2: printf("%sO",hspac);
				break;
			default: printf("%s.",hspac);
			}
		}
		printf(" %d ",i);
	next_line:
		printf("\n");
	}
	if (!y) {
		printf("  ");
		for (j=0; j<bsize; j++) printf("%s%c",hspac,'a'+j);
	}
	printf("\n");
}
/**/
moves2win(v)
{
	register int d, q;

	if (!v || (v<0 && v>-3))
		return(0);
	max1 = max2 = 0;
	for (d=0; d<4; d++) {
		if ((q = (v >> (d<<2)) & 017) <= max2)
			continue;
		if (q > max1) {
			max2 = max1;
			max1 = q;
		}
		else
			max2 = q;
	}
	return (memory[max1][max2]);
}

lose()
{
	register int i, j, x;

	printf("Oh boy!  You won!			\n");
	for (i=movenum-1; i>=0; --i) {
		x = hist[i][0];
		if ((j=moves2win(hist[i][1])) == 0) break;
		printf("I understand your move @ ");
		printf("%c%d (%d)   \n",x/bsiz2+'a'-1,x%bsiz2,j);
		sleep(1);
	}
	printf("But your move @ %c%d",x/bsiz2+'a'-1,x%bsiz2);
	printf(" was masterful!  I shall learn it.   \n");
	x = movenum-i;
	for (i=max1; i<11; i++)
		for (j=max2; j<11; j++)
			if (!memory[i][j] || memory[i][j]>x)
				memory[i][j] = x;
	seek(memf,0,0);
	write(memf,memory,121);
}
/**/
getmodes()
{
	char **cpp;
	register int i;

termask:
	printf("What make of terminal are you using? ");
	in[read(0,in,80)-1] = 0;
	switch(swmtch(in,term_types)) {
	case -2:
		printf("\"%s\" is ambiguous...  ",in);
	case -1:
		printf("The types I can recognize are:\n");
		cpp = term_types;
		while (*cpp)
			printf("  \"%s\"\n",*cpp++);
		printf("Try again...  ");
		goto termask;
	case ADDS580:
	case ADDS980:
		home_up[0] = 1;
		crtflg++;
		ttysiz = 25;
		crt_clr[0] = 12;
		hspac = " ";
		printf("%sThe 'roll' pushbutton should be out.\n",crt_clr);
		break;
	case BEEHIVE:
		home_up[0] = 5;
		crtflg++;
		ttysiz = 20;
		crt_clr[0] = 20;
		hspac = " ";
		printf(crt_clr);
		break;
	case DECSCOPE:
		home_up[0] = 033;
		home_up[1] = 'H';
		crtflg++;
		ttysiz = 24;
		crt_clr[0] = 033;
		crt_clr[1] = 'H';
		crt_clr[2] = 033;
		crt_clr[3] = 'J';
		hspac = " ";
		printf(crt_clr);
		break;
	case TELERAY:
		home_up[0] = 033;
		home_up[1] = 'H';
		crtflg++;
		ttysiz = 24;
		crt_clr[0] = 014;
		hspac = " ";
		printf("%s Is this the top or bottom of the screen? ",crt_clr);
		read(0, in, 20);
		if (*in == 't')
			break;
	case TELETYPE:
		home_up[0] = 10;
		home_up[1] = 0;
		crtflg = 0;
		ttysiz = 66;
		hspac = " ";
		break;
	case DATAPOINT:
		home_up[0] = 29;
		crtflg++;
		ttysiz = 25;
		crt_clr[0] = 29;
		crt_clr[1] = 31;
		hspac = " ";
		printf(crt_clr);
		break;
	case DIGILOG:
		home_up[0] = 14;
		crtflg++;
		ttysiz = 16;
		crt_clr[0] = 12;
		hspac = "  ";
		printf(crt_clr);
		break;
	case SPECIAL:
		printf("Is this a crt? ");
		read(0,in,80);
		if (*in != 'n') {
			crtflg++;
			printf("Type the home-up char(s) and a <NL>...");
			in[read(0,in,20)-1] = 0;
			in[3] = 0;
			copy(in, home_up);
			printf("Type the clear screen char(s) & a <cr>...");
			in[read(0,in,20)-1] = 0;
			in[3] = 0;
			copy(in, crt_clr);
			printf("How many lines are there on the screen? ");
			read(0,in,80);
			ttysiz = atoi(in);
			printf("How many chars per line? ");
			read(0,in,80);
			if (atoi(in)/ttysiz > 3) hspac = "  ";
			else hspac = " ";
		} else printf("Might as well call it a teletype, then.\n");
		break;
	}
}
/**/
info()
{
	char fh, buf[512];

	printf("Instructions? ");
	read(0,in,80);
	if (in[0] != 'y') return;
	fh = open(infofil,0);
	if (fh < 0) {
		printf("Unfortunately, there is no information available...\n");
		printf("(an oversight at best.)\n");
		return;
	}
	while (write(1,buf,read(fh,buf,80)));
	if (crtflg) {
		printf("Hit new line when ready...");
		read(0,in,20);
		printf(crt_clr);
	}
	return;
}
/*  swmtch  -  match minimal abbreviation for switches
 *
 *	call:  n = swmtch(sp, dp)
 *
 *		sp points at an asciz string to be matched
 *		dp points at a vector of char pointers to the
 *			strings to be matched.
 *
 *	return int is the index into dp or
 *	-1 if no match was found or
 *	-2 if the string was ambiguous
 */

swmtch(sp, dp)
char *sp, *dp[];
{
	register char *cp;
	register int *ip, retval;
	int i, j;

	retval = -1;
	ip = dp;
	cp = sp;
	i = 0;
	do {
		if(j = headeq(cp, *dp++))
			if(j == 1)
				if(retval == -1)
					retval = i;
				else
					retval = -2;
			else
				return(i);
		i++;
	} while(*dp);
	return(retval);
}



headeq(s1, s2)
char *s1, *s2;
{
	register char *cp1, *cp2;

	cp1 = s1;
	cp2 = s2;
	do
		if(*cp1++ != *cp2++) return(0);
	while(*cp1 && *cp1!=' ');
	if(*cp2)
		return(1);
	else
		return(-1);
}
copy(from,to)
char *from, *to;
{
	register char *f, *t;

	f = from;
	t = to;
	while (*t++ = *f++);
	return(--t);
}
