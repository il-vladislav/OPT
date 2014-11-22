 
for O = 3:3
    if (O==1)
        X = [0];
        Y = [0];
    elseif (O == 2)
        X = [-1 1]';
        Y = [0 0]';
    else
        load('my_data2.mat');
    end
    disp(O)
    a = 1;
    b = 1;
    range = -5.5:0.01:-2;
    
    s = size(range, 2);
    c = ones(s, s);

    for x = range
    a = 1;
    disp(x)
    for y = range
        c(a,b) = dist([X Y], [x y 1]).^2;
    a = a + 1;
    end
    b = b + 1;
    end
    close all
    hFig = figure(1);
    set(hFig, 'Position', [1 1 1024 1024])
    axis auto
    mesh(range, range, c);
    hold on
    contour (range, range, c, 100);
    contour3(range, range, c, 5,  'LineWidth',0.01, 'Color','b');
    hold off
    if (O == 1)
        print -depsc 1point_mesh_close.eps
        print -dpng 1point_mesh_close.png
    elseif (O == 2)
        print -depsc 2point_mesh_close.eps
        print -dpng 2point_mesh_close.png
    else
        print -depsc 9688point_mesh_close.eps
        print -dpng 9688point_mesh_close.png
    end
    close all
    
    hFig = figure(1);
    set(hFig, 'Position', [1 1 1024 1024])
    axis auto
    contour (range, range, c, 500);
    
    if (O == 1)
        print -depsc 1point_contour_close.eps
        print -dpng 1point_contour_close.png
    elseif (O == 2)
        print -depsc 2point_contour_close.eps
        print -dpng 2point_contour_close.png
    else
        print -depsc 9688point_contour_close.eps
        print -dpng 9688point_contour_close.png
    end
    close all
    
   
    
    
    
end

