#include <stdio.h>

int getint()
{
 char n;
 while((n = getchar()) <'0' || n >'9');
 return(n - '0');
}

movedisc(int from, int to)
{
   printf("Move %d->%d\n",from,to);
}

movetower(int height, int from, int to, int use)
{
if(height > 0)
	{
	   movetower(height-1, from, use, to);
	   movedisc(from, to);
	   movetower(height-1, use, to, from);
	}
}

void main()
{
int numdiscs;
printf("\nEnter the number of discs to start with: ");
numdiscs = getint(); 
printf("\n\n");
movetower(numdiscs,1,3,2);
printf("\n\n");
#ifdef __ATARI__
  /* Atari DOS 2.x clears the screen after program termination, so wait... */
  printf("hit <return> to exit...");
  cgetc();
#endif

}
