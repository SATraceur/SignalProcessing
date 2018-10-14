%% Part 1

[B,A]=butter(3,1,'s') 

freqpts = 0:0.005:1; 
freqpts = (100.^freqpts)./10; 
H=freqs(B,A,freqpts); 
H_db= 20.0*log10(abs(H)+eps); 
semilogx(freqpts, H_db),grid on, 
ylabel('dB'),xlabel('Normalized frequency'), 
title('3rd order Butterworth lowpass filter') 
H_phase = phase(H).*180./pi; 
semilogx(freqpts, H_phase), grid on, 
ylabel('degree'),xlabel('Normalized frequency'), 
title('3rd order Butterworth lowpass filter') 

%% Part 2

[B,A]=butter(5,1,'s') 

freqpts = 0:0.005:1; 
freqpts = (100.^freqpts)./10; 
H=freqs(B,A,freqpts); 
H_db= 20.0*log10(abs(H)+eps); 
semilogx(freqpts, H_db),grid on, 
ylabel('dB'),xlabel('Normalized frequency'), 
title('5th order Butterworth lowpass filter') 

%%

H_phase = phase(H).*180./pi; 
semilogx(freqpts, H_phase), grid on, 
ylabel('degree'),xlabel('Normalized frequency'), 
title('5th order Butterworth lowpass filter') 

%% Part 3 Chebychev 3rd order 
[B,A]=cheby1(3, 2, 1, 's') 

plotmag(A, B)
ylabel('degree'),xlabel('Normalized frequency'), 
title('3rd order chebyshev') 

%%

H_phase = phase(H).*180./pi; 
semilogx(freqpts, H_phase), grid on, 
ylabel('degree'),xlabel('Normalized frequency'), 
title('3rd order chebyshev') 

%% Chebychev 4th order 3db ripple

[B,A]=cheby1(4, 3, 1, 's') 

freqpts = 0:0.005:1; 
freqpts = (100.^freqpts)./10; 
H=freqs(B,A,freqpts); 
H_db= 20.0*log10(abs(H)+eps); 
semilogx(freqpts, H_db),grid on, 
ylabel('degree'),xlabel('Normalized frequency'), 
title('4th order Chebyshev 3dB ripple') 
max(H_db)
min(H_db)

%%

H_phase = phase(H).*180./pi; 
semilogx(freqpts, H_phase), grid on, 
ylabel('degree'),xlabel('Normalized frequency'), 
title('4th order Chebyshev 3dB ripple') 


%% Chebychev 5th order 3db ripple

[B,A]=cheby1(5, 3, 1, 's') 

freqpts = 0:0.005:1; 
freqpts = (100.^freqpts)./10; 
H=freqs(B,A,freqpts); 
H_db= 20.0*log10(abs(H)+eps); 
semilogx(freqpts, H_db),grid on, 
ylabel('degree'),xlabel('Normalized frequency'), 
title('5th order Chebyshev 3dB ripple') 

H_phase = phase(H).*180./pi; 
semilogx(freqpts, H_phase), grid on, 
ylabel('degree'),xlabel('Normalized frequency'), 
title('5th order Chebyshev 3dB ripple') 



%% Chebychev 4th order 5db ripple

[B,A]=cheby1(4, 5, 1, 's') 

plotmag(A, B)
ylabel('degree'),xlabel('Normalized frequency'), 
title('4th order chebyshev') 

%%

H_phase = phase(H).*180./pi; 
semilogx(freqpts, H_phase), grid on, 
ylabel('degree'),xlabel('Normalized frequency'), 
title('4th order chebyshev') 


%% Chebychev 5th order 5db ripple

[B,A]=cheby1(5, 5, 1, 's') 

freqpts = 0:0.005:1; 
freqpts = (100.^freqpts)./10; 
H=freqs(B,A,freqpts); 
H_db= 20.0*log10(abs(H)+eps); 
semilogx(freqpts, H_db),grid on, 
ylabel('degree'),xlabel('Normalized frequency'), 
title('5th order Chebyshev 5dB ripple') 

H_phase = phase(H).*180./pi; 
semilogx(freqpts, H_phase), grid on, 
ylabel('degree'),xlabel('Normalized frequency'), 
title('5th order Chebyshev 5dB ripple') 
