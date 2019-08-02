function [amplitude,phase] = extractnavigator(inputdata,navigatorlength,nr_nav_points,posneg)

% extracts the navigator data from the raw k-space data
% outputs a 1D array of doubles

[nr_rep,dimy,dimx]=size(inputdata);   % size of the input data, 3rd dimension is the readout direction which contains the navigator

for i = 1:nr_rep
    for j = 1:dimy
        
        % amplitude data
        navdata_amplitude(dimy*(i-1)+j) = posneg * sum(abs(inputdata(i,j,navigatorlength-nr_nav_points+1:navigatorlength)));  
        
        % phase data - not used (yet)
        navdata_phase(dimy*(i-1)+j) = mean(angle(inputdata(i,j,navigatorlength-nr_nav_points+1:navigatorlength)));
        
    end
end

amplitude = navdata_amplitude;
phase = navdata_phase;

end