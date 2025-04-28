clear;
close all;
clc;


x = input("Enter the input signal: ");
N=length(x);
n=0:N-1;

X = zeros(N,1);

% DFT calculation
for k = 0:N-1
    for nn = 0:N-1
        X(k+1) = X(k+1) + (x(nn+1)*exp(-2*1j*pi*nn*k/N));
    end
end

% No abs(X) here! Keep X complex for IDFT

% IDFT calculation
x_manual = zeros(1,N);
for nn = 0:N-1
    for k = 0:N-1
        x_manual(nn+1) = x_manual(nn+1) + (X(k+1)*exp(1j*2*pi*nn*k/N));
    end
end

x_manual = x_manual/N; % Correct scaling, no abs

% Plot original signal
subplot(3,1,1);
stem(n,x,'filled');
grid on;
xlabel('n');
ylabel('x[n]');
title('Original Signal');

% Plot DFT magnitude
subplot(3,1,2);
stem(n,abs(X),'filled');
grid on;
xlabel('Frequency index k');
ylabel('|X[k]|');
title('Magnitude of DFT');

% Plot IDFT (Recovered signal)
subplot(3,1,3);
stem(n,real(x_manual),'filled');
grid on;
xlabel('n');
ylabel('Reconstructed x[n]');
title('IDFT (Reconstructed Signal)');
