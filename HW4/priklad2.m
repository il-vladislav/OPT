function priklad2
clf;
x=linspace(0,2*pi,1000);
y=F(x); plot(y(1,:),y(2,:),'k'); 
axis equal; axis manual; hold on
xx=1;
yy=F(xx); plot(yy(1,:),yy(2,:),'ro'); 
y=T1(xx,x); plot(y(1,:),y(2,:),'g'); 
y=T2(xx,x); plot(y(1,:),y(2,:),'b'); 
return

function y=F(x)
y=[cos(x);sin(2*x)];

function y=T1(xx,x)
dydx = [-sin(xx); 2*cos(2*xx)];
Fx = F(xx);
y=[Fx(1,:)+dydx(1,:).*(x-xx);Fx(2,:)+dydx(2,:).*(x-xx)];

function y=T2(xx,x)
dydx2 = [ -cos(xx); -4*sin(2*xx)];
T1x = T1(xx,x);
y=[T1x(1,:)+dydx2(1,:).*(x-xx).^2/2; T1x(2,:)+dydx2(2,:).*(x-xx).^2/2];

