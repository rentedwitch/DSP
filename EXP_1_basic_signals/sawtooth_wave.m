clear all;
close all;
clc;
%generation of various dts%
N=input("enter the number of cycle");
M=input("enter the amplitude");
n1=0:0.5:M;
n2=0;
n=[];
for i=1:N
    n=[n,n1,n2];
end
subplot(2,2,1);
plot(n) %ct
xlabel('time');
ylabel('amplitude');
title('analog saw tooth wave');grid;
subplot(2,2,2)
stem(n);
xlabel('time');
ylabel('amplitude');
title('digital sawtooth wave');grid;