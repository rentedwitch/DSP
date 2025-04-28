clear;
close all;
clc;

t=-100;1;100;
fm=0.02;
x=cos(2*pi*fm*t);

subplot(4,1,1);
plot(t,x);
xlabel('Time(t)');
ylabel('x(t)');
title('continuous wave');
grid on;

fs1=0.01;
n1=-2:2;
x1=cos(2*pi*fm*n1/fs1);

subplot(4,1,2);
stem(n1,x1);
hold on;
xlabel('n');
ylabel('x(n)');
title('undersampling');
grid on;

fs2=2*fm;
n2=-4:4;
x2=cos(2*pi*fm*n2/fs2);

subplot(4,1,3);
stem(n2,x2,':');
xlabel('n');
ylabel('x(n)');
title('Nyquist rate');
grid on;

fs3=10*fm;
n3=-50:50;
x3=cos(2*pi*fm*n3/fs3);

subplot(4,1,4);
stem(n3,x3);
xlabel('n');
ylabel('x[n]');
title('oversampling');
grid on;

