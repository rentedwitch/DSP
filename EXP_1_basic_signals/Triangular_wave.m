clear all;
close all;
clc;
%generation of various dts%
N=input("enter the number of cycle");
M=input("enter the amplitude");
n1=0:0.5:M;
n2=M:-0.5:0;
n=[];
for i=1:N
    n=[n,n1,n2];
end
subplot(2,2,[1,2]);
plot(n) %ct
xlabel('time');
ylabel('amplitude');
title('analog triangular wave');grid on;
subplot(2,2,[3,4])
stem(n);
xlabel('time');
ylabel('amplitude');
title('digital triangular wave');grid on;