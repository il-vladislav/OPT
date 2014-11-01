%% 1.i Load data
[y,Fs]=audioread('gong.wav');

% legacy
%[y,Fs]=wavread('gong.wav');

p = 300;
T = size(y, 1)-1;
% close all

%% 2.i 'M' and 'b' representation
b = y(p+1:T+1);

% get_y = @(j) y(p-j+1:T-j+1);
% M = ones(T-p+1, p+1);
% M(:, 2:p+1) = cell2mat(arrayfun(get_y, 1:p, 'UniformOutput', false));

M = ones(T-p+1,p+1);
for j=1:p
    M(:,j+1) = y(p-j+1 : T-j+1);
end;

a = M \ b;

%% 2.ii Distance min ||Ma-b||^2
dist = norm(M*a-b).^2;
Output2ii = ['Value of min ||Ma - b||^2 = ' , num2str(dist)];
disp(Output2ii);

%% 3.i solve_ls function
x = solve_ls(M, b);

%% 3.ii Distance between my solution and QR solution
eu_dist = norm(a - x);
Output3ii = ['Distance between a1 and a2 => ||a1 - a2|| = ' , num2str(eu_dist)];
disp(Output3ii);

%% 4.i Synthetic sound and graphic output

% Synthetic sound
r_lin = zeros(T, 1);
r_lin(1:p) = y(1:p);

for t = (p+1):T
    r_lin(t) = a(1);
    for i=2:p+1
        r_lin(t) = r_lin(t) + a(i) * r_lin(t-i+1);
    end
end


r_qr = zeros(T, 1);
r_qr(1:p) = y(1:p);

for t = (p+1):T
    r_qr(t) = a(1);
    for i=2:p+1
        r_qr(t) = r_qr(t) + a(i) * r_qr(t-i+1);
    end
end

% Graph
% plot(y,'b')
% hold on
% plot(r_ab,'r')
% legend('Original original','Synthetic sound');


plot(y,'b')
hold on
plot(r_qr,'r')
legend('Original original','Synthetic sound');

% Sound
% sound(r_qr, Fs)
% audiowrite(r_qr, Fs, 'sound_syn.wav')