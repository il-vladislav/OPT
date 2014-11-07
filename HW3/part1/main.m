load('data_A.mat');
 %A = [0 0 ;A];
xMean = mean(A);
M = A - ones(size(A(:,1)))*xMean;
[U, S, V] = svd(M);
S_Projection = S;
S_Projection(2:end, 2:end) = 0;
A_approx = U*S_Projection*V';
A_approx = A_approx + ones(size(A_approx(:,1)))*xMean;

l1=V(2,1);
l2=V(2,2);
l3=-(l1*xMean(1)+l2*xMean(2));
a=-l3/l2;
b=-l1/l2;
f = @(x) b*x+a;

figure('Name', 'Aproximace bodu primkou');
plot(A(:,1), A(:,2), '.',  'MarkerSize',15), hold on;
plot(A_approx(:,1), A_approx(:,2), 'r.','MarkerSize',10);
plot(2:1:9, f(2:1:9),'k');
arrayfun(@(i) plot([A(i,1) A_approx(i,1)],[A(i,2) A_approx(i,2)],'k:'), 1:size(A,1));
arrayfun(@(i) plot([A(i,1) A_approx(i,1)],[A(i,2) A_approx(i,2)],'k:'), 1:size(A,1));
legend('Given input', 'Perpendicular projection on TLS approximation', 'Total least squares approximation', 'Perpendicular', 2);
axis equal;


x = V(2,:);
y0 = A_approx(1,:);
s = V(1,:);
alpha = -l3;
error = norm(A_approx-A).^2;

% 
% f = @(t) plot((y0(1)+t*s(1)), y0(2) + t*s(2),'k.');
% f(-2:0.001:10)
