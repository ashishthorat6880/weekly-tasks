#include<conio.h>
#include<stdio.h>
#define max 20
int q[max];
int r=0,f=0,cnt=0;
void enq();
void deq();
void display();
void main()
{
int ch;
do
{
printf("\n1:Add student details\n2:Distribute bus pass\n3:Wating student\n4:Exit\n choose what you want");
scanf("%d",&ch);
switch(ch)
{
case 1:enq();break;
case 2:deq();break;
case 3:display();break;
case 4:exit();break;
default:printf("\nwrong choose");
}
}
while(ch!=4);
}
void enq()
{
int rno;
if(cnt==max)
{
printf("\n list is full");
}
else
{
printf("\n Details for bus pass\n");
printf("\nenter Roll number ");
scanf("\n%d",&rno);
q[r]=rno;
r=(r+1)%max;
cnt++;
}
}
void deq()
{
if(cnt==0)
printf("\n list is empty");
else
{
printf("\n \t pass distributed to%d",q[f]);
f=(f+1)%max;
cnt--;
}
}
void display()
{
int i;
printf("\n-------Remaining students-----\n");
if(cnt=='0')
printf("\n all student distributed the pass");
else
{
for(i=f;i!=r;i=(i+1)%max)
{
printf("%d\n",q[i]);
}
}
}