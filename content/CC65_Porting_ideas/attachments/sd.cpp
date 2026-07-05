#include <graphics.h>
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <dos.h>
#include <stdlib.h>
int cx=1,cy=1,ppp=0,r=40,ex=2,ey=1;
void call(int xy){if(xy==1){sound(1000);delay(15);} if(xy==2){sound(400);delay(20);}if(xy==3){sound(1400);delay(20);}if(xy==4){sound(700);delay(20);}if(xy==5){sound(1700);delay(20);}nosound();}

void draw(){ int x11=600,y11=200,r1=20;
settextstyle(0,0,4);outtextxy(100,200,"Space DIRT------");
settextstyle(1,0,1);outtextxy(100,260,"Developed by Rafay Mansoor");
settextstyle(1,0,1);outtextxy(100,290,"E-mail rafaymansoor@yahoo.com");
delay(2000);settextstyle(0,0,0);settextjustify(1,0);
setfillstyle(1,0);
for(;x11>310;x11--){  ellipse(x11,y11,0,360,r1,r1);fillellipse(x11,y11,r1,r1);outtextxy(x11,y11,"0.0  ");
if(x11%10==0){r1++;call(4);}delay(2);setcolor(random(14));ellipse(x11+1,y11,0,360,r1,r1);}
r1=20;
for(x11=600;x11>310;x11--){setcolor(15);outtextxy(x11,y11,"0.0  ");ellipse(x11,y11,0,360,r1,r1);setcolor(0);fillellipse(x11+1,y11,r1,r1);
if(x11%10==0){call(4);}delay(2);}

delay(1000);cleardevice();    }//draw end

void point(int xxx,int xxxdir,int x,int xdir){
if(r<18){setcolor(5);settextstyle(0,0,4);outtextxy(300,200,"YOU WIN");delay(3000);exit(0);}
if((xdir*xxxdir>0)&&(xxx<x)){ppp++;r--;gotoxy(1,4);printf("Good SHOT !!!");}
if((xdir*xxxdir>0)&&(xxx>x)){ppp++;r--;gotoxy(1,4);printf("Good SHOT !!!"); }
if((xdir*xxxdir<0)){r+=2;ppp--;gotoxy(1,4);printf("Bad SHOT !!!");
if(ex>1)ex--;}
}
int count(){unsigned long int bk=0,ds;
for(int i=1;i<=600;i++){
for(int j=1;j<=400;j++){
if(getpixel(i,j)==0)bk++;}}
ds=100-bk/(63*45);
if(ds>50){setfillstyle(1,0);bar(100,100,500,300);
setcolor(5);settextstyle(0,0,4);outtextxy(300,200,"GAME   OVER");delay(3000);exit(0);}
return(ds);
}

