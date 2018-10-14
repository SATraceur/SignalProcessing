function biplot1(N) 
% N is the order of the Butterworth lowpass filter
[biquad, firstorder] = biquad1(N); 
[br, bc] = size(biquad); 
if isempty(firstorder), fo = 0; 
else fo = 1; 
end 
freqpts = 0:0.005:1; 
for k=1:length(freqpts), freqpts(k) = 100^(freqpts(k))./10;end 
flen = length(freqpts); 
H = zeros(br+fo, flen); 
for k =1:br, 
   H(k, :) = freqs(1,biquad(k, :),freqpts); 
end 
if ~isempty(firstorder), 
   H(br+1, :) = freqs(1,firstorder,freqpts); 
end 
if ((br+fo)>1), H = [H; prod(H)]; end 
H_db= 20.0*log10(abs(H)+eps); 
semilogx(freqpts, H_db),grid on, 
ylabel('dB'),xlabel('Normalized frequency'), 
title([num2str(N), '-order Butterworth lowpass filter']) 