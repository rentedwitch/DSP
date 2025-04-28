% Time Reversal Property
n=-50:50;
x3=zeros(1,length(n));
u = zeros(1, length(n));
for jj=1:length(n)
   if(n(jj)<0)
       u(jj)=0;
   else
       u(jj)=1;
   end
end
for ii=1:length(n)
    x3(ii)=sin(n(ii))+u(ii);
end

subplot(3,2,1);
stem(n,x3);
xlabel("n"); % X-axis label
ylabel("x3[n]"); % Y-axis label

omega=linspace(-4*pi,4*pi,1000);

X_original = zeros(1, length(omega)); % Preallocate array for efficiency
for a=1:length (omega)
    X_original(a) = sum(x3.*exp(-1j*omega(a)*n)); % Compute DTFT using summation definition
end

%%Compute Magnitude and Phase of DTFT
magX_original=abs(X_original); % Compute magnitude spectrum
phaseX_original=angle(X_original); % Compute phase spectrum

% Plot Phase Spectrum of the original Sequence
subplot(3,2,5);
plot(omega/pi, phaseX_original); grid on; % Plot phase spectrum
xlabel("Frequency (π)"); % Label X-axis
ylabel("X(w)"); % Label Y-axis
title("Phase Plot of original Sequence"); % Title for the phase plot

%%Plot Magnitude Spectrum of the original Sequence

subplot(3,2,3);
plot(omega/pi, magX_original); grid on; % Plot magnitude spectrum
xlabel("Frequency (π)"); % Label X-axis
ylabel("|x(w)|"); % Label Y-axis
title("Magnitude Plot of original Sequence"); % Title for the magnitude plot




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


x4 = flip(x3); % Reverse the sequence x3 to obtain x4
% Plot the reversed sequence
subplot(3,2,2);
stem(n, x4); % Plot x4 in the second subplot
title("Reversed Sequence"); % Title for the reversed sequence plot
xlabel("n"); % X-axis label
ylabel("x4[n]"); % Y-axis label

%Compute DTFT of the Reversed Sequence

omega=linspace(-4*pi,4*pi,1000);

X_shifted = zeros(1, length(omega)); % Preallocate array for efficiency
for a=1:length (omega)
    X_shifted(a) = sum(x4.*exp(-1j*omega(a)*n)); % Compute DTFT using summation definition
end

%Compute Magnitude and Phase of DTFT (Reversed)
magX_shifted=abs(X_shifted); % Compute magnitude spectrum
phaseX_shifted=angle(X_shifted); % Compute phase spectrum

%Plot Magnitude Spectrum of the Reversed Sequence

subplot(3,2,4);
plot(omega/pi, magX_shifted); grid on; % Plot magnitude spectrum
xlabel("Frequency (π)"); % Label X-axis
ylabel("|x(w)|"); % Label Y-axis
title("Magnitude Plot of Reversed Sequence"); % Title for the magnitude plot

% Plot Phase Spectrum of the Reversed Sequence
subplot(3,2,6);
plot(omega/pi, phaseX_shifted); grid on; % Plot phase spectrum
xlabel("Frequency (π)"); % Label X-axis
ylabel("X(w)"); % Label Y-axis
title("Phase Plot of Reversed Sequence"); % Title for the phase plot