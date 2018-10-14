figure(1) 
nvec = -25:25; 
b = .3*sinc(.3*nvec); 
H = freqz(b,1,512); 
w = linspace(0,pi,513); 
w = w(1:512); 
plot(w,abs(H)) 
axis([0 pi 0 1.2]) 
title 'FIR Lowpass Filter'
xlabel '\omega rad/s'
ylabel 'magnitude'

hold on 
bham = b.*hamming(51)'; 
Hham = freqz(bham,1,512); 
plot(w,abs(Hham),'--') 
bham = b.*blackman(51)'; 
Hham = freqz(bham,1,512); 
plot(w,abs(Hham),'--') 
bham = b.*hann(51)'; 
Hham = freqz(bham,1,512); 
plot(w,abs(Hham),'--') 
hold off 
legend ('truncated h[n]','Hamming windowed h[n]','Blackman windowed h[n]','Hann windowed h[n]')