function priklad4
clf;
M=40; N=20; x1=linspace(0,2*pi,M)'*ones(1,N); x2=ones(M,1)*linspace(0,2*pi,N);
[y1,y2,y3]=F(x1,x2); mesh(y1,y2,y3,'facecolor','w','edgecolor','k');
axis equal; axis vis3d; axis manual; hold on
xx1=3; xx2=.5;
[yy1,yy2,yy3]=F(xx1,xx2); plot3(yy1,yy2,yy3,'ro');
[y1,y2,y3]=T1(xx1,xx2,x1,x2); mesh(y1,y2,y3,'facecolor','w','edgecolor','g');
[y1,y2,y3]=T2(xx1,xx2,x1,x2); mesh(y1,y2,y3,'facecolor','w','edgecolor','b');
return

function [y1,y2,y3]=F(x1,x2)
R=2; r=1;
y1=(R+r*cos(x2)).*cos(x1);
y2=(R+r*cos(x2)).*sin(x1);
y3=r*sin(x2);

function [y1,y2,y3]=T1(xx1,xx2,x1,x2)
R=2; r=1;
y1dx1 = -(R + r * cos(xx2)) * sin(xx1);
y1dx2 = -r * cos(xx1) * sin(xx2);
y2dx1 = (R + r * cos(xx2)) * cos(xx1);
y2dx2 = -r * sin(xx1) * sin(xx2);
y3dx1 = 0;
y3dx2 = r * cos(xx2);
[f1, f2, f3] = F(xx1, xx2);
y1 = f1 + y1dx1*(x1-xx1) + y1dx2*(x2-xx2);
y2 = f2 + y2dx1*(x1-xx1) + y2dx2*(x2-xx2);
y3 = f3 + y3dx1*(x1-xx1) + y3dx2*(x2-xx2);

function [y1,y2,y3]=T2(xx1,xx2,x1,x2)
R=2; r=1;
y1dx = [-cos(xx1)*(R + r*cos(xx2)), r*sin(xx1)*sin(xx2);
    r*sin(xx1)*sin(xx2), -r*cos(xx1)*cos(xx2)];

y2dx = [-sin(xx1)*(R + r*cos(xx2)),-r*cos(xx1)*sin(xx2);
    -r*cos(xx1)*sin(xx2),  -r*cos(xx2)*sin(xx1)];

y3dx = [0,0; 0,  -r*sin(xx2)];
[t1, t2, t3] = T1(xx1, xx2,x1,x2);

y1=  t1+0.5*(((xx1-x1).^2)*y1dx(1,1)+2*y1dx(1,2)*(x1-xx1).*(x2-xx2)+y1dx(2,2)*(x2-xx2).^2);
y2=  t2+0.5*(((xx1-x1).^2)*y2dx(1,1)+2*y2dx(1,2)*(x1-xx1).*(x2-xx2)+y2dx(2,2)*(x2-xx2).^2);
y3=  t3+0.5*(((xx1-x1).^2)*y3dx(1,1)+2*y3dx(1,2)*(x1-xx1).*(x2-xx2)+y3dx(2,2)*(x2-xx2).^2);




