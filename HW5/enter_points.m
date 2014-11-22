function  enter_points()
% Generates dataset interacting via HUD

%% Init GUI
axis([-5 5 -5 5]);
hold on;


%% Dynamic. Press 'e' to exit
% key = 0;
% while key ~= 'e',
%     [X Y key] = ginput(1);
%     plot(X,Y,'o');
% end


%% Static
[X, Y] = ginput;
plot(X,Y,'ro');

%% Save generated data
save('points.mat', 'X', 'Y');
end

