function [card_bins,resp_bins]=assign_bin_times(card_locations,nr_of_card_frames,resp_locations,nr_of_resp_frames)

nr_card = size(card_locations,2); % number of cardiac time points
nr_resp = size(resp_locations,2); % number of respiratory time points


% cardiac binning

cbins = zeros(1,(nr_card-1)*nr_of_card_frames);

for i=1:nr_card-1
    for j=1:nr_of_card_frames
        cbins(nr_of_card_frames*(i-1)+j)=card_locations(i)+(j-1)*(card_locations(i+1)-card_locations(i))/nr_of_card_frames;
    end
end


% respiratory binning

rbins = zeros(1,(nr_resp-1)*nr_of_resp_frames);

for i=1:nr_resp-1
  for j=1:nr_of_resp_frames
       rbins(nr_of_resp_frames*(i-1)+j)=resp_locations(i)+(j-1)*(resp_locations(i+1)-resp_locations(i))/nr_of_resp_frames;
  end
end

card_bins = cbins;
resp_bins = rbins;

end