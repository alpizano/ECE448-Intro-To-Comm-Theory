% Alberto Pizano
% ECE448
% Lab 1

clc
clear

rand(3)
rand(1,3)
rand(1,4)

% PART1
v = 25;
m = 10;
x = sqrt(v) * randn(1,1000)+m*ones(1,1000);
figure(1)
stem(x)
grid on;
xlabel('sample index');
ylabel('amplitude');
title('generation of Gaussian random variables');

%%

figure(2);
histogram(x,20);
xlabel('amplitude');
ylabel('number of points');
title('number of points at varied amplitudes');

%%
x1 = 0:0.2:5;
g1 = exp(-x1).*sin(x1.^2);
figure(3)
plot(x1,g1) % continues
hold all
stem(x1,g1) % discrete
grid on;
xlabel('x_1');
ylabel('g_1(x_1)');
title('Continous & Discrete Plots');


x2 = -10:0.1:10;
g2 = sinc(x2);
figure(4)
plot(x2,g2) % continues
hold all
stem(x2,g2) % discrete
grid on;
xlabel('x_2');
ylabel('g_2(x_2)');
title('Continous & Discrete Plots');

%%



