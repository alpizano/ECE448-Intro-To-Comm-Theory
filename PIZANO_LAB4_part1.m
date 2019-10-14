clc;
clear;

%% Task 1, part 1
Ts = 0.001;
t = 0:Ts:1;
g = 5*sin(2*pi*t);
N = length(g);
figure(1);
plot(t,g);       
ylabel('g');     
xlabel('time');     
title('sinusoid plot'); 

%% Task 1, part 2
Gf = fft(g);
Ps = (1/N)*sum(g.^2)
Pf = (Ts/N)*sum(Gf.^2)

%% Task 1, part 3
delta_f = 1/(N*Ts);          
k = -(N-1)/2:(N-1)/2;       
f = k*delta_f;
G = (Ts/N)*fftshift(abs(Gf).^2);
figure(2)
stem(f,G);      
ylabel('average power of sinusoid');  
xlabel('frequency');
xlim([-20 20]);