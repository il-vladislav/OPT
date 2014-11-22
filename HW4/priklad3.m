function priklad3
clf;
N=40; x1=linspace(-2,2,N)'*ones(1,N); x2=x1';
mesh(x1,x2,F(x1,x2),'facecolor','w','edgecolor','k');
axis equal; axis vis3d; axis manual; hold on
xx1=-.2; xx2=-.3;
plot3(xx1,xx2,F(xx1,xx2),'ro')

mesh(x1,x2,T1(xx1,xx2,x1,x2),'facecolor','w','edgecolor','g');
mesh(x1,x2,T2(xx1,xx2,x1,x2),'facecolor','w','edgecolor','b');
hold on
return

function y=F(x1,x2)
y=2*exp(-x1.^2-x2.^2);

function y=T1(xx1,xx2,x1,x2)
dy = [-4*xx1*exp(- xx1^2 - xx2^2); -4*xx2*exp(- xx1^2 - xx2^2)];
y = F(xx1, xx2)+dy(1,:) * (x1-xx1) + dy(2,:) * (x2-xx2);

function y=T2(xx1,xx2,x1,x2)
dy = [8*xx1^2*exp(- xx1^2 - xx2^2) - 4*exp(- xx1^2 - xx2^2),   8*xx1*xx2*exp(- xx1^2 - xx2^2);
    8*xx1*xx2*exp(- xx1^2 - xx2^2),    8*xx2^2*exp(- xx1^2 - xx2^2) - 4*exp(- xx1^2 - xx2^2)];
y =  T1(xx1,xx2,x1,x2)+0.5*(((xx1-x1).^2)*dy(1,1)+2*dy(1,2)*(x1-xx1).*(x2-xx2)+dy(2,2)*(x2-xx2).^2);
 

