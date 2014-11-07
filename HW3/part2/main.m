%load('walk1.txt','-ASCII');
load('makarena1.txt','-ASCII');
%A = walk1;
A = makarena1;
%  A = [0 0 ;A];

xMean = mean(A,1);
M = A - ones(size(A(:,1)))*xMean;
[U, S, V] = svd(M);
S_Projection = S;
r = 1; %R rank
S_Projection((r+1):end, (r+1):end) = 0;
A_approx = U*S_Projection*V';
A_approx = A_approx + ones(size(A_approx(:,1)))*xMean;


l1=V(2,1);
l2=V(2,2);
l3=-(l1*xMean(1)+l2*xMean(2));
a=-l3/l2;
b=-l1/l2;
f = @(x) b*x+a;


Y = A_approx * V;
plot(Y(:,1),Y(:,2));
%plot3(Y(:,1),Y(:,2),Y(:,3));



