function xover1(N) 
% N is the order of the Butterworth filters

freqpts = 0:0.005:1; 
for k=1:length(freqpts), freqpts(k) = 100^(freqpts(k))./10; end 

%Butterworth lowpass filter
[B,A]=butter(N,1,'s'); 
H_low=freqs(B,A,freqpts); 
H_low_db= 20.0*log10(abs(H_low)+eps); 

%Butterworth highpass filter
[B,A]=butter(N,1,'high','s'); 
H_high=freqs(B,A,freqpts); 
H_high_db= 20.0*log10(abs(H_high)+eps); 

%Crossover 
H_crossover=H_low+H_high; 
H_crossover_db= 20.0*log10(abs(H_crossover)+eps); 
semilogx(freqpts, [H_low_db', H_high_db', H_crossover_db']),grid on, 
ylabel('dB'),xlabel('Normalized frequency'), 
title('Crossover') , 
axis([0.1 10 -40 5]) 