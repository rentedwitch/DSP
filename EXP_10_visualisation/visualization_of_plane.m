clear;
close all;
clc;
% Define the frequency range
w = linspace(-pi, pi, 1001); % Frequency range
% Initialize arrays for Z and H values
Z = []; % Initialize Z values
H = []; % Initialize H values
% Generate Z values for radius from 0 to 3
for r = linspace(0, 3, 1001)
 Z = [Z; r .* exp(1j * w)]; % Create Z values for each radius
end
% Calculate the transfer function H(z)
H = (2 .* Z) ./ (2 .* Z - 1); % H(z) formula
% Plotting the 3D mesh of H(z) in the Z plane
mesh(real(Z), imag(Z), abs(H)); % Plot mesh
grid on;
% Add labels to the plot
xlabel('Re(z)'); % Real part of Z
ylabel('Im(z)'); % Imaginary part of Z
zlabel('H(z)'); % Magnitude of H(z)
