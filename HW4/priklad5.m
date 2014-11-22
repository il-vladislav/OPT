function priklad5
clf;
N=30;
x1=linspace(-1,1,N)'*ones(1,N); x2=x1';
 
[y1,y2]=F(x1,x2); plot(y1,y2,'k'); hold on; plot(y1',y2','k');
axis equal; axis manual; hold on
xx1=.4; xx2=.7;
[yy1,yy2]=F(xx1,xx2); plot(yy1,yy2,'ro');
[y1,y2]=T1(xx1,xx2,x1,x2); plot(y1,y2,'g'); hold on; plot(y1',y2','g');
[y1,y2]=T2(xx1,xx2,x1,x2); plot(y1,y2,'b'); hold on; plot(y1',y2','b');
return

function [y1,y2]=F(x1,x2)
r=log(1+x1.^2+x2.^2);
y1=x1.*r; y2=x2.*r;

function [y1,y2]=T1(xx1,xx2,x1,x2)
[f1,f2]=F(x1,x2);

y1dx=[log(xx1^2 + xx2^2 + 1) + (2*xx1^2)/(xx1^2 + xx2^2 + 1);(2*xx1*xx2)/(xx1^2 + xx2^2 + 1)];
y2dx=[(2*xx1*xx2)/(xx1^2 + xx2^2 + 1),log(xx1^2 + xx2^2 + 1) + (2*xx2^2)/(xx1^2 + xx2^2 + 1)];
 
y1=f1+y1dx(1)*(x1-xx1)+y1dx(2)*(x2-xx2);
y2=f2+y2dx(1)*(x1-xx1)+y2dx(2)*(x2-xx2);

function [y1,y2]=T2(xx1,xx2,x1,x2)

y1 = [(6*xx1)/(xx1^2 + xx2^2 + 1) - (4*xx1^3)/(xx1^2 + xx2^2 + 1)^2,(2*xx2)/(xx1^2 + xx2^2 + 1) - (4*xx1^2*xx2)/(xx1^2 + xx2^2 + 1)^2;
    (2*xx2)/(xx1^2 + xx2^2 + 1) - (4*xx1^2*xx2)/(xx1^2 + xx2^2 + 1)^2,(2*xx1)/(xx1^2 + xx2^2 + 1) - (4*xx1*xx2^2)/(xx1^2 + xx2^2 + 1)^2];

y2 = [(2*xx2)/(xx1^2 + xx2^2 + 1) - (4*xx1^2*xx2)/(xx1^2 + xx2^2 + 1)^2,(2*xx1)/(xx1^2 + xx2^2 + 1) - (4*xx1*xx2^2)/(xx1^2 + xx2^2 + 1)^2;
    (2*xx1)/(xx1^2 + xx2^2 + 1) - (4*xx1*xx2^2)/(xx1^2 + xx2^2 + 1)^2,(6*xx2)/(xx1^2 + xx2^2 + 1) - (4*xx2^3)/(xx1^2 + xx2^2 + 1)^2];

[t1,t2]=T1(xx1,xx2,x1,x2);

y1=t1+0.5*(((xx1-x1).^2)*y1(1,1)+2*y1(1,2)*(x1-xx1).*(x2-xx2)+y1(2,2)*(x2-xx2).^2);
y2=t2+0.5*(((xx1-x1).^2)*y2(1,1)+2*y2(1,2)*(x1-xx1).*(x2-xx2)+y2(2,2)*(x2-xx2).^2);


