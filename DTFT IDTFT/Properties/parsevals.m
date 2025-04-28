clear all; close all; clc;
% Define Ɵme index
n = -50:50;
N = length(n);
% Define Signal: unit step FuncƟon 
x = zeros(1, N);
for ii = 1:N
if (n(ii) >= 0)
x(ii) = 1;
else 
    x(ii)=0;
end
end
% Compute Energy in Time Domain
E_time = sum(x.^2);
% Compute DTFT
omega = linspace(-pi, pi, 1000);
X = Compute_DTFT(x, n, omega);
% Compute Energy in Frequency Domain using Trapezoidal Rule
E_freq = (1/(2*pi)) * trapz_integrate(abs(X).^2,omega);
% Compare Energies
fprintf('Energy in Time Domain = %.4f\n', E_time);
fprintf('Energy in Frequency Domain = %.4f\n',E_freq);
if abs(E_time - E_freq) < 1e-4
disp('Parseval’s theorem is verified!');
else
disp('Energy mismatch! Check calculaƟons.');
end
% Plot Results
figure;
subplot(2,1,1);
stem(n, x.^2, 'r', 'filled'); grid on;
title('Energy in Time Domain (|x(n)|^2)');
xlabel('n'); ylabel('|x(n)|^2');
subplot(2,1,2);
plot(omega, abs(X).^2 / (2*pi), 'b'); grid on;
title('Energy in Frequency Domain (|X(\omega)|^2/ 2\pi)');
xlabel('\omega'); ylabel('|X(\omega)|^2 / 2\pi');
% FuncƟon to Compute DTFT
function X = Compute_DTFT(x, n, omega)
X = zeros(size(omega));
for k = 1:length(omega)
X(k) = sum(x .* exp(-1j * omega(k) * n));
end
end
% Trapezoidal IntegraƟon FuncƟon 
function integral_value = trapz_integrate(x, n)
dx = n(2) - n(1);
integral_value = (dx / 2) * (x(1) + x(end) + 2 *sum(x(2:end-1)));
end