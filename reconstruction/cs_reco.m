function image_out = cs_reco(app,kspace_in,averages_in,Wavelet,TVt,TVxy,VNSA)


% Weights need to be normalized somehow. Not fully tested yet.
averages_in = averages_in.^.5;
averages_in = averages_in/mean(nonzeros(averages_in));

% resize k-space to next power of 2
dimy = 2^nextpow2(size(kspace_in,2));
dimx = 2^nextpow2(size(kspace_in,3));
kspace_in = bart(['resize -c 1 ',num2str(dimy),' 2 ',num2str(dimx)],kspace_in);
averages_in = bart(['resize -c 1 ',num2str(dimy),' 2 ',num2str(dimx)],averages_in);

% bart (kx,ky,kz,channels,multiple sense, ..., ..., cardiac frames at pos 11)
% sense maps for 2D data:  (1,kx,ky,....)
kspace_pics = permute(kspace_in,[4,3,2,5,6,7,8,9,10,11,1]);
averages_pics = permute(averages_in,[4,3,2,5,6,7,8,9,10,11,1]);
sense = ones(1,dimx,dimy,1,1,1,1,1,1,1,1);

% wavelet in spatial dimensions 2^1+2^2=6 
% total variation in spatial dimensions 2^1+2^2=6
% total variation in time 2^10 = 1024

if VNSA
    
    % Reconstruction with variable number of signal averages (VNSA) correction [Schoormans et al. 2020]
    TextMessage(app,'WARNING: Reconstructing the data with VNSA weighting - not fully tested yet ...');
    
    picscommand = ['pics -RW:6:0:',num2str(Wavelet),' -RT:6:0:',num2str(TVxy),' -RT:1024:0:',num2str(TVt),' -p'];
    image_reg = bart(picscommand,averages_pics,kspace_pics,sense);
    
else
    
    % Reconstruction without VNSA correction
    picscommand = ['pics -RW:6:0:',num2str(Wavelet),' -RT:6:0:',num2str(TVxy),' -RT:1024:0:',num2str(TVt)];
    image_reg = bart(picscommand,kspace_pics,sense);
    
end


% rearrange to correct orientation
image_out = flip(abs(permute(squeeze(image_reg),[3, 2, 1])),2);

end