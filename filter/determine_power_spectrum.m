function [detectedHR,detectedRR,powerspectrum,f] = determine_power_spectrum(nav_amplitude,TR,dimy,kstart,kend)

% determine the frequency spectrum
y = fft(nav_amplitude(kstart:kend));
fs = 1000/TR;               % sample frequency in Hz
n = length(nav_amplitude(kstart:kend));  % number of samples
f = (0:n-1)*(fs/n)*60;          % frequency range in bpm
power = abs(y).^2/n;            % power of the DFT

% determine frequency and harmonics of k-space trajectory and set those to zero
kfreq = 60/(0.001*dimy*TR);
ifreq = (fs/n)*60;
h1 = round(kfreq/ifreq)+1;
h2 = round(2*kfreq/ifreq)+1;
h3 = round(3*kfreq/ifreq)+1;
h4 = round(4*kfreq/ifreq)+1;
power(h1)=0;
power(h2)=0;
power(h3)=0;
power(h4)=0;
power = movmean(power,3);
powerspectrum = power;

% detect heart rate
minheartbpm = 350;
maxheartbpm = 600;
minidx = round(minheartbpm*n/(fs*60));
maxidx = round(maxheartbpm*n/(fs*60));
[~, idx] = max(power(minidx:maxidx));
detectedHR = round(idx*fs*60/n + minheartbpm);

% detect respiratory rate
minRRbpm = 30;
maxRRbpm = 70;
minidx = round(minRRbpm*n/(fs*60));
maxidx = round(maxRRbpm*n/(fs*60));
[~, idx] = max(power(minidx:maxidx));
detectedRR = round(idx*fs*60/n + minRRbpm);

end