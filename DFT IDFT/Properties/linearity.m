clear all; close all; clc;
% Define time index
n = -10:10;
N = length(n);
omega = linspace(-pi, pi, 100);
% Define two signals for linearity proof:
% Define unit ramp function r(n)
x1 = zeros(1, N);
for ii = 1:N
 if (n(ii) >= 0)
 x1(ii) = n(ii);
 else
 x1(ii) = 0;
 end
end
% Define unit step function u(n)
x2 = zeros(1, N);
for ii = 1:N
 if (n(ii) >= 0)
 x2(ii) = 1;
 else
 x2(ii) = 0;
 end
end
% Plot x1(n) and x2(n)
figure;
subplot(3,2,1);
stem(n, x1, 'r', 'filled'); grid on;
xlabel('n'); ylabel('x_1(n)');
title('Unit ramp Function r(n)');
subplot(3,2,2);
stem(n, x2, 'b', 'filled'); grid on;
xlabel('n'); ylabel('x_2(n)');
title('Unit Step Function u(n)');
% Define scaling factors
a = 2; b = 3;
% Compute DFT of x1(n) and x2(n)
X1 = Compute_DFT(x1, N);
X2 = Compute_DFT(x2, N);
% Compute DFT of y(n) = a*x1(n) + b*x2(n)
y = a*x1 + b*x2;
Y = Compute_DFT(y, N);
% Expected output: Y(ω) = a*X1(ω) + b*X2(ω)
Y_expected = a*X1 + b*X2;
% Plot DFT Magnitudes to verify Linearity
subplot(3,2,3);
plot(abs(X1), 'r'); grid on;
xlabel('k'); ylabel('|X_1(k)|');
title('Magnitude of DFT of x_1(n)');
subplot(3,2,4);
plot(abs(X2), 'b'); grid on;
xlabel('k'); ylabel('|X_2(k)|');
title('Magnitude of DFT of x_2(n)');
subplot(3,2,5);
plot(abs(Y), 'k'); grid on;
xlabel('k'); ylabel('|Y(k)|');
title('Magnitude of DFT of a*x_1(n) + b*x_2(n)');
subplot(3,2,6);
plot(abs(Y_expected), 'g--'); grid on;
xlabel('k'); ylabel('|Expected Y(k)|');
title('Expected Magnitude a*|X_1(k)| + b*|X_2(k)|');
% Function to Compute DFT
function X = Compute_DFT(x, N)
 X = zeros(1, N);
 for k = 1:N
 for n = 1:N
X(k) = X(k) + x(n) * exp(-1j * 2 * pi * (k-1) * (n-1) / N);
 end
 end
end