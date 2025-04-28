clear;
close all;
clc;

n = -50:50;
y = zeros(1, length(n)); % Initialize properly

for ii = 1:length(n)
    if n(ii) >= 0
        y(ii) = 1;
    else
        y(ii) = 0;
    end
end

subplot(3,1,1);
stem(n, y);
xlabel('n');
ylabel('x[n]');
title('DTS');
grid on;

omega = -4*pi:0.01:4*pi;
X = [];  % Empty vector for storing DTFT results

for a = 1:length(omega)
    xtemp = 0; % Initialize as scalar zero, not a vector
    for b = 1:length(n)
        xtemp = xtemp + y(b) * exp(-1j*omega(a)*n(b));
    end
    X = [X xtemp];
end



% Magnitude
magX = abs(X);
subplot(3,1,2);
plot(omega, magX);
grid on;
xlabel('Frequency (rad/sample)');
ylabel('|X(ω)|');
title('Magnitude Spectrum');

% Phase
angX = angle(X);
subplot(3,1,3);
plot(omega, angX);
grid on;
xlabel('Frequency (rad/sample)');
ylabel('∠X(ω)');
title('Phase Spectrum');
