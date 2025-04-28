clear all; close all; clc;
% Define Ɵme index and frequency range
n = -50:50;
omega = linspace(-4*pi, 4*pi, 1000);
% Define a rectangular pulse signal
rect_N = 15; % Width of the rectangular pulse
x = zeros(1, length(n));
for ii = 1:length(n)
if (n(ii) >= -rect_N) && (n(ii) <= rect_N)
x(ii) = 1; % Assign 1 within the pulse width
end
end
% Compute DTFT of the original signal
X = Compute_DTFT(x, n, omega);
% Define Ɵme shiŌ value
k = 10;
x_shifted = zeros(1, length(n));
% Generate the shiŌed rectangular pulse
for ii = 1:length(n)
if (n(ii) >= -rect_N + k) && (n(ii) <= rect_N + k)
x_shifted(ii) = 1;
end
end
% Compute DTFT of the shiŌed signal
X_shifted = Compute_DTFT(x_shifted, n, omega);
% Expected DTFT of shiŌed signal using Ɵme-shifting property
X_expected = X .* exp(-1j * omega * k);
% Plot original and transformed signals
figure;
subplot(4,1,1);
stem(n, x, 'r', 'filled'); grid on;
xlabel('n'); ylabel('x(n)'); title('Original Signal x(n)');
subplot(4,1,2);
plot(omega, abs(X), 'b'); grid on;
xlabel('\omega'); ylabel('|X(\omega)|');
title('Magnitude of DTFT of x(n)');
subplot(4,1,3);
stem(n, x_shifted, 'k', 'filled'); grid on;
xlabel('n'); ylabel('x(n - k)'); title(['Time-ShiftedSignal x(n - ', num2str(k), ')']);
subplot(4,1,4);
plot(omega, abs(X_shifted), 'g'); grid on;
xlabel('\omega'); ylabel('|X_{shifted}(\omega)|');
title('Magnitude of DTFT of x(n - k)');
% FuncƟon to Compute DTFT
function X = Compute_DTFT(x, n, omega)
X = zeros(1, length(omega)); % Preallocate DTFT array
for a = 1:length(omega)
X(a) = sum(x .* exp(-1j * omega(a) * n)); %Compute DTFT sum
end
end