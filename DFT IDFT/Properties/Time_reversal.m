clear all;
close all;
clc;
% Define time index and frequency range
n = -20:20;
N = length(n);
omega = linspace(-4*pi, 4*pi, 100);
% Define x(n) (cos Function)
amp = 5 ;
M = 1;
N_cos = 10;
x = amp * cos(2 * pi * M / N_cos * n); % cos function
% Compute DFT of x(n)
X = Compute_DFT(x);
% Compute time-reversed signal x(-n)
x_reversed = x(end:-1:1); % Time reversal without using flip function
% Compute DFT of time-reversed signal
X_reversed = Compute_DFT(x_reversed);
% Expected output based on time-reversal property: X(-ω)
X_expected = X(end:-1:1); % Expected DFT based on time-reversal property
% Plot results
figure;
% Plot Original Signal
subplot(4,1,1);
stem(n, x, 'r'); grid on;
xlabel('n'); ylabel('x(n)');
title('Original Signal x(n)');
% Plot DFT of Original Signal
subplot(4,1,2);
stem(abs(X), 'b'); grid on;
xlabel('Frequency Index k'); ylabel('|X(k)|');
title('Magnitude of DFT of x(n)');
% Plot DFT of Time-Reversed Signal
subplot(4,1,3);
stem(abs(X_reversed), 'g'); grid on;
xlabel('Frequency Index k');
ylabel('|X_{reversed}(k)|');
title('Magnitude of DFT of Time-Reversed Signal');
% Plot Expected DFT from Time-Reversal Property
subplot(4,1,4);
stem(abs(X_expected), 'k--'); grid on;
xlabel('Frequency Index k'); ylabel('|X(-k)|Expected');
title('Expected Magnitude of DFT based on TimeReversal Property');
% Function to Compute DFT
function X = Compute_DFT(x)
 N = length(x);
 X = zeros(1, N);
 for k = 1:N
 for n = 1:N
X(k) = X(k) + x(n) * exp(-1j * 2 * pi * (k-1) *(n-1) / N);
 end
 end
end