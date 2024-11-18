function Question8()
    % Create a WAVE file from the example file handel.mat, and read the file back into MATLAB.
    load handel.mat
    
    filename = 'handel.wav';
    audiowrite(filename, y, Fs);
    clear y Fs
    
    [y, Fs] = audioread('handel.wav');
    
    % Play the audio
    disp('Playing original audio...');
    sound(y, Fs);
    pause(length(y)/Fs + 2);
    
    cutoff_freq = 1000;
    
    low_passed_audio = lowpass(y, cutoff_freq, Fs);
    
    high_passed_audio = highpass(y, cutoff_freq, Fs);
    
    disp('Playing low-pass filtered audio...');
    sound(low_passed_audio, Fs);
    pause(length(low_passed_audio)/Fs + 2);
    
    disp('Playing high-pass filtered audio...');
    sound(high_passed_audio, Fs);
    pause(length(high_passed_audio)/Fs + 2);
    
    % High frequency gaussian white noise
    noise = randn(size(y));
    high_freq_noise = highpass(noise, cutoff_freq, Fs);
    
    noisy_audio = y + high_freq_noise;
    
    % Parabolic filter
    denoised_audio = parabolic_filter(noisy_audio, Fs);
    
    % Play the noisy and denoised audio
    disp('Playing noisy audio...');
    sound(noisy_audio, Fs);
    pause(length(noisy_audio)/Fs + 2);
    
    disp('Playing denoised audio...');
    sound(denoised_audio, Fs);
    pause(length(denoised_audio)/Fs + 2);
end


function filtered_audio = parabolic_filter(audio)
    % 7-point parabolic filter of Question1
    numerator = [-2 3 6 7 6 3 -2];
    denominator = 21;
    
    filtered_audio = filter(numerator, denominator, audio);
end