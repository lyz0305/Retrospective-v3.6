function outputdata = filter_nav_bp(inputdata,tr,hr,bw,order)   

% applies a bandwidth filter on the navigator data
% tr = repetition time TR in ms
% hr = expected heart rate in bpm
% bw = expected bandwidth in heart rate in bpm
% order of the filter

sf=1000/tr;    % sampling frequency in Hz = 1/TR[ms]
cf=hr/60;      % expected heartrate in Hz = hr[bpm]/60
bw1=bw/60;      % bandwidth in Hz = [bpm]/60

input = detrend(inputdata);    % remove offset

[b,a] = butter(order,[cf-0.5*bw1,cf+0.5*bw1]/(sf/2),'bandpass');   % butterworth bandpass filter
outputdata = filtfilt(b,a,input);   % apply zero-phase shift filtering

end