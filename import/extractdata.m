function outputdata = extractdata(inputdata,navigatorlength)

% extracts the imaging k-space data from the raw k-space data

dimx=size(inputdata,3);

outputdata=inputdata(:,:,navigatorlength+1:dimx);

end