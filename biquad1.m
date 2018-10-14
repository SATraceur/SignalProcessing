function [biquad, firstorder] = biquad1(N) 
[Z,P,K]=butter(N,1,'s'); 
lenp = length(P); 
if (odd(lenp)), m=(lenp - 1)./2; else m = lenp./2; end 
disp('First- and second-order factors of the Butterworth transfer function:') 
firstorder = []; 
if odd(lenp), 
  disp(sprintf('1/(s + %6.4f)', -P(lenp))); 
  firstorder = [1 -P(lenp)]; 
end 
biquad = zeros(m, 3); 
for k = 1:m, 
   biquad(k, :) = conv([1 -P(2*k-1)], [1 -P(2*k)]); 
   disp(sprintf('1/(%6.4fs^2 + %6.4fs + %6.4f)', biquad(k,:))); 
end