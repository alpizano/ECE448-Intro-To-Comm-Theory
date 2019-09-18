% Alberto Pizano
% ECE448
% Lab2 Part 1
% 9/8/2019

clc
clear all
close all

% TASK I PROCEDURE
% import definitions (used to calculate variables below):
% N       = length(g)
% k       = 0:(N/2 -1) , frequency index 
% delta_f = 1/N*delta_t , frequency seperation
% f       = k * delta_f
% T       = N * delta_t

% Rectangular function generation
sig = ones(1,100); % t = pulse width = 100
trail = zeros(1,100);
precede = zeros(1,100);
g = [precede sig trail];

% Number of points in g(t)
N = length(g); % length is 300

% Fourier transform of g(t)
z = fft(g);
figure(1)
stem(0:(N/2-1),abs(z(1:N/2)));
xlabel('Index number k');
ylabel('fft(g)');
title('Fast Fourier Transform of signal g(t)');

%% 
% Modify program so that points in the pulse are separated by ?t=0.1ms 

% Rectangular function generation
sig = ones(1,100); % t = pulse width = 0.1ms
trail = zeros(1,100);
precede = zeros(1,100);
g = [precede sig trail];

% Number of points in g(t)
N = length(g); % length is 300

% Fourier transform of g(t)
z = fft(g)*0.1e-3; % Multiply times 0.1ms = 1000s pulse are seperated
figure(2)
stem((0:149/(2-1))*(1/(N*0.1e-3)),abs(z(1:N/2))); % Had to fix length of x to 0:149 else error for length mismatch
xlabel('Frequency');
ylabel('fft(g)');
title('Fast Fourier Transform of signal g(t)');

%%
% Modify program so that precede and trail zeros are 450 each while maintaining a separation of 0.1ms 

% Rectangular function generation
sig = ones(1,100); % t = pulse width = 0.1ms
trail = zeros(1,450); % change zeros to 450
precede = zeros(1,450); % change zeros to 450
g = [precede sig trail];

% Number of points in g(t)
N = length(g); % length is 1000

% To determine the period of T
T = N*1000

% Fourier transform of g(t)
z = fft(g)*0.1e-3; % Multiply times 0.1ms = 1000s pulse are seperated
figure(3)
stem((0:149/(2-1))*(1/(N*0.1e-3)),abs(z(1:150))); % Had to fix length of y to 0:149 else error for length mismatch
xlabel('Frequency');
ylabel('fft(g)');
title('Fast Fourier Transform of signal g(t)');