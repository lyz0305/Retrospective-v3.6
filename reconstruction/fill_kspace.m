function [kspace,averages]=fill_kspace(raw,repstart,nr_of_card_frames,nr_of_resp_frames,dimy,nr_ksteps,dimx,card_bin_ass,resp_bin_ass,traj)

% This function creates 2 arrays
% (1) the kspace data sorted into the correct cardiac frames and phase-encoding positions
% (2) an array with the same size that keeps track of the number of averages per k-space point for normalization/statistics purposes

% Required input:
% raw unsorted k-space data
% number of desired cardiac frames, must be consisted with bin assignments (bin_ass)
% dimensions of the images: dimy (phase encoding), dimx (readout)
% the bin assignment array for all measured k-lines
% the k-space trajectory

% retrospective version 3.1
%
% - added the variable repstart, in case a datawindow is used

temp_kspace = complex(zeros(nr_of_resp_frames,nr_of_card_frames,dimy,dimx));    % fill temp k-space with zeros
temp_averages = zeros(nr_of_resp_frames,nr_of_card_frames,dimy,dimx);  % fill temp nr averages array with zeros
nrreps = size(raw,1);                           % number of k-space repetitions
rawt = reshape(raw,[1,size(raw)]);

for i=1:nrreps                   % loop through all repetitions
    
    for j=1:nr_ksteps            % loop through all the phase-encoding steps
        
        k = (i+repstart-2)*nr_ksteps+j;   % chronological index for the k-line acquisition , repostart added
        
        if (card_bin_ass(k) > 0)      % if assigment = 0, this acquisition is discarded
            
            kline=traj(mod(k-1,nr_ksteps)+1);    % the phase-encoding step using the trajectory info
            temp_kspace(resp_bin_ass(k),card_bin_ass(k),kline,:) = temp_kspace(resp_bin_ass(k),card_bin_ass(k),kline,:) + rawt(1,i,j,:);   % add the data to the correct k-position
            temp_averages(resp_bin_ass(k),card_bin_ass(k),kline,:) = temp_averages(resp_bin_ass(k),card_bin_ass(k),kline,:) + 1;        % increase the number of averages with 1  
        
        end
        
    end
    
end

temp_kspace = temp_kspace./temp_averages;   % normalize by number of averages

temp_kspace(isnan(temp_kspace)) = complex(0); % correct for NaN because of division by zero in case of missing k-lines

kspace = temp_kspace;
averages = temp_averages;

end