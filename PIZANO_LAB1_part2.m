% Alberto Pizano
% ECE448
% Lab 1

clc
clear

% PART2
v = 0.8; % variance
m = 1.0; % mean
x = sqrt(v)*randn(1,50)+m*ones(1,50); % Gaussian distrubution

% Find max with for loop
xmax = 0;
for k = 1:length(x)
    if x(k) > xmax
        xmax = x(k);
    end
end

fprintf('xmax is: %.4f', xmax)

% FIGURE(1)
figure(1)
% How do we know second parameter of histogram?
histogram(x,50)
xlabel('x');
%ylabel('');
title('Histogram of Random Variable x');

% Find random variable values < 0 with for loop
valsArr = [];
count = 0;
for k = 1:length(x)
    if x(k) < 0
        valsArr = [valsArr, x(k)];
        count = count + 1;
    end
end

valsArr
fprintf('They are %d random # values less than 0 \n',count)

% FIGURE(2)
t1 = -10:0.1:10;
g1 = 4*sinc(t1-3);
figure(2)
plot(t1,g1)
grid on;
xlabel('t_1');
ylabel('g_1(t1)');
title('Signal g_1(t_1)=4sinc(t_1-3)');

% FIGURE(3)
t2 = 0:0.01:5;
% Unit step library?
g2 = 5*exp(-t2/3);
figure(3)
plot(t2,g2)
grid on;
xlabel('t_2');
ylabel('g_2(t2)');
title('Signal g_2(t_2)=5exp(-t_2/3)u(t_2)');

% The signal energy of a signal:
% E = integral from 0 to inf, abs(x(t)^2dt
g2_energy = @(t2) abs(5*exp(-t2/3)).^2;
g2_energy = integral(g2_energy,0,Inf)

% FIGURE(4)
t3 = 0:0.01:2*pi;
% Unit step library?
g3 = exp(-t3).*sin(6*pi*t3);
figure(4)
plot(t3,g3)
grid on;
xlabel('t_3');
ylabel('g_3(t_3)');
title('Signal g_3(t_3)=exp(-t_3)sin(6\pit_3)');

% The signal energy in the signal x(t) is:
% E = integral from -Inf to Inf, abs(x(t)^2dt
g3_energy = @(t3) abs(exp(-t3).*sin(6*pi*t3)).^2;
g3_energy = integral(g3_energy,-Inf,Inf)

% FIGURE(5)
t4 = 0:0.01:2*pi;
g3 = sin(6*pi*t4);
figure(5)
plot(t4,g3)
grid on;
xlabel('t_4');
ylabel('g_3(t_4)');
title('Signal g_3(t_4)=sin(6\pit_4)');

% The signal power in the signal x(t) is:
% P = lim T -> Inf, 1/2T * integral -T to T, abs(x(t))^2dt
% or P = 1/T0, integral -T0/2 to T0/2 abs(x(t))^2dt
% Period is 2pi/B, or 2pi/6pi
g3_energy = @(t4) abs(sin(6*pi*t4)).^2;
g3_power = 1/(1/3)*integral(g3_energy,(-1/3)/2,(1/3)/2)





