function biplot2(N, R) 
% N is the order of the Chebyshev filter 
% R is the size of ripple in dB
[biquad, firstorder, K] = biquad2(N, R); 
[br, bc] = size(biquad); 
if isempty(firstorder), fo = 0; else fo = 1; end 
freqpts = 0:0.005:1; 
for k=1:length(freqpts), freqpts(k) = 100^(freqpts(k))./10;end 
flen = length(freqpts); 
H = zeros(br+fo, flen); 
for k =1:br,  H(k, :) = freqs(1,biquad(k, :),freqpts); end 
if ~isempty(firstorder),  H(br+1, :) = freqs(1,firstorder,freqpts); end 
if ((br+fo)>1), H = [H; prod(H).*K]; else H = H.*K; end 
H_db= 20.0*log10(abs(H)+eps); 
semilogx(freqpts, H_db),grid on, 
ylabel('dB'),xlabel('Normalized frequency'), 
title([num2str(N), '-order Chebyshev lowpass filter']) 