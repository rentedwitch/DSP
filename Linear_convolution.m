%linear convolution of discrete time signals
clear;
close all;
clc;

%Get the signals
x=input("Enter the input signal:");
n1=input("Enter the starting index of x[n]");
h=input("Enter the input signal");
n2=input("Enter the starting index of h[n]");

%calculate axes

T1=n1:(n1+length(x)-1); %Time axes for x[n]
T2=n2:(n2+length(h)-1); %Time axes for h[n]

%Length of convolution result

N=(length(x)+length(h)-1); %length of convoluted signal
n3=n1+n2; %starting index of y[n]
T3=n3:(n3+N-1); %time axis for y[n]

%zero padding to make both signals the same size

x1=[x zeros(1,N-length(x))];
h1=[h zeros(1,N-length(h))];

y1=zeros(1,N);

for n=1:N
    for k=1:n
        if(n-k+1)>0
            y1(n)=y1(n)+x1(k)*h1(n-k+1);
        end
    end
end

subplot(4,1,1);
stem(T1,x,'r');
xlabel('n');
ylabel('x[n]');
title("Input signal x[n]");
grid on;

subplot(4,1,2);
stem(T2,h,'g');
xlabel('n');
ylabel('h[n]');
title('h[n]');

subplot(4,1,3);
stem(T3,y1,'b');
xlabel('n');
ylabel('y[n]');
title('Linear Convolution (manual)');
grid on;

y_builtin=conv(x,h);

subplot(4,1,4);
stem(T3,y_builtin,'m');
xlabel('n');
ylabel('y[n]');
title('Convolution builtin');
grid on;




