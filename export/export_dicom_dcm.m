function export_dicom_dcm(dcmdir,directory,movie,parameters,heart_rate,acq_dur,number_of_frames,tag)


% create folder if not exist, and clear

folder_name = [directory,[filesep,'CINE-DICOM-',tag,'-',num2str(number_of_frames),'frames']];
if (~exist(folder_name, 'dir')); mkdir(folder_name); end
delete([folder_name,filesep,'*']);



% size of the data
nr_frames = size(movie,1);
dimy = size(movie,2);
dimx = size(movie,3);

% reading in the DICOM header information
listing = dir(fullfile(dcmdir, '*.dcm'));
dcmfilename = [listing(1).folder,filesep,listing(1).name];
base_header = dicominfo(dcmfilename);

% export the dicom images
for i=1:nr_frames
    dcm_header = generate_dicomheader_dcm(base_header,parameters,i,nr_frames,dimy,dimx,heart_rate,acq_dur);
    fn = ['0000',num2str(i)];
    fn = fn(size(fn,2)-4:size(fn,2));
    fname = [directory,filesep,'CINE-DICOM-',tag,'-',num2str(number_of_frames),'frames',filesep,'cine_',fn,'.dcm'];
    dicomwrite(squeeze(cast(round(movie(i,:,:)),'uint16')), fname, dcm_header);
end


end