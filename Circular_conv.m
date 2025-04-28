% Circular convolution
clear;
close all;
clc;

x1 = input("Enter the first sequence: ");
x2 = input("Enter the second sequence: ");
n1 = length(x1);
n2 = length(x2);
n = max(n1, n2);

% Zero padding to make equal length
if n1 > n2
    x2 = [x2, zeros(1, n1 - n2)];
elseif n2 > n1
    x1 = [x1, zeros(1, n2 - n1)];
end

y = zeros(1, n); % Correct initialization

for i = 1:n
    for j = 1:n
        y(i) = y(i) + x1(j) * x2(mod(i - j, n) + 1);
    end
end

% Plotting
subplot(3,1,1);
stem(0:n-1, x1, 'filled');
grid on;
xlabel('n');
ylabel('x1[n]');
title('First Sequence');

subplot(3,1,2);
stem(0:n-1, x2, 'filled');
grid on;
xlabel('n');
ylabel('x2[n]');
title('Second Sequence');

subplot(3,1,3);
stem(0:n-1, y, 'filled');
grid on;
xlabel('n');
ylabel('y[n]');
title('Circular Convolution Output');
