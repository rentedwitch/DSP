clear all;
close all;
clc;

n=-10:1:10;
w=pi./8; %omega
a=0.8; %exponential decay factor

%x1 signal
x1=cos(w*n);
%x2 signal
x2=6*(a.^max(n,0)); %x2=6.a^n

x=x1.*x2;

figure;

subplot(3,3,[1,2,3]);
stem(n,x1,'r');
xlabel("Time(n)");
ylabel("Amplitude");
title("cos(w*n)");
grid on;

subplot(3,3,[4,5,6]);
stem(n,x2,'g');
xlabel("Time(n)");
ylabel("Amplitude");
title("6.a^n");
grid on;

subplot(3,3,[7,8,9]);
stem(n,x,'b');
xlabel("Time(n)");
ylabel("Amplitude");
title("x=x1*x2");
grid on;

