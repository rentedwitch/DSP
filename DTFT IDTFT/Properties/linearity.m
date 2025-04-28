clear all;
close all;
clc;
% Define Ɵme index
n = -50:1:50;
N = length(n);
omega = linspace(-pi, pi, 100);
% Define two signals for linearity proof:
% Define unit ramp funcƟon δ(n)
x1 = zeros(1, N);
for ii = 1:N
   if (n(ii) >= 0)
    x1(ii) = ii;
   else
    x1(ii) = 0;
   end
end
% Define unit step funcƟon u(n)
x2 = zeros(1, N);
for ii = 1:N
if (n(ii) >= 0)
x2(ii) = 1; % Step funcƟon value is 1 for n >= 0
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
a = 5; b = 20;
% Compute DTFT of x1(n) and x2(n)
X1 = Compute_DTFT(x1, n, omega);
X2 = Compute_DTFT(x2, n, omega);
% Compute DTFT of the linear combinaƟon
y = a*x1 + b*x2;
Y = Compute_DTFT(y, n, omega);
% Verify Linearity: Y(ω) should be a*X1(ω) +b*X2(ω)
Y_expected = a*X1 + b*X2;
% Plot DTFT Magnitudes to verify Linearity
subplot(3,2,3);
plot(omega, abs(X1), 'r'); grid on;
xlabel('\omega'); ylabel('|X_1(\omega)|');
title('Magnitude of DTFT of x_1(n)');
subplot(3,2,4);
plot(omega, abs(X2), 'b'); grid on;
xlabel('\omega'); ylabel('|X_2(\omega)|');
title('Magnitude of DTFT of x_2(n)');
subplot(3,2,5);
plot(omega, abs(Y), 'k'); grid on;
xlabel('\omega'); ylabel('|Y(\omega)|');
title('Magnitude of DTFT of a*x_1(n) + b*x_2(n)');
subplot(3,2,6);
plot(omega, abs(Y_expected), 'g'); grid on;
xlabel('\omega'); ylabel('|Expected Y(\omega)|');
title('Expected Magnitude a*|X_1(\omega)| +b*|X_2(\omega)|');
% FuncƟon to Compute DTFT
function X = Compute_DTFT(x, n, omega)
X = zeros(1, length(omega)); % Preallocate DTFT array
for a = 1:length(omega)
X(a) = sum(x .* exp(-1j * omega(a) * n));
end
end