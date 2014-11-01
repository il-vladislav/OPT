%% 3.i solve_ls function
function x = solve_ls(  A, b )
    % size
    s = size(A, 2);
    
    % QR Decomposition
    [Q, R] = qr(A, 0);  
    
    % Least squares
    bq = Q' * b;
    x = zeros(s, 1);
    for i = s:-1:1
        x(i) = (bq(i) - (R(i,:) * x)) / R(i, i);
    end
end

