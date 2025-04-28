clear;
close all;
clc;
n = -35:1:35; % Time range for the signal
length_of_sqn = length(n);
x_n = zeros(1, length_of_sqn); % Initialize i.p signal
% Choose and uncomment the desired signal:
% Unit step signal
for ii = 1 : length_of_sqn
 if (n(ii) < 0) 
 x_n(ii) = 0;
 else
 x_n(ii) = n(ii);
 end
end
% Ramp signal
% for ii = 1 : length_of_sqn
% if (n(ii) < 0) 
% x_n(ii) = 0;
% else
% x_n(ii) = n(ii);
% end end
% Exponential signal
% for ii = 1 : length_of_sqn
% if (n(ii) >= 0) 
% x_n(ii) = 0.5.^n(ii); 
% else
% x_n(ii) = 0; 
% end end
% Double-sided exponential signal
% for ii = 1 : length_of_sqn
% if (n(ii) >= 0) 
% x_n(ii) = 0.5.^n(ii); 
% else
% x_n(ii) = 0.8.^n(ii); 
% end end
% Plotting the input signal
subplot(2,2,[1,2]); 
stem(n, x_n, 'filled' )
title('Input Signal');
xlabel('n');
ylabel('x[n]');
omega = linspace(-pi, pi, 100); 
z = []; 
% Generate Z values
for r = linspace(0, 3, 100)
 z = [z; r .* exp(1j .* omega)];
end
Xtemp = []; 
X = [];
XFinal = []; 
% Compute Z-transform
for c = 1:length(z)
 for b = 1:length(z)
 temp = 0;
 for a = 1:length(n)
 temp = temp + (x_n(a) .* (z(c,b) .^ (-n(a))));
 end
 Xtemp = [Xtemp, temp]; 
 end
 X = [X; Xtemp]; 
 Xtemp = []; 
end
XFinal = X;
% Plot Z-transform result
subplot(2,2,3:4); 
surf(real(z), imag(z), 10*log10(abs(XFinal)), 'linestyle', 'none');
title('Z-Transform Magnitude in dB');
xlabel('Re(z)');
ylabel('Im(z)');
zlabel('Magnitude (dB)');
