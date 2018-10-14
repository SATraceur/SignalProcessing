%% Question 1

[bs,as] = butter(4, 2*pi*400,'s');
w = 0:10:100000;
Hs = freqs(bs,as,w);
Hmag=abs(Hs);
Hphase=phase(Hs);
figure(1)
subplot(2,1,1)
plot(Hmag);
title 'Analog filter - manual plot';
xlabel '\omega (rads/sec)'
ylabel 'Magnitude'
xlim([0,10000])
subplot(2,1,2);
plot(Hphase)
xlabel '\omega (rads/sec)'
ylabel 'Degrees'
xlim([0,10000])

%% 

figure(2)
subplot(2,1,1)
loglog(w,Hmag);
grid on;
title 'Analog filter - manual log plots';
xlabel '\omega (rads/sec)'
ylabel 'Magnitude'
xlim([0,6000])

subplot(2,1,2);
semilogx(w,Hphase);
grid on;
xlabel '\omega (rads/sec)'
ylabel 'Degrees'
xlim([0,6000])

figure(3)
freqs(bs,as,w);


%% 

figure(4)
[bimp,aimp] = impinvar(bs,as,2000);
freqz(bimp,aimp,2000)
title 'Digital filter using impulse invariance'

%% 

figure(5)
[bbi,abi] = bilinear(bs,as,2000);
freqz(bbi,abi,2000);
title 'Digital Filter - Bilinear Transformation'

%%

figure(6)
zplane(bimp,aimp);
title 'Impulse Invariance Zero-Pole Plot (Zoomed In)'
axis([-1 1 -1 1])
figure(7)
zplane(bbi,abi);
title 'Bilinear Transformation Zero-Pole Plot' 

%% 

figure(8)
subplot(2,1,1);
grpdelay(bimp,aimp);
title 'Impulse Invariance GD'
subplot(2,1,2);
grpdelay(bbi,abi);
title 'Bilinear Transformation GD' 


