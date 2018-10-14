function plotmag(A, B)

freqpts = 0:0.005:1; 
freqpts = (100.^freqpts)./10; 
H=freqs(B,A,freqpts); 
H_db= 20.0*log10(abs(H)+eps); 
semilogx(freqpts, H_db),grid on, 

end