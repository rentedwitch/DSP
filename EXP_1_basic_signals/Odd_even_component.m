clear all;
close all;
clc;

n= -20:1:20;

u=[zeros(1,20),ones(1,21)];
u_shift=[zeros(1,30),ones(1,11)];  %u(n-10)
y=u-u_shift;

%even
y_e=(y+flip(y))/2;
%odd
y_o=(y-flip(y))/2;

%plot y
subplot(3,3,[1,2,3]);
stem(n,y,'r','LineWidth',1.5);
xlabel("Time(n)");
ylabel("Amplitude");
title("y(n)=u(n)-u(n-10)");
grid on;

%plot even component
subplot(3,3,[4,5,6]);
stem(n,y_e,'g','LineWidth',1.5 );
xlabel("Time(n)");
ylabel("Amplitude");
title("Even componet of y(n)");
grid on;

%plot odd component
subplot(3,3,[7,8,9]);
stem(n,y_o, 'b', 'LineWidth',1.5);
xlabel("Time(n)");
ylabel("Amplitude");
title("odd component of y(n)");
grid on;
