clear all; close all; clc;
% Define time index
n = -50:50;
N = length(n);
% Define Signal: step Function u[n]
x = zeros(1, N);
for ii = 1:N
 if (n(ii) >= 0)
 x(ii) = 1;
 end
end
% Compute Energy in Time Domain
E_time = sum(abs(x).^2);
% Compute DFT manually
X = Compute_DFT(x);
% Compute Energy in Frequency Domain using Parseval's Theorem
E_freq = (1/N) * sum(abs(X).^2);
% Compare Energies
fprintf('Energy in Time Domain = %.4f\n', E_time);
fprintf('Energy in Frequency Domain = %.4f\n',E_freq);
if abs(E_time - E_freq) < 1e-4
 disp('Parseval’s theorem is verified!');
else
 disp('Energy mismatch! Check calculations.');
end
% Plot Results
figure;
% Energy in Time Domain
subplot(2,1,1);
stem(n, abs(x).^2, 'r', 'filled'); grid on;
title('Energy in Time Domain |x(n)|^2');
xlabel('n'); ylabel('|x(n)|^2');
ylim([0, max(abs(x).^2) * 1.1]);
% Energy in Frequency Domain
subplot(2,1,2);
stem(0:N-1, abs(X).^2 / N, 'b', 'filled'); grid on;
title('Energy in Frequency Domain |X(k)|^2 / N');
xlabel('Frequency Index k'); ylabel('|X(k)|^2 / N');
ylim([0, max(abs(X).^2 / N) * 1.1]);
% Function to Compute DFT manually
function X = Compute_DFT(x)
 N = length(x); % Number of samples
 X = zeros(1, N); % Initialize DFT output

 for k = 1:N % Loop over frequency bins
 for n = 1:N % Loop over time samples
 X(k) = X(k) + x(n) * exp(-1j * 2 * pi * (k-1) *(n-1) / N);
 end
 end
end