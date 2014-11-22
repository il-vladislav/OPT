function [ d ] = total_dist( points, circle )


get_dist = @(i) dist([points(i,1) points(i,2)], circle);

d = (arrayfun(get_dist, 1:size(points, 1)));

end

