function d = dist(a, x)
%% Input
% a - is a vector [2 x 1] = [x1 x2]. Represent the coordinates of 1 point
% x - is a vector [3 x 1] = [x1 x2 r]. Represent the coorinates and the radius of the circle
%% Output
% d - is a scalar. Represent signed distance
d = sqrt((a(1) - x(1)).^2 + (a(2) - x(2)).^2) - x(3);
end

