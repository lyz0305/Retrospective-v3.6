function export_dicom(directory,movie,parameters,heart_rate,acq_dur,number_of_frames,tag)


% create folder if not exist, and clear

folder_name = [directory,[filesep,'CINE-DICOM-',tag,'-',num2str(number_of_frames),'frames']];
if (~exist(folder_name, 'dir')); mkdir(folder_name); end
delete([folder_name,filesep,'*']);


% export the dicom images

nr_frames = size(movie,1);
dimy = size(movie,2);
dimx = size(movie,3);

dcmid = dicomuid;   % unique identifier
dcmid = dcmid(1:50);

for i=1:nr_frames
    dcm_header = generate_dicomheader(parameters,i,nr_frames,dimy,dimx,heart_rate,acq_dur,dcmid);
    fn = ['0000',num2str(i)];
    fn = fn(size(fn,2)-4:size(fn,2));
    fname = [directory,filesep,'CINE-DICOM-',tag,'-',num2str(number_of_frames),'frames',filesep,'cine_',fn,'.dcm'];
    dicomwrite(squeeze(cast(round(movie(i,:,:)),'uint16')), fname, dcm_header);
end


end