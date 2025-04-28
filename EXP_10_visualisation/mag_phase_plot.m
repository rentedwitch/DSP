clear; close all; clc;
w = linspace(-pi, pi, 1001); % Frequency range
r = 1; % Radius for the Z-plane 
z = r .* exp(1j * w); % Z values
% Define the transfer function H(z)
H = ((6 .* z) .* (7 .* z - 3)) ./ ((2.8 .* z - 1) ./ (3 .* z -1));%% Plot the magnitude and phase of H(z)
figure;
% Plot magnitude of H(z)
magz=abs(H);
subplot(2,1,1);
plot(w, magz); % Absolute value of H(z)
xlabel('\omega'); 
ylabel('|H(\omega)|'); 
grid on;
% Plot phase of H(z)
subplot(2,1,2);
plot(w, angle(H)); 
xlabel('\omega'); 
ylabel('\angle H(\omega)'); 
grid on;
