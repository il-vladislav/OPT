function [ center, radius, u] = levenberg_marquard( points, center, radius, u)
%% Input
% points - matrix of points [n x 2]
% center - vector of coorinates [1 x 2] of the center of a circle
% radius - scalar 
% u - damping parameter
%% Output
% center - vector of coorinates [1 x 2] of the center of a circle
% radius - scalar
% u - damping parameter

%% Back up circle params
old_center = center;
old_radius = radius;

%% Initialize everething for iteration
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
circle = [center' ; radius] -   ((((gtd * gtd')  +  u * eye(3)  ) \ gtd)  )   * g' ;
center = circle(1:2)';
radius = circle(3);

%% Use new params if converge, decrease damping parameter
if (sum((total_dist(points, [center  radius])).^2) <= sum(abs(g))^2)
    u = u / 10;
else
    %% Increase damping parameter and rollback otherwise
    center = old_center;
    radius = old_radius;
    u = u * 10;
end
end