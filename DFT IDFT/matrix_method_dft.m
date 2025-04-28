clear;
close all; 
clc;

% Input: Size of sequence and signal x(n)
x = input('Input the signal x(n): ');
N=length(x);

% Define twiddle factor for DFT
omega1 = exp(-2 * pi * 1i / N);

% Define time index vectors
n = 0:N-1;
k = transpose(n);

% Construct DFT matrix manually
W = omega1 .^ (k * n);
% Compute DFT of x(n)
x1 = transpose(x);
X = W * x1;
% Define twiddle factor for IDFT
idft_W = exp(2 * pi * 1i / N);
idft_W = idft_W .^ (k * n);
% Compute IDFT using matrix method
x_recon = (1 / N) * idft_W * X;
% Display results
disp('DFT of the signal is:');
disp(X);
disp('Reconstructed signal (IDFT) is:');
disp(x_recon);
% Plot Magnitude and Phase of DFT and IDFT
figure;
% Magnitude of DFT
subplot(4,1,1);
stem(0:N-1, abs(X), 'filled');
title('Magnitude Spectrum of DFT X(k)');
xlabel('k');
ylabel('|X(k)|');
grid on;
% Phase of DFT
subplot(4,1,2);
stem(0:N-1, angle(X), 'filled', 'b');
title('Phase Spectrum of DFT X(k)');
xlabel('k');
ylabel('∠X(k)');
grid on;
% Magnitude of IDFT
subplot(4,1,3);
stem(0:N-1, abs(x_recon), 'filled');
title('Magnitude Spectrum of IDFT X(k)');
xlabel('k');
ylabel('|x(n)|');
grid on;
% Phase of IDFT
subplot(4,1,4);
stem(0:N-1, angle(x_recon), 'filled', 'b');
title('Phase Spectrum of IDFT X(k)');
xlabel('k');
ylabel('∠x(n)');
grid on;
