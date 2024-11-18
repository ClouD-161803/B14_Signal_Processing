% Define the transfer functions
s = tf('s');

f_s = 1;
T = 1/f_s;
% Example filter 1: Low-pass filter
numerator1 =  1 - exp(-s*T);
denominator1 = 1;
filter1 = numerator1 / denominator1;

% Example filter 2: High-pass filter
numerator2 = 1 - exp(-s*T);
denominator2 =1 + 0.8*exp(-s*T);
filter2 = numerator2 / denominator2;

% Frequency range
omega = linspace(-5, 5, 1000);

% Calculate the frequency response
[mag1, ~] = bode(filter1, omega);
[mag2, ~] = bode(filter2, omega);

% Squeeze the magnitude arrays
mag1 = squeeze(mag1);
mag2 = squeeze(mag2);

% Plot the magnitude responses
figure;
plot(omega, mag1, 'b', 'DisplayName', 'Filter 1');
hold on;
plot(omega, mag2, 'r', 'DisplayName', 'Filter 3');
hold off;

% Add grid, title, labels, and legend
grid on;
title('Magnitude Response of Two Filters');
xlabel('Frequency (rad/s)');
ylabel('Magnitude');
legend('show');
