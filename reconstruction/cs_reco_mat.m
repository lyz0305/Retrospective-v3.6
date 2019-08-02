function image_out = cs_reco_mat(kdata,mask,lambda_Wavelet,lambda_TV)

% kspace data, x, y, t
kdata = permute(kdata,[3,2,1]);

% pad to next power of 2
dimx = 2^nextpow2(size(kdata,1));
dimy = 2^nextpow2(size(kdata,2));
padsizex = round((dimx - size(kdata,1))/2);
padsizey = round((dimy - size(kdata,2))/2);
kdata = padarray(kdata,[padsizex,padsizey,0],'both');
kdata = kdata(1:dimx,1:dimy,:);

% size of the data
[nx,ny,nt,nc]=size(kdata);

% normalize the data in the range of approx 0 - 1 for better numerical stability
kdata = kdata/max(abs(kdata(:)));

% kspace mask, 0 = nodata, 1 = data, zero-pad to same size as k-space
mask = permute(mask,[3,2,1]);
mask = padarray(mask,[padsizex,padsizey,0],'both');
mask = mask(1:dimx,1:dimy,:);
mask = mask./mask;   
mask(isnan(mask)) = 1;
mask = logical(mask);

% coil sensitivity map
b1 = ones(nx,ny,nc);

% data
param.y = kdata;

% parameters for reconstruction
param.E = Emat_xyt(mask,b1); 

% Wavelet
param.W = Wavelet('Daubechies',4,4);
param.L1Weight = lambda_Wavelet;

% Total variation constraint in the temporal domain
% for 'consistency' with Bart reconstruction, TV seems to be scale empirically by a factor of 8
% only in the time domain, original Lustig code changed
param.TV = TVOP; 
param.TVWeight = lambda_TV/8;    

% number of iterations
param.nite = 5;

% display on or off
param.display = 1;

% linear reconstruction
recon_dft = param.E'*kdata;

% iterative reconstruction
% reconstruction is restarted 3 times
tic
recon_cs=recon_dft;
for n=1:4
	recon_cs = CSL1NlCg(recon_cs,param);
end
toc

% rearrange to correct orientation
image_out = flip(abs(permute(squeeze(recon_cs),[3, 2, 1])),3);

end