function [ center, radius ] = gaus_newton( points, center, radius )
%% Input
% points - matrix of points [n x 2]
% center - vector of coorinates [1 x 2] of the center of the circle
% radius - is the radius of the circle 
%% Output
% center - vector of coorinates [1 x 2] of the center of the circle
% radius - is the radius of the circle  

%% Initialize everything for iteration
N = size(points, 1);
g = total_dist(points, [center  radius]);
gtd = zeros(3, N);
%% Compute first derivative
for i = 1:N
    gtd(1, i) = (center(1) - points(i, 1)) / ((center(1) - points(i, 1))^2 + (center(2) - points(i, 2))^2) ^ (1/2);
    gtd(2, i) = (center(2) - points(i, 2)) / ((center(1) - points(i, 1))^2 + (center(2) - points(i, 2))^2) ^ (1/2);
    gtd(3, i) = -1;
end
%% Calculate circle params
circle = [center' ; radius] -   (((gtd * gtd') \ gtd)   )   * g' ;
center = circle(1:2)';
radius = circle(3);

end