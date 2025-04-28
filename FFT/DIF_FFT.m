clear all; close all; clc;
x = input('Enter the sequence: ');
    N = length(x);  % Length of the sequence (assumed to be a power of 2)
    s = log2(N);    % Number of stages (log2(N))
    
    % Step 1: Bit-reversal reordering of the input sequence
    x = bitrevorder(x);  
    
    % Step 2: Start the FFT computation
    for stage = 1:s
        m = 2^stage;    % Number of points in this stage
        half_m = m / 2; % Half of m
        
        for k = 0:half_m-1
            % Twiddle factor
            w = exp(-1i * 2 * pi * k / m);
            
            for n = k:2^stage:N-1
                % Indices for the "butterfly" computation
                even_idx = n + 1; 
                odd_idx = n + half_m + 1;
                
                % Butterfly computation
                temp = x(even_idx) + w * x(odd_idx);  % Even part
                x(odd_idx) = x(even_idx) - w * x(odd_idx);  % Odd part
                x(even_idx) = temp;
            end
        end
    end
    X = x;  % The FFT result is stored in X

disp('The FFT of the sequence is:');
disp(X);  % Display the result