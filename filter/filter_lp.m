function outputdata = filter_lp(inputdata,tr,hr)   

% applies a low-pass filter data
% tr = repetition time TR in ms
% hr = cutoff frequency in bpm


sf=1000/tr;    % sampling frequency in Hz = 1/TR[ms]
cf=hr/60;      % cutoff frequency [bpm]/60
order = 2;      % order of the filter

[b,a]=butter(order,cf/(sf/2),'low');   % butterworth lowpass filter

outputdata=filtfilt(b,a,inputdata);   % apply zero-phase shift filtering

end