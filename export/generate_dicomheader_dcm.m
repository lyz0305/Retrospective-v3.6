function dicom_header = generate_dicomheader_dcm(dcmhead,parameters,frame,nr_frames,dimy,dimx,heart_rate,acq_dur)

%
% GENERATES DICOM HEADER FOR EXPORT
%
% parameters = parameters from MRD file
% frame = current frame number
% nr_frames = total number of frames
% dimy = y dimension (phase encoding, views)
% dimx = x dimension (readout, samples)
% heart_rate = average heart rate
%
%


TR = 1000*(60/heart_rate)/nr_frames;    % time between frames in ms

pixely = parameters.FOV/dimy;
pixelx = parameters.FOV/dimx;

fn = ['0000',num2str(frame)];
fn = fn(size(fn,2)-4:size(fn,2));
fname = ['cine_',fn,'.dcm'];

dt = datetime(parameters.date,'InputFormat','dd-MMM-yyyy HH:mm:ss');
year = num2str(dt.Year);
month = ['0',num2str(dt.Month)]; month = month(end-1:end);
day = ['0',num2str(dt.Day)]; day = day(end-1:end);
date = [year,month,day];

hour = ['0',num2str(dt.Hour)]; hour = hour(end-1:end);
minute = ['0',num2str(dt.Minute)]; minute = minute(end-1:end);
seconds = ['0',num2str(dt.Second)]; seconds = seconds(end-1:end);
time = [hour,minute,seconds];

dcmhead.Filename = fname;
dcmhead.FileModDate = parameters.date;
dcmhead.FileSize = dimy*dimx*2;
dcmhead.Width = dimx;
dcmhead.Height = dimy;
dcmhead.BitDepth = 15;
dcmhead.InstitutionName = 'Amsterdam UMC';
dcmhead.ReferringPhysicianName.FamilyName = 'AMC preclinical MRI';
dcmhead.StudyDescription = 'CINE';
dcmhead.InstitutionalDepartmentName = 'Amsterdam UMC preclinical MRI';
dcmhead.PhysicianOfRecord.FamilyName = 'Amsterdam UMC preclinical MRI';
dcmhead.PerformingPhysicianName.FamilyName = 'Amsterdam UMC preclinical MRI';
dcmhead.PhysicianReadingStudy.FamilyName = 'Amsterdam UMC preclinical MRI';
dcmhead.OperatorName.FamilyName = 'manager';
dcmhead.ManufacturerModelName = 'MRS7024';
dcmhead.ReferencedFrameNumber = [];  
dcmhead.PatientName.FamilyName = 'Amsterdam UMC preclinical MRI';
dcmhead.OtherPatientName.FamilyName = 'Amsterdam UMC preclinical MRI';
dcmhead.RepetitionTime = TR;     % time between frames
dcmhead.EchoTime = 2;         % approximately correct
dcmhead.InversionTime = 0;
dcmhead.ImagedNucleus = '1H';
dcmhead.MagneticFieldStrength = 7;
dcmhead.TriggerTime = (frame-1)*TR;    % frame time = frame number times calculated TR
dcmhead.AcquisitionMatrix = uint16([dimy 0 0 dimx])';
dcmhead.AcquisitionDeviceProcessingDescription = '';
dcmhead.AcquisitionDuration = acq_dur;
dcmhead.InstanceNumber = frame;          % frame number
dcmhead.TemporalPositionIdentifier = 1;
dcmhead.NumberOfTemporalPositions = 1;
dcmhead.TemporalResolution = TR;
dcmhead.ImagesInAcquisition = nr_frames;
dcmhead.TemporalPositionIndex = uint32([]);
dcmhead.Rows = dimy;
dcmhead.Columns = dimx;
dcmhead.PixelSpacing = [pixely pixelx]';
dcmhead.PixelAspectRatio = [1 1]';
dcmhead.BitsAllocated = 16;
dcmhead.BitsStored = 15;
dcmhead.HighBit = 14;
dcmhead.PixelRepresentation = 0;
dcmhead.PixelPaddingValue = 0;
dcmhead.RescaleIntercept = 0;
dcmhead.RescaleSlope = 1;
dcmhead.HeartRate = heart_rate;
dcmhead.NumberOfSlices = 1;
dcmhead.CardiacNumberOfImages = nr_frames;
dcmhead.MRAcquisitionType = '2D';
dcmhead.ScanOptions = 'CG';
dcmhead.BodyPartExamined = 'HEART';


dicom_header = dcmhead;


end