void main(void)
{
   /* request auto detection */
   int placex=0,placey=0,power=0,ds=0,hh=0;
   int gdriver = DETECT, gmode,ch,xx2=300,yy2=400,xx22,yy22,xx2dir=1,yy2dir=1;
   initgraph(&gdriver, &gmode, "c:\tc\bgi");
unsigned long time=0;
int x1,y1,xx1,yy1,xxx1,yyy1,y=(random(5)+1)*100,x=(random(6)+1)*100,xx=200,yy=200,xxx=300,yyy=100,xdir=1,ydir=1,xxdir=1,yydir=1,xxxdir=1,yyydir=1;
draw();
settextstyle(0,0,0);
while(1){
	if(kbhit()){
	ch=getch();
	if(ch==80){if(yyydir==-1)yyydir=1;}
	if(ch==72){if(yyydir==1)yyydir=-1;}
	if(ch==77){if(xxxdir==-1)xxxdir=1;}
	if(ch==75){if(xxxdir==1)xxxdir=-1;}
	if(ch=='p'){gotoxy(1,4);printf("PAUSE        ");getch();gotoxy(1,4);printf("      ");}
	if(ch=='e')break;
	}
gotoxy(1,1);printf("Points=%d    Speed=%d     Space DIRT=%d    p=Pause  e=Exit ",ppp,ex+ey,ds);
setcolor(15);
ellipse(x,y,0,360,r,r);//color ball
if(ydir>0)settextjustify(1,2);else settextjustify(1,0);
if(xdir>0){outtextxy(x,y,"  0.0");} else {outtextxy(x,y,"0.0  ");}

setcolor(7);ellipse(xx,yy,0,360,15,15);ellipse(xx2,yy2,0,360,10,10);

setcolor(2);ellipse(xxx,yyy,0,360,20,20);//erase ball
int mo=8;
if(yyydir>0)settextjustify(1,2);else {settextjustify(1,0);mo=5;}
if(xxxdir>0){outtextxy(xxx,yyy,"  0.0");ellipse(xxx+mo-1,yyy+mo+2,180,360,5,2);}
else {outtextxy(xxx,yyy,"0.0  ");ellipse(xxx-mo+1,yyy+mo+2,180,360,5,2);}

x1=x;y1=y;xx1=xx;yy1=yy;xxx1=xxx;yyy1=yyy,xx22=xx2,yy22=yy2;
xx=xx+(xxdir*4);
yy=yy+(yydir*2);

xx2=xx2+(xx2dir*1);
yy2=yy2+(yy2dir*1);

xxx=xxx+(xxxdir*ex);
yyy=yyy+(yyydir*ey);

x=x+(xdir*cx);
y=y+(ydir*cy);

if(xxx>620||xxx<20){xxxdir*=-1;call(1);}
if(yyy>460||yyy<20){yyydir*=-1;call(2);}//erase & color balls are hit
if(abs(xxx-x)<40&&abs(yyy-y)<40){ call(3);point(xxx,xxxdir,x,xdir);
x=x+10;y=y+5;xxx=xxx+10;yyy=yyy+5;yyydir*=-1;xxxdir*=-1;ydir*=-1;xdir*=-1;}

if(abs(xx-xxx)<35&&abs(yy-yyy)<35){
yydir*=-1;xxdir*=-1;yyydir*=-1;xxxdir*=-1;}

////points start///////////////////////////////


if((power!=7)&&(power!=3)&&(power!=5)&&(power!=10)&&(power!=14)){power=random(2000);

	if(power==7){ placex=random(400)+100;placey=random(250)+100;
	setfillstyle(1,7);fillellipse(placex,placey,10,10);
	gotoxy(1,3);printf("Get Speed      ");call(5);
	}

	if(power==3){ placex=random(400)+100;placey=random(250)+100;
	setfillstyle(1,3);fillellipse(placex,placey,10,10);
	gotoxy(1,3);printf("Get 5 Points  ");call(5);
	}

	if(power==5){ placex=random(400)+100;placey=random(250)+100;
	setfillstyle(1,5);fillellipse(placex,placey,10,10);
	gotoxy(1,3);printf("Hard HIT     ");call(5);
	}
	if(power==10){ placex=random(400)+100;placey=random(250)+100;
	setfillstyle(1,10);fillellipse(placex,placey,10,10);
	gotoxy(1,3);printf("Clear SPACE     ");call(5);
	}
	if(power==14){ placex=random(400)+100;placey=random(250)+100;
	setfillstyle(1,14);fillellipse(placex,placey,10,10);
	gotoxy(1,3);printf("Help For you     ");call(5);
	}
	}

if(abs(xxx-placex)<10&&abs(yyy-placey)<10&&(power==7)){ hh=0;call(4);power=0;ex++;ey++;gotoxy(1,3);printf("              ");}
if(abs(xxx-placex)<10&&abs(yyy-placey)<10&&(power==3)){ hh=0;call(4);power=0;ppp+=5;gotoxy(1,3);printf("              ");}
if(abs(xxx-placex)<10&&abs(yyy-placey)<10&&(power==5)){ hh=0;call(4);power=0;r-=3;gotoxy(1,3);printf("              ");}
if(abs(xxx-placex)<10&&abs(yyy-placey)<10&&(power==10)){ hh=0;call(4);power=0;setfillstyle(1,0);bar(0,100,680,400);gotoxy(1,3);printf("              ");}
if(abs(xxx-placex)<10&&abs(yyy-placey)<10&&(power==14)){ call(4);power=0;hh=1;gotoxy(1,3);printf("              ");}

if((power==7)||(power==3)||(power==5)||(power==10)){
if(abs(x-placex)<20&&abs(y-placey)<20){ r+=2;

if((power==14)||(power==10)){hh=2;gotoxy(1,3);}
if(power==5){ r+=8;}
if(power==3){ ppp-=5;}
if(power==7){ cx++;}

call(4);power=0;gotoxy(1,3);printf("YOU miss it !!!");}
}

//points end//////////////////////////////////


if(xx>620||xx<20){xxdir*=-1;}
if(yy>460||yy<20){yydir*=-1;}

if(xx2>620||xx2<20){xx2dir*=-1;}
if(yy2>460||yy2<20){yy2dir*=-1;}
if(abs(xx2-xxx)<25&&abs(yy2-yyy)<25){
yy2dir*=-1;xx2dir*=-1;yyydir*=-1;xxxdir*=-1;}

if(x>620||x<20){xdir*=-1;}
if(y>460||y<20){ydir*=-1;}
time++;
delay(10);
if(time>=(100*30)){ds=2*count();time=0;}
//cleardevice();
setcolor(0);fillellipse(x1,y1,r,r);
setcolor(random(14));ellipse(x1,y1,0,360,r,r);
setcolor(0);ellipse(xx1,yy1,0,360,15,15);ellipse(xx22,yy22,0,360,10,10);
setfillstyle(1,0);fillellipse(xxx1,yyy1,20,20);
putpixel(random(640),random(500),random(13));
if(hh==2){setcolor(random(14));ellipse(xx22,yy22,0,360,10,10);ellipse(xx1,yy1,0,360,15,15);}
if(hh==1){setcolor(0);fillellipse(xx1,yy1,15,15);fillellipse(xx22,yy22,10,10);}

}

}