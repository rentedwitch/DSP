clear all; close all; clc;
% Define time index
n = -15:5;
N = length(n); % Number of samples
% Define a rectangular pulse signal
rect_N = 7; % Width of the rectangular pulse
x = zeros(1, N);
for ii = 1:N
 if (n(ii) >= -rect_N) && (n(ii) <= rect_N)
 x(ii) = 1; % Assign 1 within the pulse width
 end
end
% Compute DFT of the original signal
X = Compute_DFT(x);
% Define time-shift value
k = 2; % Adjusted to avoid out-of-bounds shift
x_shifted = zeros(1, N);
% Generate the time-shifted rectangular pulse
for ii = 1:N
 if (ii-k > 0) && (ii-k <= N) % Ensure valid index after shift
 x_shifted(ii) = x(ii-k);
 end
end
% Compute DFT of the shifted signal
X_shifted = Compute_DFT(x_shifted);
% Expected DFT of shifted signal using time-shifting property
m = 0:N-1; % Frequency indices
X_expected = X .* exp(-1j * 2 * pi * m * k / N); % Timeshifting property
% Plot results
figure;
% Original Signal
subplot(5,1,1);
stem(n, x, 'r', 'filled'); grid on;
xlabel('n'); ylabel('x(n)');
title('Original Signal x(n)');
ylim([-0.2 1.2]);
% Magnitude of DFT of Original Signal
subplot(5,1,2);
stem(m, abs(X), 'b'); grid on;
xlabel('Frequency Index k'); ylabel('|X(k)|');
title('Magnitude of DFT of x(n)');
% Time-Shifted Signal
subplot(5,1,3);
stem(n, x_shifted, 'k', 'filled'); grid on;
xlabel('n'); ylabel('x(n - k)');
title(['Time-Shifted Signal x(n - ', num2str(k), ')']);
ylim([-0.2 1.2]);
% Magnitude of DFT of Shifted Signal
subplot(5,1,4);
stem(m, abs(X_shifted), 'g'); hold on;
grid on;
xlabel('Frequency Index k'); ylabel('|X(k)|');
title('Magnitude of DFT of Shifted x(n - k)');
% Magnitude of Expected DFT using Time-Shifting Property
subplot(5,1,5);
stem(m, abs(X_expected), 'k--'); % Expected DFT
grid on;
xlabel('Frequency Index k'); ylabel('|X(k)|');
title('Expected DFT Magnitude from Time-Shifting Property');
% Function to Compute DFT
function X = Compute_DFT(x)
 N = length(x);
 X = zeros(1, N);
 for k = 1:N
 for n = 1:N
 X(k) = X(k) + x(n) * exp(-1j * 2 * pi * (k-1) * (n-1) / N);
 end
 end
end