function [peaks,locations] = trigpoints(inputdata,tr,hr,interpolationfactor)

% extracts the ECG trigger points from the navigators
% tr = repetition time TR in ms
% hr = expected heart rate in bpm
% factor = interpolation factor to make sure that trigger points are not
% exact mulitples of the repetition time

%disp('Finding peaks in navigator signals...');

% minimal distance 0.5 * expected heart rate [in points] to prevent spurious peak detection   

dist = 0.5*(60/hr)/(tr/1000);      

% cubic spline interpolation of the data

nrl = size(inputdata,2);

navi = interp1(1:nrl,inputdata(1,1:nrl),1:1/interpolationfactor:nrl,'spline');

% find the peaks and locations

[peaks,locs]=findpeaks(navi,'MinPeakDistance',dist*interpolationfactor);

% recalculate orginal fractional time point peak positions

locations = locs/interpolationfactor;

end
