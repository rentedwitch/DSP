clear all; close all; clc;
% Input sequence
x = input('Enter the sequence: ');

% Determine the next power of two
p = nextpow2(length(x));

x_orig = [x zeros(1, (2^p) - length(x))]; % Zero-padding to the next power of two

N = length(x_orig);
S = log2(N); % Number of stages

% Bit-reversal ordering
x = bitrevorder(x_orig);
% FFT computation using Decimation in Time(DIT)
for stage = 1:S % Iteration through each stage
p = 1;
q = 1 + 2^(stage - 1);
n = 0;
while (n <= (2^(stage - 1) - 1) && q <= N)
w = exp(-1j * 2 * pi * (n / (2^stage))); %Twiddle factor

% Butterfly computation
y = x(p) + w * x(q);
z = x(p) - w * x(q);
x(p) = y;
x(q) = z;

% Update indices
p = p + 1;
q = q + 1;
n = n + 1;

% Repetition of butterfly structure
if (mod(q - 1, 2^stage) == 0)
p = p + 2^(stage - 1);
q = q + 2^(stage - 1);
n = 0;
end
end
end

% Store computed FFT result
X = x;
% Verification using MATLAB's inbuilt FFT function
X_builtin = fft(x_orig); % Compute FFT of the original padded sequence
disp('Computed FFT:');
disp(X);
disp('MATLAB FFT for verification:');
disp(X_builtin);

% Check accuracy of implementation
if all(abs(X - X_builtin) < 1e-6)
disp('FFT implementation is correct.');
else
disp('There is a discrepancy in the FFT implementation.');
end