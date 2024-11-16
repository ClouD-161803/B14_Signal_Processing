s = tf('s');

f_s = 150;
T = 1/f_s;
numerator = 1 + exp(-s*T) + exp(-2*s*T);
denominator = 3;
sys = numerator / denominator;

figure;
[mag, phase, w] = bode(sys);

% Convert magnitude to dB and phase to degrees
mag = squeeze(mag);
phase = squeeze(phase);
w = squeeze(w);

% Plot magnitude
subplot(2,1,1);
plot(w, mag);
grid on;
title('Bode Diagram - Magnitude');
xlabel('Frequency (rad/s)');
ylabel('Magnitude');

% Plot phase
subplot(2,1,2);
plot(w, phase);
grid on;
title('Bode Diagram - Phase');
xlabel('Frequency (rad/s)');
ylabel('Phase (degrees)');