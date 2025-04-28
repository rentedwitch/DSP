close all;
clear;
clc;
% Input signal
x = input('Enter the signal: ');
N = length(x);
% Initialize DFT matrix
W = zeros(N, N);
% Compute DFT matrix manually
for n = 1:N
 for k = 1:N
 W(n,k) = exp(-1j*2*pi*(n-1)*(k-1)/N);
 end
end
% Compute DFT of x(n)
X = x * W;
% Compute IDFT using conjugate transpose property
W_inv = transpose(conj(W));
x_recons = (X * W_inv) / N;
% Plot magnitude spectrum of DFT
figure;
% Magnitude Spectrum using built-in FFT
subplot(4,1,1);
stem(abs(fft(x)), 'b', 'filled');
title('Magnitude Spectrum X[k] using command');
ylabel('|X[k]|');
xlabel('Frequency in k');
grid on;

% Magnitude Spectrum using manual DFT computation
subplot(4,1,2);
stem(abs(X), 'g', 'filled');
title('Magnitude Spectrum X[k] through Manual Computation');
ylabel('|X[k]|');
xlabel('Frequency in k');
grid on;

% Original Signal using command
subplot(4,1,3);
stem(0:N-1, x, 'bo');
title('x[n] using command');
ylabel('x[n]');
xlabel('n');
grid on;

% Original Signal through Manual Computation
subplot(4,1,4);
stem(0:N-1, real(x_recons), 'ro');
title('x[n] through Manual Computation');
ylabel('x[n]');
xlabel('n');
grid on;
