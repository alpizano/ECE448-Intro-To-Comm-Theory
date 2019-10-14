clc;
clear;

%% Task 2, script

%echo on
ts =0.001; % sample period
fs =1/ts;
t = [0:ts:10]; %time variable
x=0.8*cos(2*pi*200*t)+1.2*cos(2*pi*300*t); % signal with two frequencies
pwr = sum(x.*x)/length(t) %average power in signal
xd = fft(x,1024); %discrete transform
psd = ts*abs(xd).^2; %power spectral density
[b,a] = butter(4,300/500); %300 Hz cut-off, & returns b and a coefficients for H(z)
[h,w] = freqz(b,a,512); %provides complex frequency response from coefficients
h2 = abs(h).^2; %transfer function squared
f = w*500/pi; %converts normalized angular frequency to frequency
pxsd = psd(1:512); %positive frequency portion of power spectral density
%pause %Press key to see power spectral density of signal
figure(1);
plot(f,pxsd);
xlabel('frequency');
ylabel('PSD')
%pause %Press key to see filter response
figure(2);
plot(f,abs(h));
xlabel('frequency');
ylabel('|H(f)| Filter')
popsd = pxsd.*h2';
%pause %Press key to see output psd
figure(3);
plot(f,popsd);
xlabel('frequency');
ylabel('PSD Filter Output')

%% Task 2, part 2
% 8th order Butterworth with a cutoff of 100Hz

%echo on
ts = 0.001; 
fs = 1/ts;
t = [0:ts:10]; 
x = 0.8*cos(2*pi*200*t)+1.2*cos(2*pi*300*t); 
pwr = sum(x.*x)/length(t) 
xd = fft(x,1024);
psd = ts*abs(xd).^2; 
[b,a] = butter(8,100/500) 
[h,w] = freqz(b,a,512); 
h2 = abs(h).^2;
f = w*500/pi; 
pxsd = psd(1:512);
%pause 
figure(4)
plot(f,pxsd);xlabel('frequency');
ylabel('PSD')
%pause
figure(5)
plot(f,abs(h));
xlabel('frequency');
ylabel('|H(f)| Filter')
popsd = pxsd.*h2';
%pause
figure(6)
plot(f,popsd);
xlabel('frequency');
ylabel('PSD Filter Output')

%% Task 2, part 3
% 50 and 100Hz signal considering 8th order Butterworth with a cutoff of 100Hz

%echo on
ts = 0.001;
fs = 1/ts;
t = [0:ts:10]; 
x = 0.8*cos(2*pi*50*t) + 1.2 * cos(2*pi*100*t);
pwr = sum (x .*x)/length(t);    
xd = fft(x,1024);   
psd = ts*abs(xd).^2;    
[b,a] = butter(8,100/500);  
[h,w] = freqz(b,a,512);     
h2 = abs(h).^2;    
f = w*500/pi;       
pxsd = psd(1:512);    
%pause               
figure(7)
plot(f,pxsd);
xlabel('frequency');
ylabel('PSD');
%pause
figure(8);
plot(f,abs(h));
xlabel('frequency');
ylabel('|H(f)| Filter');
popsd = pxsd.*h2';
%pause                   
figure(9)
plot(f,popsd)
xlabel('frequency');
ylabel('PSD Filter Output');