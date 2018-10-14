function xover2(w,N) 
% N is the order of the Butterworth filters

freqpts = 0:0.005:1; 
for k=1:length(freqpts), freqpts(k) = 100^(freqpts(k))./10;end 

%Butterworth lowpass filter
[B,A]=butter(N,w(1),'s'); 
H_low=freqs(B,A,freqpts); 
H_low_db= 20.0*log10(abs(H_low)+eps); 

%Butterworth highpass filter
[B,A]=butter(N,w(2),'high','s'); 
H_high=freqs(B,A,freqpts); 
H_high_db= 20.0*log10(abs(H_high)+eps); 

%Crossover 
H_crossover=H_low+H_high; 
H_crossover_db= 20.0*log10(abs(H_crossover)+eps); 
plus_db = max(H_crossover_db); 
minus_db = min(H_crossover_db); 
disp(sprintf('Frequency response = +%5.3fdB, %5.3fdB', plus_db, minus_db));
%disp(sprintf('Difference = +%5.3fdB', plus_db - minus_db));

semilogx(freqpts, [H_low_db', H_high_db', H_crossover_db']),grid on, 
ylabel('dB'),xlabel('Normalized frequency'), 
title('Crossover') , 
axis([0.1 10 -40 5]) 