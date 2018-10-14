%% 
plot(impseq(50,10,90))
title '\delta[n-50]'

%%
plot(stepseq(5,-10,30))
title 'u(n-5]'

%%

n = [-10:100];
x = (2.*impseq(0,-10,100)) + (3.*stepseq(5,-10,100)) + (0.5.*exp((0.1+0.3*j).*n).*(stepseq(0,-10,100)));

figure
subplot(2,1,1)
plot(n,abs(x))
title 'Magnitude Response'
subplot(2,1,2)
plot(n, phase(x))
title 'Phase Response'

%%
x = [3 11 7 0 -1 4 2];
h = [2 3 0 -5 2 1];
nx = [-3:3];
nh = [-1:4];
nyb = nx(1) + nh(1);
nye= nx(length(x)) + nh(length(h));
ny = [nyb:nye];
y = conv(x,h)
figure(1)
subplot(3,1,1)
stem(nx,x);
title('x[n]')
subplot(3,1,2)
stem(nh,h);title('h[n]');
subplot(3,1,3)
stem(ny,y);
title('y[n]=x[n]*h[n]')

%%

y = [6 17 34 43 38 24]; ny = [0:5];  
x = [2 3 4];            nx = [-1:1];  
% nx = [a:b] , nh = [c:d] , ny = [a+c:b+d]
% Therefore c = 1, d = 4
nh = [1:4];
[h, R] = deconv(y,x)
figure 
subplot(3,1,1) 
stem(nx,x);title('x[n]'); 
subplot(3,1,2) 
stem(nh,h);title('h[n]');
subplot(3,1,3) 
stem(ny,y);title('y[n]=x[n]*h[n]'); 

%%

x1 = [4 9 10 8 7]; nx1=[-2:2];
x2 = [5 2 3 1 6];  nx2=[-4:0];  
nx3b = nx1(1)+ nx2(1); 
nx3e = nx1(length(x1)) + nx2(length(x2)); 
nx3=[nx3b:nx3e] 
x3=conv(x1,x2) 
figure
stem(nx3,x3);
title('x_3[n]') 
xlabel 'n'

%%
b = [1, 2]; 
a = [1, -0.4, 0.16]; 
x = [1, zeros(1,9)];  
y = filter(b,a,x)

%%

% Partial Fraction Expansion
B = [7.7, -3.25]; 
A = [1, -0.8, 0.15];
[R,P,K] = residuez(B,A);
% Inverse Z-transform
x = [1, zeros(1,9)]; 
denominator1 = [1, -P(1)]; 
denominator2 = [1, -P(2)];
numerator1 = [R(1)]; 
numerator2 = [R(2)]; 
h1 = filter(numerator1,denominator1,x);
h2 = filter(numerator2,denominator2,x);
% Plot
stem(0:9, h1+h2)

%%

B = [1, 1];
A = [1, -1, 0.5];
figure, zplane(B,A); title 'Pole-Zero Plot H[z]';  
figure,freqz(B,A);   title 'Frequency Response H[z]'; 

