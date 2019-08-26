% Alberto Pizano
% ECE448
% Lab 1

clc
clear

% PART2

v = 0.8; % variance
m = 1.0; % mean
x = sqrt(v)*randn(1,50)+m*ones(1,50); % Gaussian distrubution

% Find max via for loop
xmax = 0;
for k = 1:length(x)
    if x(k) > xmax
        xmax = x(k);
    end
end

fprintf('xmax is: %.4f', xmax)