function priklad6
clf;

M=40; N=20; x1=linspace(0,2*pi,M)'*ones(1,N); x2=ones(M,1)*linspace(0,2*pi,N);
[y1,y2,y3]=F(x1,x2); mesh(y1,y2,y3,'facecolor','w','edgecolor','y');
axis equal; axis vis3d; axis manual; hold on

x=linspace(0,2*pi,1000);
u=G(x); [y1,y2,y3]=F(u(1,:),u(2,:)); plot3(y1,y2,y3,'k');

xx=1;
uu=G(xx); [yy1,yy2,yy3]=F(uu(1,:),uu(2,:)); plot3(yy1,yy2,yy3,'ro');

[y1,y2,y3]=T1(xx,x); plot3(y1,y2,y3,'g');
return

% zobrazeni z prikladu 2
function y=G(x)
y=[cos(x);sin(2*x)];

% zobrazeni z prikladu 4
function [y1,y2,y3]=F(x1,x2)
R=2; r=1;
y1=(R+r*cos(x2)).*cos(x1);
y2=(R+r*cos(x2)).*sin(x1);
y3=r*sin(x2);

function [y1,y2,y3]=T1(xx,x)
R=2; r=1;
uu=G(xx);

[y11,y22,y33]=F(uu(1),uu(2));
y1dx=[(-sin(uu(1))*(R + r*cos(uu(2)))); -r*cos(uu(1))*sin(uu(2))] ;
y2dx=[ cos(uu(1))*(R + r*cos(uu(2))); -r*sin(uu(1))*sin(uu(2))] ;
y3dx=[0;r*cos(uu(2))];

y1=y11+y1dx'*[(-sin(xx));2*cos(2*xx)]*(x-xx);
y2=y22+y2dx'*[(-sin(xx));2*cos(2*xx)]*(x-xx);
y3=y33+y3dx'*[(-sin(xx));2*cos(2*xx)]*(x-xx);