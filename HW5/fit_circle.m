function x = fit_circle( method )
%% Input
% method - define method of approximation. Default is Gauss-Newton
% Values are: 'GN' - Gauss-Newton, 'LM' - Levenber-Marquard
%% Output
% x - is a vector [1 x 3], x = [x y r], represents the coordinates and the center of the circle

%% Input
if exist('method','var')
else
    method = 'GN';
end
load('points.mat');

%% GUI init
hFig = figure(1);
set(hFig, 'Position', [1 1 1024 1024])
axis auto
hold on

%% Data draw
plot(X,Y,'yo');

%% Get initial guess of cirlce params
[X1, Y1] = ginput(2);
x1 = X1(1);
y1 = Y1(1);
r = sqrt((x1 - X1(2)).^2 + (y1 - Y1(2)).^2);

%% Draw the circle
circle(x1,y1,r);

%% Iteration init
u = 1000;
[~, ~, key] = ginput(1);

while ~isempty(key)
    
    % objective function
    g = sum(total_dist([X Y], [x1 y1 r ]));
    disp(['Error: ' num2str(g)]);
    
    % Iterate
    if (key == 32)
        % Approximation function iteration
        if (strcmp(method,'GN'))
            [x, r] = gaus_newton([X Y], [x1 y1], r);
        else
            [x, r, u] = levenberg_marquard([X Y], [x1 y1], r, u);
        end
        x1 = x(1);
        y1 = x(2);
        
        % GUI output
        clf
        hold on
        circle(x1,y1,r);
        plot(X,Y,'yo');
    end
    [~, ~, key] = ginput(1);
end

%% Output
x = [x1 y1 r];
end