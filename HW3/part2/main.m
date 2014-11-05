load('walk1.txt','-ASCII');
%  A = [0 0 ;A];
xMean = mean(A);
M = A - ones(size(A(:,1)))*xMean;
[U, S, V] = svd(M);
S_Projection = S;
d = 15;
S_Projection((d+1):end, (d+1):end) = 0;
A_Projection = U*S_Projection*V;
A_Projection = A_Projection + ones(size(A_Projection(:,1)))*xMean;

l1=V(2,1);
l2=V(2,2);
l3=-(l1*xMean(1)+l2*xMean(2));
a=-l3/l2;
b=-l1/l2;
f = @(x) b*x+a;

figure('Name', 'Aproximace bodu primkou');
plot(A(:,1), A(:,2), '.',  'MarkerSize',15), hold on;
plot(A_Projection(:,1), A_Projection(:,2), 'r.','MarkerSize',10);
plot(-2:12:10, f(-2:12:10),'k');.0
arrayfun(@(i) plot([A(i,1) A_Projection(i,1)],[A(i,2) A_Projection(i,2)],'k:'), 1:size(A,1));
arrayfun(@(i) plot([A(i,1) A_Projection(i,1)],[A(i,2) A_Projection(i,2)],'k:'), 1:size(A,1));
legend('Given input', 'Perpendicular projection on TLS approximation', 'Total least squares approximation', 'Perpendicular', 2);
axis equal;


x = V(2,:);
y0 = A_Projection(1,:);
s = V(1,:);
alpha = -l3;
error = norm(A_Projection-A).^2;


f = @(t) plot((y0(1)+t*s(1)), y0(2) + t*s(2),'k.');
f(-2:0.001:10);
