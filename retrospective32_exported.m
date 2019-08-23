classdef retrospective32_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        DashboardPanel               matlab.ui.container.Panel
        LoadMRDfileButton            matlab.ui.control.Button
        DetectedratesBPMPanel        matlab.ui.container.Panel
        respbpmLabel                 matlab.ui.control.Label
        RespirationEditField         matlab.ui.control.NumericEditField
        heartbpmLabel                matlab.ui.control.Label
        HeartEditField               matlab.ui.control.NumericEditField
        windowLabel                  matlab.ui.control.Label
        RespirationWindowEditField   matlab.ui.control.NumericEditField
        RespirationWidthEditField    matlab.ui.control.NumericEditField
        HeartWidthEditField          matlab.ui.control.NumericEditField
        centerLabel                  matlab.ui.control.Label
        widthLabel                   matlab.ui.control.Label
        ResetFilterValuesButton      matlab.ui.control.Button
        Lamp1                        matlab.ui.control.Lamp
        FilterNavigatorButton        matlab.ui.control.Button
        Lamp2                        matlab.ui.control.Lamp
        SortKspaceButton             matlab.ui.control.Button
        Lamp3                        matlab.ui.control.Lamp
        ReconstructButton            matlab.ui.control.Button
        Lamp4                        matlab.ui.control.Lamp
        CSrecoparametersPanel        matlab.ui.container.Panel
        TVEditFieldLabel             matlab.ui.control.Label
        TVEditField                  matlab.ui.control.NumericEditField
        WaveletEditFieldLabel        matlab.ui.control.Label
        WaveletEditField             matlab.ui.control.NumericEditField
        recoEditFieldLabel           matlab.ui.control.Label
        RecoEditField                matlab.ui.control.EditField
        ExportDicomButton            matlab.ui.control.Button
        Lamp5                        matlab.ui.control.Lamp
        CinePanel                    matlab.ui.container.Panel
        framesEditFieldLabel         matlab.ui.control.Label
        FramesEditField              matlab.ui.control.NumericEditField
        movieDropDownLabel           matlab.ui.control.Label
        movieDropDown                matlab.ui.control.DropDown
        ExitButton                   matlab.ui.control.Button
        ExportGIFButton              matlab.ui.control.Button
        Lamp6                        matlab.ui.control.Lamp
        SelfgatedCardiacMRIReconstructorLabel  matlab.ui.control.Label
        AcquisitionparametersPanel   matlab.ui.container.Panel
        NyEditFieldLabel             matlab.ui.control.Label
        NyViewField                  matlab.ui.control.NumericEditField
        NxEditFieldLabel             matlab.ui.control.Label
        NxViewField                  matlab.ui.control.NumericEditField
        klinesrepetitionLabel        matlab.ui.control.Label
        KlinesRepetitionViewField    matlab.ui.control.NumericEditField
        repetitionsLabel             matlab.ui.control.Label
        RepetitionsViewField         matlab.ui.control.NumericEditField
        klinesLabel                  matlab.ui.control.Label
        NrKlinesViewField            matlab.ui.control.NumericEditField
        scantimeminLabel             matlab.ui.control.Label
        AcquisitionTimeMinViewField  matlab.ui.control.NumericEditField
        DataFile                     matlab.ui.control.TextArea
        datafileLabel                matlab.ui.control.Label
        averagesEditFieldLabel       matlab.ui.control.Label
        AveragesViewField            matlab.ui.control.NumericEditField
        fillingLabel                 matlab.ui.control.Label
        FillingViewField             matlab.ui.control.NumericEditField
        TRmsLabel                    matlab.ui.control.Label
        TRViewField                  matlab.ui.control.NumericEditField
        trajectoryEditFieldLabel     matlab.ui.control.Label
        TrajectoryViewField          matlab.ui.control.EditField
        TrajectoryFig                matlab.ui.control.UIAxes
        AmsterdamUMCGustavStrijkersVersion32Aug2019Label  matlab.ui.control.Label
        NavigatorPanel               matlab.ui.container.Panel
        RawNavFig                    matlab.ui.control.UIAxes
        SpectrumFig                  matlab.ui.control.UIAxes
        primaryLabel                 matlab.ui.control.Label
        NavigatorEndEditField        matlab.ui.control.NumericEditField
        pointsLabel                  matlab.ui.control.Label
        NavigatorNRPointsEditField   matlab.ui.control.NumericEditField
        FlipSwitchLabel              matlab.ui.control.Label
        NavigatorFlipSwitch          matlab.ui.control.ToggleSwitch
        NavigatorLabel               matlab.ui.control.Label
        NavigatoranalysisPanel       matlab.ui.container.Panel
        CardiacNavFig                matlab.ui.control.UIAxes
        RespirationNavFig            matlab.ui.control.UIAxes
        HeartRateTimeFig             matlab.ui.control.UIAxes
        RespirationRateTimeFig       matlab.ui.control.UIAxes
        startEditFieldLabel          matlab.ui.control.Label
        StartEditField               matlab.ui.control.NumericEditField
        rangeEditFieldLabel          matlab.ui.control.Label
        RangeEditField               matlab.ui.control.NumericEditField
        DisplayrangeLabel            matlab.ui.control.Label
        StartSlider                  matlab.ui.control.Slider
        RangeSlider                  matlab.ui.control.Slider
        WindowCheckBox               matlab.ui.control.CheckBox
        startEditFieldLabel_2        matlab.ui.control.Label
        WindowStartEditField         matlab.ui.control.NumericEditField
        endLabel                     matlab.ui.control.Label
        WindowEndEditField           matlab.ui.control.NumericEditField
        WindowStartSlider            matlab.ui.control.Slider
        WindowEndSlider              matlab.ui.control.Slider
        MoviePanel                   matlab.ui.container.Panel
        PlayButton                   matlab.ui.control.Button
        StopButton                   matlab.ui.control.Button
        frameLabel                   matlab.ui.control.Label
        MovieFrameEditField          matlab.ui.control.NumericEditField
        intensityscalingLabel        matlab.ui.control.Label
        MovieScaleSlider             matlab.ui.control.Slider
        ccButton                     matlab.ui.control.Button
        ccwButton                    matlab.ui.control.Button
        RotateLabel                  matlab.ui.control.Label
        FrameIncrButton              matlab.ui.control.Button
        FrameLabel                   matlab.ui.control.Label
        FrameDecrButton              matlab.ui.control.Button
        heartbpmLabel_2              matlab.ui.control.Label
        FinalHeartViewField          matlab.ui.control.NumericEditField
        respbpmLabel_2               matlab.ui.control.Label
        FinalRespirationViewField    matlab.ui.control.NumericEditField
        Image2                       matlab.ui.control.Image
        MovieFig                     matlab.ui.control.UIAxes
        Image3                       matlab.ui.control.Image
    end


    
    % RETROSPECTIVE TRIGGERING RECONSTRUCTION
    %
    % Gustav Strijkers / Bram Coolen
    % Academic Medical Center (AMC)
    % Amsterdam, the Netherlands
    % g.j.strijkers@amc.uva.nl / b.f.coolen@amc.uva.nl
    %
    %
    %
    % Version: July 29, 2019
    % Matlab 2019a
    %
    %
    % Version 2.1 changes:
    %
    % - Cleaned-up the code
    % - GIF export file name now includes the number of frames
    % - Automatically start sorting k-space when the number of frames is changed
    % - Added buttons to rotate movie
    % - Added buttons to shift movie in the frame/time dimension
    % - Animated gif export image intensity is scaled by the intensity scaling slider
    % - Trajectory figure added
    % - Full x-scale in plot windows
    % - Added sliders to adjust navigator view range
    % - Parameter no_effective_views is now obsolete
    % 
    % Version 3.0 changes:
    %
    % - Added a matlab Conjugadient Gradient method for CS-reconstruction without Bart toolbox
    % 
    % Version 3.1 changes:
    %
    % - Added the possibility to reconstruction a respiratory CINE
    % - Corrected a bug in the calculation of the total acquisition time
    % - Added the possibility to reconstruct only part of the data
    % - Added detected respiration and heart rate markers and values in navigator power spectrum 
    % - Bug fixed number_of_cardiac frames
    % - Improved check on correct loading of MRD file
    % - Cleaned up the code
    %
    % Version 3.2 changes:
    %
    % - Added edit fields for cardiac and respiratory filter values
    % - Fixed an issue with the image size of the movie in the app
    %
    
    
        
   
    % global variables within the app
    properties (Access = private)
        
        datafile                    % mrd data file
        data                        % raw mrd data
        dimensions                  % mrd data matrix dimensions
        parameters                  % mrd meta data
        dimx                        % nr readout points
        dimy                        % nr phase encoding points
        TR                          % repetition time
        acq_dur                     % total acquisition time
        traject_nr                  % trajectory type (0,2,3)
        nr_ksteps                   % number of phase encoding steps in 1 repetition
        nr_klines                   % total number of k-lines
        nr_nav                      % navigator point
        nr_repetitions              % nr of k-space repetitions
        nav_discarded               % number of discarded k-space points between nav and echo
        nav_points_used             % nr of used navigator point
        nav_amplitude               % navigator amplitude
        nav_phase                   % navigator phase
        intensity_scaling           % movie intensity scaling factor
        detectedHR                  % detected heart rate
        heartrate                   % final average heart rate
        detectedRR                  % detected respiratory rate
        resprate                    % final respiratory rate
        heart_bandwidth             % heart rate filter bandwidth
        resp_bandwidth              % respiration rate filter bandwidth
        resp_percentage             % respiration percentage discarded
        resp_window                 % respiration window
        filterorder                 % order of the butterworth filter
        nav_heart                   % filtered heart navigation signal
        nav_resp                    % filtered respiration navigator signal
        splinefactor                % spline interpolation factor
        hpks                        % cardiac trigger points
        rpks                        % respiratory trigger points
        hlocs                       % cardiac trigger point locations
        rlocs                       % respiratory trigger point locations
        nr_frames                   % desired number of movie frames
        kspace                      % the final sorted and normalized k-space
        averages                    % matrix with the number of averages per k-line
        movie                       % movie
        cs_movie                    % compressed sensing movie
        stopmovie                   % flag to stop the movie
        tag                         % filename tag for dicom export
        mrd_import_path             % mrd import path
        dicom_export_path           % dicom export path
        gif_export_path             % gif export path
        bart_detected               % bart toolbox available: true or false
        dwin1                       % datawindow in heartrate plot
        dwin2                       % datawindow in respirationrate plot
        frequency                   % frequency range of power spectrum of navigator
        powerspectrum               % power spectrum of the navigator
        repstart                    % data-window start in units of k-space repetitions 
        repend                      % data-window end in units of k-space repetitions 
        kstart                      % data-window start in units of k-space samples 
        kend                        % data-window end in units of k-space samples 
                
    end
        
    
    
    methods (Access = public)
        
        % image acquisition data parameters
        function results = DataParametersFcn(app)
            
            app.traject_nr = app.parameters.pe1_order;                                  % k-space trajectroy:  2 = zigzag,  3 = from input array
            app.nr_repetitions = app.dimensions(1);                                     % nr k-space repetitions
            app.repstart = 2;                                                           % repetition 1 is discarded (transient)
            app.repend = app.nr_repetitions;                                            % can be adapated to reconstruct part of the data
            app.nav_discarded = 45-app.nr_nav;                                          % additionally discarded k-space samples (during phase encoding / readout dephaser)
            app.dimx = app.dimensions(6) - app.nr_nav - app.nav_discarded;              % nr readout points (no_samples)
            app.TR = app.parameters.tr;                                                 % repetition time [ms]
            app.splinefactor = 60;                                                      % data interpolation factor to prevent navigator discretization by TR
            [~,app.tag,~] = fileparts(app.datafile);                                    % dicomexport filename tag
            app.intensity_scaling = 0.75;                                               % intensity scaling for movie
            app.heart_bandwidth = app.HeartWidthEditField.Value;                        % cardiac bandpass filter bandwidth, default = 150
            app.resp_bandwidth = app.RespirationWidthEditField.Value;                   % respiratory bandpass filter bandwidth, default = 20
            app.resp_percentage = app.RespirationWindowEditField.Value;                 % percentage of data discarded during respiration, default = 30%
            app.filterorder = 4;                                                        % butterworth filter order
            app.nr_frames = app.FramesEditField.Value;                                  % default number of cardiac frames
                        
            switch app.traject_nr
                case 0
                    app.TrajectoryViewField.Value = 'linear';
                    app.dimy = app.parameters.NO_VIEWS;                                 % nr phase encoding steps (no_views)
                    app.nr_ksteps = app.dimy;                                           % nr k-space points per repetition = nr phase encoding steps
                    app.nr_klines = app.nr_repetitions*app.dimy;                        % total number of k-lines that are measured
                    plot(app.TrajectoryFig, linear_trajectory(app.dimy));               % plot the trajectory
                    xlim(app.TrajectoryFig,[1 length(linear_trajectory(app.dimy))-1]);
                case 2
                    app.TrajectoryViewField.Value = 'zigzag';
                    app.dimy = app.parameters.NO_VIEWS;                                 % nr phase encoding steps (no_views)
                    app.nr_ksteps = app.dimy;                                           % nr k-space points per repetition = nr phase encoding steps
                    app.nr_klines = app.nr_repetitions*app.dimy;                        % total number of k-lines that are measured
                    plot(app.TrajectoryFig, zigzag_trajectory(app.dimy));               % plot the trajectory
                    xlim(app.TrajectoryFig,[1 length(zigzag_trajectory(app.dimy))-1]);
                case 3
                    app.TrajectoryViewField.Value = 'user defined';
                    app.dimy = max(app.parameters.gp_var_mul)-min(app.parameters.gp_var_mul)+1;     % effective nr phase encoding steps (no_effective_views)
                    app.nr_ksteps = app.parameters.NO_VIEWS;                                        % nr k-space trajectory points (no_views) in table
                    app.nr_klines = app.nr_repetitions*app.nr_ksteps;                               % total number of k-lines that are measured
                    plot(app.TrajectoryFig, array_trajectory(app.parameters));                      % plot the trajectory
                    xlim(app.TrajectoryFig,[1 length(array_trajectory(app.parameters))-1]);
            end
            
            % total acquisition time in seconds
            app.acq_dur = app.nr_klines*app.TR/1000;                
            
            % display the acquisitionparameters
            app.NyViewField.Value = app.dimy;
            app.NxViewField.Value = app.dimx;
            app.KlinesRepetitionViewField.Value = app.nr_ksteps;
            app.RepetitionsViewField.Value = app.nr_repetitions;
            app.NrKlinesViewField.Value = app.nr_klines;
            app.TRViewField.Value = app.TR;
            app.AcquisitionTimeMinViewField.Value = app.acq_dur/60;
            
            % define the ranges of the display range sliders
            app.StartSlider.Limits = [1, app.nr_klines-1];
            app.RangeSlider.Value = 600;
            
            % data window limits
            app.WindowStartEditField.Limits = [0,round(app.acq_dur)];
            app.WindowStartSlider.Limits = [0,round(app.acq_dur)];
            app.WindowEndEditField.Limits = [0,round(app.acq_dur)];
            app.WindowEndSlider.Limits = [0,round(app.acq_dur)];
            app.WindowStartEditField.Value = 0;
            app.WindowStartSlider.Value = 0;
            app.WindowEndEditField.Value = round(app.acq_dur);
            app.WindowEndSlider.Value = round(app.acq_dur);
                        
        end
        
        
        % plot the raw navigator signals
        function results = PlotRawNavigatorFcn(app)
            
            trace1 = detrend(app.nav_amplitude(app.StartEditField.Value:app.StartEditField.Value+app.RangeEditField.Value-1));
            maxplt = max(trace1);
            minplt = min(trace1);
            
            plot(app.RawNavFig, trace1);
            xlim(app.RawNavFig, [0 length(trace1)]);
            ylim(app.RawNavFig, [1.1*minplt 1.1*maxplt]);
            drawnow;
                        
        end
        
        
        % plot the navigator with cardiac filtering
        function results = PlotCardiacNavigatorFcn(app)
                        
            cla(app.CardiacNavFig);
            hold(app.CardiacNavFig,'on');
            
            % detrend offset
            trace1 = detrend(app.nav_amplitude(app.StartEditField.Value:app.StartEditField.Value+app.RangeEditField.Value-1));  
            trace2 = detrend(app.nav_heart(app.StartEditField.Value:app.StartEditField.Value+app.RangeEditField.Value-1));      
                                    
            % plot the raw navigator
            plot(app.CardiacNavFig, trace1);
            
            % plot the navigator filtered for cardiac motion
            plot(app.CardiacNavFig, trace2,'LineWidth',2);
            
            % set plot axes
            maxplt = 1.1*max(trace1);
            minplt = 1.1*min(trace1);
            xlim(app.CardiacNavFig, [0 length(trace1)]);
            ylim(app.CardiacNavFig, [minplt maxplt]);
            
            hold(app.CardiacNavFig,'off');
            drawnow;
            
        end
        
        
        % Plot the navigator with respiratory filtering
        function results = PlotRespirationNavigatorFcn(app)
            
            cla(app.RespirationNavFig);
            hold(app.RespirationNavFig,'on');
            
            % detrend offset
            trace1 = detrend(app.nav_amplitude(app.StartEditField.Value:app.StartEditField.Value+app.RangeEditField.Value-1));   
            trace2 = detrend(app.nav_resp(app.StartEditField.Value:app.StartEditField.Value+app.RangeEditField.Value-1));  
            
            % Plot respiratory window masks in transparent red
            maxplt = 1.1*max(trace1);
            minplt = 1.1*min(trace1);
            for i=app.StartEditField.Value:app.StartEditField.Value+app.RangeEditField.Value-1
                if app.resp_window(i)==1 
                    win=plot(app.RespirationNavFig,[i-app.StartEditField.Value,i-app.StartEditField.Value],[minplt,maxplt],'red','LineWidth',1); 
                    win.Color(4) = 0.1; % transparancy
                end
            end
                        
            % Plot raw navigator
            plot(app.RespirationNavFig, trace1);
            
            % Plot navigator signal filtered for respiratory motion
            plot(app.RespirationNavFig, trace2,'LineWidth',3);
            
            % set plot axes
            xlim(app.RespirationNavFig, [0 length(trace1)]);
            ylim(app.RespirationNavFig, [minplt maxplt]);
            
            hold(app.RespirationNavFig,'off'); 
            drawnow;
            
        end
             
        
        % Plot the current movie frame        
        function results = PlotCurrentMovieFrameFcn(app)
                    
            scale = 32767*app.intensity_scaling;
            app.MovieFig.Position = [214,9,260,260];
            [dx,dy]=size(squeeze(app.movie(:,:,app.MovieFrameEditField.Value)));
            xlim(app.MovieFig,[1,dx]);
            ylim(app.MovieFig,[1,dy]);
            imshow(squeeze(app.movie(:,:,app.MovieFrameEditField.Value)),[0,round(scale*app.MovieScaleSlider.Value)],'Parent',app.MovieFig);
            drawnow;
            
        end
        
        
        % Plot the data window in time-heartrate and time-respirationrate plots 
        function results = PlotDataWindowFcn(app)
            
            % Delete previous windows
            delete(app.dwin1); 
            delete(app.dwin2);
                    
            if app.WindowCheckBox.Value == true
                % Time-heartrate plot
                hold(app.HeartRateTimeFig,'on');
                pgon = polyshape([app.WindowStartEditField.Value app.WindowStartEditField.Value app.WindowEndEditField.Value app.WindowEndEditField.Value],[5 995 995 5]);
                app.dwin1 = plot(app.HeartRateTimeFig, pgon,'FaceColor','green','FaceAlpha',0.15,'LineStyle','none');
                axis(app.HeartRateTimeFig,[0 app.TR*app.hlocs(end)/1000 0 1000]);
                hold(app.HeartRateTimeFig,'off');
                drawnow;
                
                % Time-respirationrate plot
                hold(app.RespirationRateTimeFig,'on');
                pgon = polyshape([app.WindowStartEditField.Value app.WindowStartEditField.Value app.WindowEndEditField.Value app.WindowEndEditField.Value],[0.5 99.5 99.5 0.5]);
                app.dwin2 = plot(app.RespirationRateTimeFig, pgon,'FaceColor','green','FaceAlpha',0.15,'LineStyle','none');
                axis(app.RespirationRateTimeFig,[0 app.TR*app.rlocs(end)/1000 0 100]);
                hold(app.RespirationRateTimeFig,'off');
                drawnow;
                
                % Adjust the acquisition paramters
                new_number_of_repetitions = round(1000*app.WindowEndEditField.Value/(app.TR*app.nr_ksteps))-ceil(1000*(app.WindowStartEditField.Value+0.001)/(app.TR*app.nr_ksteps))+1;
                app.RepetitionsViewField.Value = new_number_of_repetitions;
                app.NrKlinesViewField.Value = new_number_of_repetitions * app.KlinesRepetitionViewField.Value;
                app.AcquisitionTimeMinViewField.Value = app.NrKlinesViewField.Value * (app.TR/1000) / 60;
            else
                % Reset the acquisition parameters
                app.RepetitionsViewField.Value = app.nr_repetitions;
                app.NrKlinesViewField.Value = app.nr_klines;
                app.AcquisitionTimeMinViewField.Value = app.acq_dur/60;
            end
                      
        end
         
        
        % Calculates the power spectrum of the raw navigator signal within the boundaries of the data-window
        function results = CalculateNavigatorSpectrumFcn(app)
            
            % calculate the data-window in terms of k-space samples
            if app.WindowCheckBox.Value == true
                app.kstart = ceil(1000*(app.WindowStartEditField.Value+0.001)/app.TR);
                app.kend = round(1000*(app.WindowEndEditField.Value)/app.TR);
                if app.kend > app.nr_klines
                    app.kend = app.nr_klines;
                end
            else % full range
                app.kstart = 1;
                app.kend = app.nr_klines;
            end
            
            % calculate the data-window in units of k-space repetitions
            app.repstart = ceil(app.kstart/app.nr_ksteps);
            app.repend = round(app.kend/app.nr_ksteps);
            
            % determine the power spectrum of the navigator
            [app.detectedHR,app.detectedRR,app.powerspectrum,app.frequency] = determine_power_spectrum(app.nav_amplitude,app.TR,app.dimy,app.kstart,app.kend);
            
            % update the detected heartrate and respirationrate fields
            app.HeartEditField.Value = app.detectedHR;
            app.RespirationEditField.Value = app.detectedRR;
            
        end
        
        
        % Plots the power spectrum of the raw navigator signal
        function results = PlotNavigatorSpectrumFcn(app)
            
            % plot power spectrum
            cla(app.SpectrumFig);
            hold(app.SpectrumFig,'on');
            plot(app.SpectrumFig,app.frequency,app.powerspectrum);
            ymax = 1.1*max(app.powerspectrum(5:800));
            ymin = -0.05*ymax;
            xlim(app.SpectrumFig, [5 800]);
            ylim(app.SpectrumFig, [ymin, ymax]);
            
            % plot the butter filter for cardiac motion filtering
            flt = filter_shape(app.TR,app.detectedHR,app.heart_bandwidth,app.filterorder); % heart filter shape
            pgon = polyshape(flt(:,1),ymax*flt(:,2));
            area(app.SpectrumFig,flt(:,1),0.95*ymax*flt(:,2),'FaceColor','green','FaceAlpha',0.1,'EdgeColor','green','LineStyle', 'none');
            plot(app.SpectrumFig,[app.detectedHR,app.detectedHR],[0,ymax],'green','LineWidth',1,'LineStyle','--'); 
            text(app.SpectrumFig,app.detectedHR+10,0.9*ymax,[num2str(app.detectedHR),' bpm']);
            
            % plot the butter filter for the repiration motion filtering
            flt = filter_shape(app.TR,app.detectedRR,app.resp_bandwidth,app.filterorder); % resp filter shape
            pgon = polyshape(flt(:,1),ymax*flt(:,2));
            area(app.SpectrumFig,flt(:,1),0.95*ymax*flt(:,2),'FaceColor','green','FaceAlpha',0.1,'EdgeColor','green','LineStyle', 'none');
            plot(app.SpectrumFig,[app.detectedRR,app.detectedRR],[0,ymax],'green','LineWidth',1,'LineStyle','--'); 
            text(app.SpectrumFig,app.detectedRR+10,0.9*ymax,[num2str(app.detectedRR),' bpm']);
            
            hold(app.SpectrumFig,'off');
            drawnow;
         
        end
        
        
    end


    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function StartupFcn(app)
            
            % start the parallel pool if it is not running already
            p = gcp('nocreate');
            if isempty(p) 
                parpool; 
            end
            
            % empty file import and export paths
            app.mrd_import_path = '';
            app.dicom_export_path = '';
            app.gif_export_path = '';
            
            % add the bart path to the environment variable if available
            app.bart_detected = false;
            if (~isdeployed)
                if isfile('bartpath.txt')
                    app.bart_detected = true;
                    app.RecoEditField.Value = 'BART';
                    setenv('TOOLBOX_PATH', fileread('bartpath.txt'));
                end
            end
            
            % add subfolders to search path
            if (~isdeployed)
                addpath(genpath(pwd));
            end
            
            % disable unnecessary warnings
            warning off;
            
            % set buttons
            app.LoadMRDfileButton.Enable = 'on';
            drawnow;
                    
        end

        % Callback function: DataFile, LoadMRDfileButton
        function LoadMRDfileButtonPushed(app, event)
            
            % Indicate busy
            app.Lamp1.Color = 'Yellow';
            app.Lamp2.Color = 'Red';
            app.Lamp3.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp5.Color = 'Red';
            app.Lamp6.Color = 'Red';
            app.LoadMRDfileButton.Enable = 'off';
            app.NavigatorEndEditField.Enable = 'off';
            app.NavigatorNRPointsEditField.Enable = 'off';
            app.NavigatorFlipSwitch.Enable = 'off';
            app.HeartEditField.Enable = 'off';
            app.RespirationEditField.Enable = 'off';
            app.HeartWidthEditField.Enable = 'off';
            app.RespirationWidthEditField.Enable = 'off';
            app.ResetFilterValuesButton.Enable = 'off';
            app.FilterNavigatorButton.Enable = 'off';
            app.StartEditField.Enable = 'off';
            app.RangeEditField.Enable = 'off';
            app.StartSlider.Enable = 'off';
            app.RangeSlider.Enable = 'off';
            app.WindowCheckBox.Enable = 'off';
            app.WindowStartEditField.Enable = 'off';
            app.WindowStartSlider.Enable = 'off';
            app.WindowEndEditField.Enable = 'off';
            app.WindowEndSlider.Enable = 'off';
            app.FramesEditField.Enable = 'off';
            app.movieDropDown.Enable = 'off';
            app.SortKspaceButton.Enable = 'off';
            app.WaveletEditField.Enable = 'off';
            app.TVEditField.Enable = 'off';
            app.ReconstructButton.Enable = 'off';
            app.ExportDicomButton.Enable = 'off';
            app.ExportGIFButton.Enable = 'off';
            app.PlayButton.Enable = 'off';
            app.StopButton.Enable = 'off'; 
            app.MovieFrameEditField.Enable = 'off';
            app.MovieScaleSlider.Enable = 'off';
            app.ccButton.Enable = 'off';
            app.ccwButton.Enable = 'off';
            app.FrameIncrButton.Enable = 'off';
            app.FrameDecrButton.Enable = 'off';
            app.WindowCheckBox.Value = false;
            drawnow;
            
            % Select a MRD file
            app.UIFigure.Visible = 'off';
            [mrdfile,app.mrd_import_path] = uigetfile([app.mrd_import_path,'*.MRD']);
            app.UIFigure.Visible = 'on';
            
            validfile = false;
            
            if ischar(mrdfile)
                % MRD file selected
                app.DataFile.Value = mrdfile;
                app.datafile = [app.mrd_import_path,mrdfile];
                
                % Load the data
                [app.data,app.dimensions,app.parameters] = Get_mrd_3D4(app.datafile,'seq','cen');
                
                % check if the data is a valid file with a motion navigator acquisition
                if isfield(app.parameters,'slice_nav')
                    if app.parameters.slice_nav == 1 & app.parameters.no_samples_nav > 0
                        app.nr_nav = app.parameters.no_samples_nav;                     % initial number of navigator points
                        DataParametersFcn(app);                                         % determine all data parameters
                        NavPointEditFieldValueChanged(app, event);
                        validfile = true;
                    end
                end
            end
                
            if validfile
                % reset buttons
                app.Lamp1.Color = 'Green';
                app.Lamp2.Color = 'Red';
                app.Lamp3.Color = 'Red';
                app.Lamp4.Color = 'Red';
                app.Lamp4.Color = 'Red';
                app.Lamp5.Color = 'Red';
                app.Lamp6.Color = 'Red';
                app.LoadMRDfileButton.Enable = 'on';
                app.NavigatorEndEditField.Enable = 'on';
                app.NavigatorNRPointsEditField.Enable = 'on';
                app.NavigatorFlipSwitch.Enable = 'on';
                app.HeartEditField.Enable = 'on';
                app.RespirationEditField.Enable = 'on';
                app.HeartWidthEditField.Enable = 'on';
                app.RespirationWidthEditField.Enable = 'on';
                app.RespirationWindowEditField.Enable = 'on';
                app.ResetFilterValuesButton.Enable = 'on';
                app.FilterNavigatorButton.Enable = 'on';
                app.StartEditField.Enable = 'off';
                app.RangeEditField.Enable = 'off';
                app.StartSlider.Enable = 'off';
                app.RangeSlider.Enable = 'off';
                app.FramesEditField.Enable = 'off';
                app.movieDropDown.Enable = 'off';
                app.SortKspaceButton.Enable = 'off';
                app.WaveletEditField.Enable = 'off';
                app.TVEditField.Enable = 'off';
                app.ReconstructButton.Enable = 'off';
                app.ExportDicomButton.Enable = 'off';
                app.ExportGIFButton.Enable = 'off';
                app.PlayButton.Enable = 'off';
                app.StopButton.Enable = 'off';
                app.MovieFrameEditField.Enable = 'off';
                app.MovieScaleSlider.Enable = 'off';
                app.ccButton.Enable = 'off';
                app.ccwButton.Enable = 'off';
                app.FrameIncrButton.Enable = 'off';
                app.FrameDecrButton.Enable = 'off';
                app.ExitButton.Enable = 'on';
                app.stopmovie = true;  
                drawnow;
            else                
                % not a valid MRD file with navigator
                f = app.UIFigure;
                uialert(f,'Please select a valid MRD file','Error');
                app.mrd_import_path = '';
                app.LoadMRDfileButton.Enable = 'on';
                app.Lamp1.Color = 'Red';
            end
            
        end

        % Value changed function: NavigatorEndEditField, 
        % NavigatorFlipSwitch, NavigatorNRPointsEditField
        function NavPointEditFieldValueChanged(app, event)
            
            % update the used navigator point and the number of navigator points used
            if app.NavigatorNRPointsEditField.Value > app.NavigatorEndEditField.Value 
                app.NavigatorNRPointsEditField.Value = app.NavigatorEndEditField.Value; 
            end
            app.nr_nav = app.NavigatorEndEditField.Value;
            app.nav_points_used = app.NavigatorNRPointsEditField.Value;
            
            % update the data parameters
            DataParametersFcn(app);
            
            % switch the data-window off
            app.WindowCheckBox.Value = false;
            PlotDataWindowFcn(app);
            
            % determine the value of the switch to flip the navigator 
            switch app.NavigatorFlipSwitch.Value
                case 'Up'
                    pos_min = 1;
                case 'Down'
                    pos_min = -1;
            end
                                    
            % extract the navigator signals
            [app.nav_amplitude,app.nav_phase] = extractnavigator(app.data,app.nr_nav,app.nav_points_used,pos_min);
                        
            % plot the raw navigator signal
            PlotRawNavigatorFcn(app);
                        
            % determine and plot the power spectrum of the raw navigator signal
            CalculateNavigatorSpectrumFcn(app);
            PlotNavigatorSpectrumFcn(app);
                      
            % reset buttons
            app.Lamp1.Color = 'Green';
            app.Lamp2.Color = 'Red';
            app.Lamp3.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp5.Color = 'Red';
            app.Lamp6.Color = 'Red';
            app.NavigatorEndEditField.Enable = 'on';
            app.NavigatorNRPointsEditField.Enable = 'on';
            app.NavigatorFlipSwitch.Enable = 'on';
            app.HeartEditField.Enable = 'on';
            app.RespirationEditField.Enable = 'on';
            app.HeartWidthEditField.Enable = 'on';
            app.RespirationWidthEditField.Enable = 'on';
            app.RespirationWindowEditField.Enable = 'on';
            app.ResetFilterValuesButton.Enable = 'on';
            app.FilterNavigatorButton.Enable = 'on';
            app.StartEditField.Enable = 'off';
            app.RangeEditField.Enable = 'off';
            app.StartSlider.Enable = 'off';
            app.RangeSlider.Enable = 'off';
            app.WindowCheckBox.Enable = 'off';
            app.WindowStartEditField.Enable = 'off';
            app.WindowStartSlider.Enable = 'off';
            app.WindowEndEditField.Enable = 'off';
            app.WindowEndSlider.Enable = 'off';
            app.FramesEditField.Enable = 'off';
            app.movieDropDown.Enable = 'off';
            app.SortKspaceButton.Enable = 'off';
            app.WaveletEditField.Enable = 'off';
            app.TVEditField.Enable = 'off';
            app.ReconstructButton.Enable = 'off';
            app.ExportDicomButton.Enable = 'off';
            app.ExportGIFButton.Enable = 'off';
            app.PlayButton.Enable = 'off';
            app.StopButton.Enable = 'off';
            app.MovieFrameEditField.Enable = 'off';
            app.MovieScaleSlider.Enable = 'off';
            app.ccButton.Enable = 'off';
            app.ccwButton.Enable = 'off';
            app.FrameIncrButton.Enable = 'off';
            app.FrameDecrButton.Enable = 'off';
            app.ExitButton.Enable = 'on';
            app.stopmovie = true;  
            drawnow;
            
        end

        % Value changed function: HeartEditField, 
        % HeartWidthEditField, RespirationEditField, 
        % RespirationWidthEditField, RespirationWindowEditField
        function FilterEditFieldValueChanged(app, event)
            
            app.detectedHR = app.HeartEditField.Value;
            app.heart_bandwidth = app.HeartWidthEditField.Value;
            app.detectedRR = app.RespirationEditField.Value;
            app.resp_bandwidth = app.RespirationWidthEditField.Value;
            app.resp_percentage = app.RespirationWindowEditField.Value;
            
            FilterNavigatorButtonPushed(app, event);
            PlotNavigatorSpectrumFcn(app);
            
        end

        % Button pushed function: ResetFilterValuesButton
        function ResetFilterValuesButtonPushed(app, event)
            
            % reset filter values
            app.heart_bandwidth = 100;
            app.HeartWidthEditField.Value = 100;                        
            app.resp_bandwidth = 20;
            app.RespirationWidthEditField.Value = 20;                   
            app.resp_percentage = 30;
            app.RespirationWindowEditField.Value = 30;                 
            
            CalculateNavigatorSpectrumFcn(app);
            FilterNavigatorButtonPushed(app, event);
            PlotNavigatorSpectrumFcn(app);
        
        end

        % Button pushed function: FilterNavigatorButton
        function FilterNavigatorButtonPushed(app, event)
            
            % indicate busy
            app.Lamp1.Color = 'Green';
            app.Lamp2.Color = 'Yellow';
            app.Lamp3.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp5.Color = 'Red';
            app.Lamp6.Color = 'Red';
            app.LoadMRDfileButton.Enable = 'off';
            app.NavigatorEndEditField.Enable = 'off';
            app.NavigatorNRPointsEditField.Enable = 'off';
            app.StartEditField.Enable = 'off';
            app.RangeEditField.Enable = 'off';
            app.StartSlider.Enable = 'off';
            app.RangeSlider.Enable = 'off';
            app.WindowCheckBox.Enable = 'off';
            app.WindowStartEditField.Enable = 'off';
            app.WindowStartSlider.Enable = 'off';
            app.WindowEndEditField.Enable = 'off';
            app.WindowEndSlider.Enable = 'off';
            app.NavigatorFlipSwitch.Enable = 'off';
            app.HeartEditField.Enable = 'off';
            app.RespirationEditField.Enable = 'off';
            app.HeartWidthEditField.Enable = 'off';
            app.RespirationWidthEditField.Enable = 'off';
            app.RespirationWindowEditField.Enable = 'off';
            app.ResetFilterValuesButton.Enable = 'off';
            app.FilterNavigatorButton.Enable = 'off';
            app.FramesEditField.Enable = 'off';
            app.movieDropDown.Enable = 'off';
            app.SortKspaceButton.Enable = 'off';
            app.WaveletEditField.Enable = 'off';
            app.TVEditField.Enable = 'off';
            app.ReconstructButton.Enable = 'off';
            app.ExportDicomButton.Enable = 'off';
            app.ExportGIFButton.Enable = 'off';
            app.PlayButton.Enable = 'off';
            app.StopButton.Enable = 'off'; 
            app.MovieFrameEditField.Enable = 'off';
            app.MovieScaleSlider.Enable = 'off';
            app.ccButton.Enable = 'off';
            app.ccwButton.Enable = 'off';
            app.FrameIncrButton.Enable = 'off';
            app.FrameDecrButton.Enable = 'off';
            drawnow;
                        
            % filter for cardiac motion
            app.nav_heart = filter_nav_bp(app.nav_amplitude,app.TR,app.detectedHR,app.heart_bandwidth,app.filterorder);
                       
            % filter for respiratory motion
            app.nav_resp = filter_nav_bp(app.nav_amplitude,app.TR,app.detectedRR,app.resp_bandwidth,app.filterorder);
            
            % extract cardiac trigger points
            [app.hpks,app.hlocs]=trigpoints(app.nav_heart,app.TR,app.detectedHR,app.splinefactor);
            hr = heartrate(app.hlocs,app.TR);
            hrf = filter_lp(hr,app.TR,50);
            
            % determine the mean cardiac rate in the data-window
            idx1 = find(app.TR*app.hlocs(1:end)'/1000 > app.WindowStartEditField.Value);     % find the start index, since the window is defined in seconds
            idx2 = find(app.TR*app.hlocs(1:end)'/1000 > app.WindowEndEditField.Value);       % find the end index, since the window is defined in seconds
            if isempty(idx2) | idx2>size(hr,2)                                              % when the data-window has the full range the index is not found
                idx2 = size(hr,2);                                                          % in that case index = last index of the heartrate array
            end
            app.heartrate = mean(hr(idx1(1):idx2(1)));                                 % take the mean of the heartrate only within the boundaries of the data-window
            app.FinalHeartViewField.Value = round(app.heartrate);                      % display the heartrate next to the movie
            
            % show the time-heartrate plot
            cla(app.HeartRateTimeFig);
            hold(app.HeartRateTimeFig,'on');
            plot(app.HeartRateTimeFig, app.TR*app.hlocs(1:end-1)'/1000, hr);                  % heartrate   
            plot(app.HeartRateTimeFig, app.TR*app.hlocs(1:end-1)'/1000, hrf,'LineWidth',3);   % trend line
            axis(app.HeartRateTimeFig,[0 app.TR*app.hlocs(end)/1000 0 1000]);
            hold(app.HeartRateTimeFig,'off');
            drawnow;
            
            % extract respiratory trigger points
            [app.rpks,app.rlocs]=trigpoints(app.nav_resp,app.TR,app.detectedRR,app.splinefactor);
            resp = resprate(app.rlocs,app.TR);
            respf = filter_lp(resp,app.TR,150);
            app.resp_window = respiratory_window(app.rlocs,mean(respf),app.resp_percentage,app.TR,app.nr_klines);
            
            % determine the mean respiration rate in the data-window
            idx1 = find(app.TR*app.rlocs(1:end)'/1000 > app.WindowStartEditField.Value);    % find the start index, since the window is defined in seconds
            idx2 = find(app.TR*app.rlocs(1:end)'/1000 > app.WindowEndEditField.Value);      % find the end index, since the window is defined in seconds
            if isempty(idx2) | idx2>size(resp,2)                                            % when the data-window has the full range the index is not found
                idx2 = size(resp,2);                                                        % in that case index = last index of the respirationrate array
            end
            app.resprate = mean(resp(idx1(1):idx2(1)));                                % take the mean of the respirationrate only within the boundaries of the data-window
            app.FinalRespirationViewField.Value = round(app.resprate);                 % display respiration rate next to the movie
            
            % show the time-respirationrate plot
            cla(app.RespirationRateTimeFig);
            hold(app.RespirationRateTimeFig,'on');
            plot(app.RespirationRateTimeFig, app.TR*app.rlocs(1:end-1)'/1000,resp);                 % respiration rate
            plot(app.RespirationRateTimeFig, app.TR*app.rlocs(1:end-1)'/1000,respf,'LineWidth',3);  % trend line
            axis(app.RespirationRateTimeFig,[0 app.TR*app.rlocs(end)/1000 0 100]);
            hold(app.RespirationRateTimeFig,'off');
            drawnow;
                           
            % Plot the datawindow in the time-heartrate and time-respirationrate plots
            PlotDataWindowFcn(app);  
            
            % show the samples-navigator plots
            PlotCardiacNavigatorFcn(app);
            PlotRespirationNavigatorFcn(app);
            
            % reset buttons
            app.Lamp1.Color = 'Green';
            app.Lamp2.Color = 'Green';
            app.Lamp3.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp5.Color = 'Red';
            app.Lamp6.Color = 'Red';
            app.LoadMRDfileButton.Enable = 'on';
            app.NavigatorEndEditField.Enable = 'on';
            app.NavigatorNRPointsEditField.Enable = 'on';
            app.NavigatorFlipSwitch.Enable = 'on';
            app.StartEditField.Enable = 'on';
            app.RangeEditField.Enable = 'on';
            app.StartSlider.Enable = 'on';
            app.RangeSlider.Enable = 'on';
            app.WindowCheckBox.Enable = 'on';
            if app.WindowCheckBox.Value == true
                app.WindowStartEditField.Enable = 'on';
                app.WindowStartSlider.Enable = 'on';
                app.WindowEndEditField.Enable = 'on';
                app.WindowEndSlider.Enable = 'on';
            else
                app.WindowStartEditField.Enable = 'off';
                app.WindowStartSlider.Enable = 'off';
                app.WindowEndEditField.Enable = 'off';
                app.WindowEndSlider.Enable = 'off';
            end
            app.HeartEditField.Enable = 'on';
            app.RespirationEditField.Enable = 'on';
            app.HeartWidthEditField.Enable = 'on';
            app.RespirationWidthEditField.Enable = 'on';
            app.RespirationWindowEditField.Enable = 'on';
            app.ResetFilterValuesButton.Enable = 'on';
            app.FilterNavigatorButton.Enable = 'on';
            app.FramesEditField.Enable = 'on';
            app.movieDropDown.Enable = 'on';
            app.SortKspaceButton.Enable = 'on';
            app.WaveletEditField.Enable = 'off';
            app.TVEditField.Enable = 'off';
            app.ReconstructButton.Enable = 'off';
            app.ExportDicomButton.Enable = 'off';
            app.ExportGIFButton.Enable = 'off';
            app.PlayButton.Enable = 'off';
            app.StopButton.Enable = 'off';
            app.MovieFrameEditField.Enable = 'off';
            app.MovieScaleSlider.Enable = 'off';
            app.ccButton.Enable = 'off';
            app.ccwButton.Enable = 'off';
            app.FrameIncrButton.Enable = 'off';
            app.FrameDecrButton.Enable = 'off';
            app.ExitButton.Enable = 'on';
            app.stopmovie = true;  
            drawnow;
            
        end

        % Value changed function: RangeEditField, StartEditField
        function DisplayEditFieldValuesChanged(app, event)
         
            value1 = app.StartEditField.Value;
            value2 = app.RangeEditField.Value;
            
            % Range should be at least 20
            if value2 < 20
                value2 = 20; 
            end
            
             % Range should not exceed 2000, else plot gets really slow and cluttered
            if value2 > 2000
                value2 = 2000; 
            end
            
            % Start + Range should not exceed the number of available k-lines
            if value1 + value2 > app.nr_klines
                value1 = app.nr_klines - value2;
            end
            
            % Report the values back to the user-interface
            app.StartEditField.Value = value1;
            app.RangeEditField.Value = value2;       
        
            % Adjust the sliders also
            app.StartSlider.Value = app.StartEditField.Value;
            app.RangeSlider.Value = app.RangeEditField.Value;
            
            % Plot the raw navigator, cardiac filtered, and respiration filtered
            PlotRawNavigatorFcn(app);
            PlotCardiacNavigatorFcn(app);
            PlotRespirationNavigatorFcn(app);
            
        end

        % Value changed function: RangeSlider, StartSlider
        function DisplaySlidersValueChanged(app, event)
             
            % Set the field values to match the sliders
            app.StartEditField.Value = app.StartSlider.Value;
            app.RangeEditField.Value = app.RangeSlider.Value;
            
            % Proceed as if the field values were changed
            DisplayEditFieldValuesChanged(app, event);
            
        end

        % Value changed function: WindowCheckBox
        function WindowCheckBoxValueChanged(app, event)
                       
            % Plot the datawindow in the time-heartrate and time-respirationrate plots
            PlotDataWindowFcn(app);
            
            % Calculate and plot the power spectrum of the raw navigator signal
            CalculateNavigatorSpectrumFcn(app);
            PlotNavigatorSpectrumFcn(app);
            
            % Reset buttons
            app.Lamp1.Color = 'Green';
            app.Lamp2.Color = 'Red';
            app.Lamp3.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp5.Color = 'Red';
            app.Lamp6.Color = 'Red';
            app.LoadMRDfileButton.Enable = 'on';
            app.NavigatorEndEditField.Enable = 'on';
            app.NavigatorNRPointsEditField.Enable = 'on';
            app.NavigatorFlipSwitch.Enable = 'on';
            app.StartEditField.Enable = 'on';
            app.RangeEditField.Enable = 'on';
            app.StartSlider.Enable = 'on';
            app.RangeSlider.Enable = 'on';
            app.WindowCheckBox.Enable = 'on';
            if app.WindowCheckBox.Value == true
                app.WindowStartEditField.Enable = 'on';
                app.WindowStartSlider.Enable = 'on';
                app.WindowEndEditField.Enable = 'on';
                app.WindowEndSlider.Enable = 'on';
            else
                app.WindowStartEditField.Enable = 'off';
                app.WindowStartSlider.Enable = 'off';
                app.WindowEndEditField.Enable = 'off';
                app.WindowEndSlider.Enable = 'off';
            end
            app.HeartEditField.Enable = 'on';
            app.RespirationEditField.Enable = 'on';
            app.HeartWidthEditField.Enable = 'on';
            app.RespirationWidthEditField.Enable = 'on';
            app.RespirationWindowEditField.Enable = 'on';
            app.ResetFilterValuesButton.Enable = 'on';
            app.FilterNavigatorButton.Enable = 'on';
            app.FramesEditField.Enable = 'off';
            app.movieDropDown.Enable = 'off';
            app.SortKspaceButton.Enable = 'on';
            app.WaveletEditField.Enable = 'off';
            app.TVEditField.Enable = 'off';
            app.ReconstructButton.Enable = 'off';
            app.ExportDicomButton.Enable = 'off';
            app.ExportGIFButton.Enable = 'off';
            app.PlayButton.Enable = 'off';
            app.StopButton.Enable = 'off';
            app.MovieFrameEditField.Enable = 'off';
            app.MovieScaleSlider.Enable = 'off';
            app.ccButton.Enable = 'off';
            app.ccwButton.Enable = 'off';
            app.FrameIncrButton.Enable = 'off';
            app.FrameDecrButton.Enable = 'off';
            app.ExitButton.Enable = 'on';
            app.stopmovie = true;  
            drawnow;
              
        end

        % Value changed function: WindowEndEditField, 
        % WindowStartEditField
        function WindowEditFieldValueChanged(app, event)
            
            % read the values from the user interface
            value1 = app.WindowStartEditField.Value;        % start of the data-window in units of seconds
            value2 = app.WindowEndEditField.Value;          % end of the data-window in units of seconds
            
            % End should be bigger than Start and length of the window should be at least 10 (arbitrary) repetitions
            if value2-value1 < round(10 * app.nr_ksteps * app.TR / 1000)
                value2 = value1 + round(10 * app.nr_ksteps * app.TR / 1000); 
            end
            
            % End should be smaller than total acquisition time and length of the window should be at least 10 (arbitrary) repetitions
            if value2 > round(app.acq_dur)
                value2 = round(app.acq_dur);
                value1 = value2 - round(10 * app.nr_ksteps * app.TR / 1000);
            end
            
            % set the values and sliders
            app.WindowStartEditField.Value = value1;
            app.WindowStartSlider.Value = value1;
            app.WindowEndEditField.Value = value2;
            app.WindowEndSlider.Value = value2;
                      
            % Plot the datawindow in the time-heartrate and time-respirationrate plots
            PlotDataWindowFcn(app);
                         
            % Calculate and plot the power spectrum of the raw navigator signal
            CalculateNavigatorSpectrumFcn(app);
            PlotNavigatorSpectrumFcn(app);
            
            % Reset buttons
            app.Lamp1.Color = 'Green';
            app.Lamp2.Color = 'Red';
            app.Lamp3.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp5.Color = 'Red';
            app.Lamp6.Color = 'Red';
            app.LoadMRDfileButton.Enable = 'on';
            app.NavigatorEndEditField.Enable = 'on';
            app.NavigatorNRPointsEditField.Enable = 'on';
            app.NavigatorFlipSwitch.Enable = 'on';
            app.StartEditField.Enable = 'on';
            app.RangeEditField.Enable = 'on';
            app.StartSlider.Enable = 'on';
            app.RangeSlider.Enable = 'on';
            app.WindowCheckBox.Enable = 'on';
            if app.WindowCheckBox.Value == true
                app.WindowStartEditField.Enable = 'on';
                app.WindowStartSlider.Enable = 'on';
                app.WindowEndEditField.Enable = 'on';
                app.WindowEndSlider.Enable = 'on';
            else
                app.WindowStartEditField.Enable = 'off';
                app.WindowStartSlider.Enable = 'off';
                app.WindowEndEditField.Enable = 'off';
                app.WindowEndSlider.Enable = 'off';
            end
            app.HeartEditField.Enable = 'on';
            app.RespirationEditField.Enable = 'on';
            app.HeartWidthEditField.Enable = 'on';
            app.RespirationWidthEditField.Enable = 'on';
            app.RespirationWindowEditField.Enable = 'on';
            app.ResetFilterValuesButton.Enable = 'on';
            app.FilterNavigatorButton.Enable = 'on';
            app.FramesEditField.Enable = 'off';
            app.movieDropDown.Enable = 'off';
            app.SortKspaceButton.Enable = 'on';
            app.WaveletEditField.Enable = 'off';
            app.TVEditField.Enable = 'off';
            app.ReconstructButton.Enable = 'off';
            app.ExportDicomButton.Enable = 'off';
            app.ExportGIFButton.Enable = 'off';
            app.PlayButton.Enable = 'off';
            app.StopButton.Enable = 'off';
            app.MovieFrameEditField.Enable = 'off';
            app.MovieScaleSlider.Enable = 'off';
            app.ccButton.Enable = 'off';
            app.ccwButton.Enable = 'off';
            app.FrameIncrButton.Enable = 'off';
            app.FrameDecrButton.Enable = 'off';
            app.ExitButton.Enable = 'on';
            app.stopmovie = true;  
            drawnow;
                        
        end

        % Value changed function: WindowEndSlider, WindowStartSlider
        function WindowSliderValueChanged(app, event)
            
            % Set the field values to match the sliders
            app.WindowStartEditField.Value = app.WindowStartSlider.Value;
            app.WindowEndEditField.Value = app.WindowEndSlider.Value;
            
            % Proceed as if the field values were changed
            WindowEditFieldValueChanged(app, event);
            
        end

        % Value changed function: FramesEditField, movieDropDown
        function FramesEditFieldValueChanged(app, event)
        
            % If running, stop the movie
            StopButtonPushed(app, event);
        
            % New number of frames
            app.nr_frames = app.FramesEditField.Value;
                       
            % Reset buttons
            app.Lamp1.Color = 'Green';
            app.Lamp2.Color = 'Green';
            app.Lamp3.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp5.Color = 'Red';
            app.Lamp6.Color = 'Red';
            app.LoadMRDfileButton.Enable = 'on';
            app.NavigatorEndEditField.Enable = 'on';
            app.NavigatorNRPointsEditField.Enable = 'on';
            app.NavigatorFlipSwitch.Enable = 'on';
            app.movieDropDown.Enable = 'on';
            app.StartEditField.Enable = 'on';
            app.RangeEditField.Enable = 'on';
            app.StartSlider.Enable = 'on';
            app.RangeSlider.Enable = 'on';
            app.WindowCheckBox.Enable = 'on';
            if app.WindowCheckBox.Value == true
                app.WindowStartEditField.Enable = 'on';
                app.WindowStartSlider.Enable = 'on';
                app.WindowEndEditField.Enable = 'on';
                app.WindowEndSlider.Enable = 'on';
            else
                app.WindowStartEditField.Enable = 'off';
                app.WindowStartSlider.Enable = 'off';
                app.WindowEndEditField.Enable = 'off';
                app.WindowEndSlider.Enable = 'off';
            end
            app.HeartEditField.Enable = 'on';
            app.RespirationEditField.Enable = 'on';
            app.HeartWidthEditField.Enable = 'on';
            app.RespirationWidthEditField.Enable = 'on';
            app.RespirationWindowEditField.Enable = 'on';
            app.ResetFilterValuesButton.Enable = 'on';
            app.FilterNavigatorButton.Enable = 'on';
            app.SortKspaceButton.Enable = 'on';
            app.WaveletEditField.Enable = 'off';
            app.TVEditField.Enable = 'off';
            app.ReconstructButton.Enable = 'off';
            app.ExportDicomButton.Enable = 'off';
            app.ExportGIFButton.Enable = 'off';
            app.PlayButton.Enable = 'off';
            app.StopButton.Enable = 'off';  
            app.MovieFrameEditField.Enable = 'off';
            app.MovieScaleSlider.Enable = 'off';
            app.ccButton.Enable = 'off';
            app.ccwButton.Enable = 'off';
            app.FrameIncrButton.Enable = 'off';
            app.FrameDecrButton.Enable = 'off';
            app.ExitButton.Enable = 'on';
            app.stopmovie = true;  
            drawnow;
            
            % Automatically start sorting when number of frames has been changed
            SortKspaceButtonPushed(app, event);        
                        
        end

        % Button pushed function: SortKspaceButton
        function SortKspaceButtonPushed(app, event)
                        
            % Indicate busy
            app.Lamp1.Color = 'Green';
            app.Lamp2.Color = 'Green';
            app.Lamp3.Color = 'Yellow';
            app.Lamp4.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp5.Color = 'Red';
            app.Lamp6.Color = 'Red';
            app.LoadMRDfileButton.Enable = 'off';
            app.NavigatorEndEditField.Enable = 'off';
            app.NavigatorNRPointsEditField.Enable = 'off';
            app.NavigatorFlipSwitch.Enable = 'off';
            app.StartEditField.Enable = 'off';
            app.RangeEditField.Enable = 'off';
            app.HeartEditField.Enable = 'off';
            app.StartSlider.Enable = 'off';
            app.RangeSlider.Enable = 'off';
            app.WindowCheckBox.Enable = 'off';
            app.WindowStartEditField.Enable = 'off';
            app.WindowStartSlider.Enable = 'off';
            app.WindowEndEditField.Enable = 'off';
            app.WindowEndSlider.Enable = 'off';
            app.RespirationEditField.Enable = 'off';
            app.HeartWidthEditField.Enable = 'off';
            app.RespirationWidthEditField.Enable = 'off';
            app.RespirationWindowEditField.Enable = 'off';
            app.ResetFilterValuesButton.Enable = 'off';
            app.FilterNavigatorButton.Enable = 'off';
            app.FramesEditField.Enable = 'off';
            app.movieDropDown.Enable = 'off';
            app.SortKspaceButton.Enable = 'off';
            app.WaveletEditField.Enable = 'off';
            app.TVEditField.Enable = 'off';
            app.ReconstructButton.Enable = 'off';
            app.ExportDicomButton.Enable = 'off';
            app.ExportGIFButton.Enable = 'off';
            app.PlayButton.Enable = 'off';
            app.StopButton.Enable = 'off'; 
            app.MovieFrameEditField.Enable = 'off';
            app.MovieScaleSlider.Enable = 'off';
            app.ccButton.Enable = 'off';
            app.ccwButton.Enable = 'off';
            app.FrameIncrButton.Enable = 'off';
            app.FrameDecrButton.Enable = 'off';
            drawnow;
                        
            % Extract all the raw k-space imaging data
            raw = extractdata(app.data,app.nr_nav + app.nav_discarded); 

            % Determine whether to sort cardiac or respiratory phases
            switch app.movieDropDown.Value
                case 'cardiac'
                    number_of_cardiac_frames = app.nr_frames;
                    number_of_respiratory_frames = 1;
                case 'respiratory'
                    number_of_cardiac_frames = 1;
                    number_of_respiratory_frames = app.nr_frames;
            end
            
            % Determine the respiratory and cardiac bin times
            [bin_times_card,bin_times_resp] = assign_bin_times(app.hlocs,number_of_cardiac_frames,app.rlocs,number_of_respiratory_frames);      
            
            % Array which is filled with assignment of all k-lines to specific cardiac and respiratory frames
            [card_bin_ass,resp_bin_ass] = assign_bin_frames(bin_times_card,bin_times_resp,app.resp_window,app.nr_klines,number_of_cardiac_frames,number_of_respiratory_frames);

            % Trajectory (linear, zigzag, or user-defined)
            switch app.traject_nr
                case 0
                    trajectory = linear_trajectory(app.dimy);
                case 2
                    trajectory = zigzag_trajectory(app.dimy);
                case 3
                    trajectory = array_trajectory(app.parameters); 
            end
                        
            % Sort k-space
            % Only use the data from app.repstart to app.repend, determined by the data-window
            [app.kspace,app.averages] = fill_kspace(raw(app.repstart:app.repend,:,:),app.repstart,number_of_cardiac_frames,number_of_respiratory_frames,app.dimy,app.nr_ksteps,app.dimx,card_bin_ass,resp_bin_ass,trajectory);
            
            % K-space statistics
            app.FillingViewField.Value = round(100*nnz(app.averages)/numel(app.averages));
            app.AveragesViewField.Value = mean2(app.averages);
            
            % Reset buttons
            app.Lamp1.Color = 'Green';
            app.Lamp2.Color = 'Green';
            app.Lamp3.Color = 'Green';
            app.Lamp4.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp5.Color = 'Red';
            app.Lamp6.Color = 'Red';
            app.LoadMRDfileButton.Enable = 'on';
            app.NavigatorEndEditField.Enable = 'on';
            app.NavigatorNRPointsEditField.Enable = 'on';
            app.NavigatorFlipSwitch.Enable = 'on';
            app.StartEditField.Enable = 'on';
            app.RangeEditField.Enable = 'on';
            app.StartSlider.Enable = 'on';
            app.RangeSlider.Enable = 'on';
            app.WindowCheckBox.Enable = 'on';
            if app.WindowCheckBox.Value == true
                app.WindowStartEditField.Enable = 'on';
                app.WindowStartSlider.Enable = 'on';
                app.WindowEndEditField.Enable = 'on';
                app.WindowEndSlider.Enable = 'on';
            else
                app.WindowStartEditField.Enable = 'off';
                app.WindowStartSlider.Enable = 'off';
                app.WindowEndEditField.Enable = 'off';
                app.WindowEndSlider.Enable = 'off';
            end
            app.HeartEditField.Enable = 'on';
            app.HeartWidthEditField.Enable = 'on';
            app.RespirationWidthEditField.Enable = 'on';
            app.RespirationEditField.Enable = 'on';
            app.RespirationWindowEditField.Enable = 'on';
            app.ResetFilterValuesButton.Enable = 'on';
            app.FilterNavigatorButton.Enable = 'on';
            app.FramesEditField.Enable = 'on';
            app.movieDropDown.Enable = 'on';
            app.SortKspaceButton.Enable = 'on';
            app.WaveletEditField.Enable = 'on';
            app.TVEditField.Enable = 'on';
            app.ReconstructButton.Enable = 'on';
            app.ExportDicomButton.Enable = 'off';
            app.ExportGIFButton.Enable = 'off';
            app.PlayButton.Enable = 'off';
            app.StopButton.Enable = 'off';
            app.MovieFrameEditField.Enable = 'off';
            app.MovieScaleSlider.Enable = 'off';
            app.ccButton.Enable = 'off';
            app.ccwButton.Enable = 'off';
            app.FrameIncrButton.Enable = 'off';
            app.FrameDecrButton.Enable = 'off';
            app.ExitButton.Enable = 'on';
            app.stopmovie = true;  
            drawnow;
                        
        end

        % Value changed function: TVEditField
        function TVEditFieldValueChanged(app, event)
            
            % Reset buttons
            app.Lamp1.Color = 'Green';
            app.Lamp2.Color = 'Green';
            app.Lamp3.Color = 'Green';
            app.Lamp4.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp5.Color = 'Red';
            app.Lamp6.Color = 'Red';
            app.LoadMRDfileButton.Enable = 'on';
            app.NavigatorEndEditField.Enable = 'on';
            app.NavigatorNRPointsEditField.Enable = 'on';
            app.NavigatorFlipSwitch.Enable = 'on';
            app.StartEditField.Enable = 'on';
            app.RangeEditField.Enable = 'on';
            app.StartSlider.Enable = 'on';
            app.RangeSlider.Enable = 'on';
            app.WindowCheckBox.Enable = 'on';
            if app.WindowCheckBox.Value == true
                app.WindowStartEditField.Enable = 'on';
                app.WindowStartSlider.Enable = 'on';
                app.WindowEndEditField.Enable = 'on';
                app.WindowEndSlider.Enable = 'on';
            else
                app.WindowStartEditField.Enable = 'off';
                app.WindowStartSlider.Enable = 'off';
                app.WindowEndEditField.Enable = 'off';
                app.WindowEndSlider.Enable = 'off';
            end
            app.HeartEditField.Enable = 'on';
            app.RespirationEditField.Enable = 'on';
            app.HeartWidthEditField.Enable = 'on';
            app.RespirationWidthEditField.Enable = 'on';
            app.RespirationWindowEditField.Enable = 'on';
            app.ResetFilterValuesButton.Enable = 'on';
            app.FilterNavigatorButton.Enable = 'on';
            app.FramesEditField.Enable = 'on';
            app.movieDropDown.Enable = 'on';
            app.SortKspaceButton.Enable = 'on';
            app.WaveletEditField.Enable = 'on';
            app.TVEditField.Enable = 'on';
            app.ReconstructButton.Enable = 'on';
            app.ExportDicomButton.Enable = 'off';
            app.ExportGIFButton.Enable = 'off';
            app.PlayButton.Enable = 'off';
            app.StopButton.Enable = 'off';
            app.MovieFrameEditField.Enable = 'off';
            app.MovieScaleSlider.Enable = 'off';
            app.ccButton.Enable = 'off';
            app.ccwButton.Enable = 'off';
            app.FrameIncrButton.Enable = 'off';
            app.FrameDecrButton.Enable = 'off';
            app.ExitButton.Enable = 'on';
            app.stopmovie = true;  
            drawnow;
                        
        end

        % Value changed function: WaveletEditField
        function WaveletEditFieldValueChanged(app, event)
            
            % Reset buttons
            app.Lamp1.Color = 'Green';
            app.Lamp2.Color = 'Green';
            app.Lamp3.Color = 'Green';
            app.Lamp4.Color = 'Red';
            app.Lamp4.Color = 'Red';
            app.Lamp5.Color = 'Red';
            app.Lamp6.Color = 'Red';
            app.LoadMRDfileButton.Enable = 'on';
            app.NavigatorEndEditField.Enable = 'on';
            app.NavigatorNRPointsEditField.Enable = 'on';
            app.NavigatorFlipSwitch.Enable = 'on';
            app.StartEditField.Enable = 'on';
            app.RangeEditField.Enable = 'on';
            app.StartSlider.Enable = 'on';
            app.RangeSlider.Enable = 'on';
            app.WindowCheckBox.Enable = 'on';
            if app.WindowCheckBox.Value == true
                app.WindowStartEditField.Enable = 'on';
                app.WindowStartSlider.Enable = 'on';
                app.WindowEndEditField.Enable = 'on';
                app.WindowEndSlider.Enable = 'on';
            else
                app.WindowStartEditField.Enable = 'off';
                app.WindowStartSlider.Enable = 'off';
                app.WindowEndEditField.Enable = 'off';
                app.WindowEndSlider.Enable = 'off';
            end
            app.HeartEditField.Enable = 'on';
            app.RespirationEditField.Enable = 'on';
            app.HeartWidthEditField.Enable = 'on';
            app.RespirationWidthEditField.Enable = 'on';
            app.RespirationWindowEditField.Enable = 'on';
            app.ResetFilterValuesButton.Enable = 'on';
            app.FilterNavigatorButton.Enable = 'on';
            app.FramesEditField.Enable = 'on';
            app.movieDropDown.Enable = 'on';
            app.SortKspaceButton.Enable = 'on';
            app.WaveletEditField.Enable = 'on';
            app.TVEditField.Enable = 'on';
            app.ReconstructButton.Enable = 'on';
            app.ExportDicomButton.Enable = 'off';
            app.ExportGIFButton.Enable = 'off';
            app.PlayButton.Enable = 'off';
            app.StopButton.Enable = 'off';
            app.MovieFrameEditField.Enable = 'off';
            app.MovieScaleSlider.Enable = 'off';
            app.ccButton.Enable = 'off';
            app.ccwButton.Enable = 'off';
            app.FrameIncrButton.Enable = 'off';
            app.FrameDecrButton.Enable = 'off';
            app.ExitButton.Enable = 'on';
            app.stopmovie = true;  
            drawnow;
            
        end

        % Button pushed function: ReconstructButton
        function ReconstructButtonPushed(app, event)
            
            % Indicate busy         
            app.Lamp1.Color = 'Green';
            app.Lamp2.Color = 'Green';
            app.Lamp3.Color = 'Green';
            app.Lamp4.Color = 'Yellow';
            app.Lamp5.Color = 'Red';
            app.Lamp6.Color = 'Red';
            app.LoadMRDfileButton.Enable = 'off';
            app.NavigatorEndEditField.Enable = 'off';
            app.NavigatorNRPointsEditField.Enable = 'off';
            app.NavigatorFlipSwitch.Enable = 'off';
            app.StartEditField.Enable = 'off';
            app.RangeEditField.Enable = 'off';
            app.WindowCheckBox.Enable = 'off';
            app.WindowStartEditField.Enable = 'off';
            app.WindowStartSlider.Enable = 'off';
            app.WindowEndEditField.Enable = 'off';
            app.WindowEndSlider.Enable = 'off';
            app.HeartEditField.Enable = 'off';
            app.StartSlider.Enable = 'off';
            app.RangeSlider.Enable = 'off';
            app.RespirationEditField.Enable = 'off';
            app.HeartWidthEditField.Enable = 'off';
            app.RespirationWidthEditField.Enable = 'off';
            app.RespirationWindowEditField.Enable = 'off';
            app.ResetFilterValuesButton.Enable = 'off';
            app.FilterNavigatorButton.Enable = 'off';
            app.FramesEditField.Enable = 'off';
            app.movieDropDown.Enable = 'off';
            app.SortKspaceButton.Enable = 'off';
            app.WaveletEditField.Enable = 'off';
            app.TVEditField.Enable = 'off';
            app.ReconstructButton.Enable = 'off';
            app.ExportDicomButton.Enable = 'off';
            app.ExportGIFButton.Enable = 'off';
            app.PlayButton.Enable = 'off';
            app.StopButton.Enable = 'off'; 
            app.MovieFrameEditField.Enable = 'off';
            app.MovieScaleSlider.Enable = 'off';
            app.ccButton.Enable = 'off';
            app.ccwButton.Enable = 'off';
            app.FrameIncrButton.Enable = 'off';
            app.FrameDecrButton.Enable = 'off';
            app.ExitButton.Enable = 'off';
            drawnow;
                                    
            % Squeeze the respiratory or cardiac dimension
            switch app.movieDropDown.Value
                case 'cardiac'
                    kspace1 = squeeze(app.kspace(1,:,:,:));     % first dimension is reserved for respiration states
                    averages1 = squeeze(app.averages(1,:,:,:));    
                case 'respiratory'
                    kspace1 = squeeze(app.kspace(:,1,:,:));     % second dimension are the cardiac frames
                    averages1 = squeeze(app.averages(:,1,:,:));    
            end
           
            % CS reconstruction
            if app.bart_detected == true
                % Perform cs reconstruction with the Bart toolbox, preferred option
                app.cs_movie = cs_reco(kspace1,app.WaveletEditField.Value,app.TVEditField.Value);
            else
                % Perform cs reconstruction in matlab, slow but works
                app.cs_movie = cs_reco_mat(kspace1,averages1,app.WaveletEditField.Value,app.TVEditField.Value);                
            end
            
            % Normalize image intensity somewhat
            app.cs_movie = norm_images(app.cs_movie); 
                        
            % Permutate for viewing in correct orientation in the app 
            app.movie = permute(app.cs_movie,[2,3,1]);
                                 
            % Reset buttons
            app.Lamp1.Color = 'Green';
            app.Lamp2.Color = 'Green';
            app.Lamp3.Color = 'Green';
            app.Lamp4.Color = 'Green';
            app.Lamp5.Color = 'Red';
            app.Lamp6.Color = 'Red';
            app.LoadMRDfileButton.Enable = 'on';
            app.NavigatorEndEditField.Enable = 'on';
            app.NavigatorNRPointsEditField.Enable = 'on';
            app.NavigatorFlipSwitch.Enable = 'on';
            app.StartEditField.Enable = 'on';
            app.RangeEditField.Enable = 'on';
            app.StartSlider.Enable = 'on';
            app.RangeSlider.Enable = 'on';
            app.WindowCheckBox.Enable = 'on';
            if app.WindowCheckBox.Value == true
                app.WindowStartEditField.Enable = 'on';
                app.WindowStartSlider.Enable = 'on';
                app.WindowEndEditField.Enable = 'on';
                app.WindowEndSlider.Enable = 'on';
            else
                app.WindowStartEditField.Enable = 'off';
                app.WindowStartSlider.Enable = 'off';
                app.WindowEndEditField.Enable = 'off';
                app.WindowEndSlider.Enable = 'off';
            end
            app.HeartEditField.Enable = 'on';
            app.RespirationEditField.Enable = 'on';
            app.HeartWidthEditField.Enable = 'on';
            app.RespirationWidthEditField.Enable = 'on';
            app.RespirationWindowEditField.Enable = 'on';
            app.ResetFilterValuesButton.Enable = 'on';
            app.FilterNavigatorButton.Enable = 'on';
            app.FramesEditField.Enable = 'on';
            app.movieDropDown.Enable = 'on';
            app.SortKspaceButton.Enable = 'on';
            app.WaveletEditField.Enable = 'on';
            app.TVEditField.Enable = 'on';
            app.ReconstructButton.Enable = 'on';
            app.ExportDicomButton.Enable = 'on';
            app.ExportGIFButton.Enable = 'on';
            app.PlayButton.Enable = 'on';
            app.StopButton.Enable = 'on';
            app.MovieFrameEditField.Enable = 'off';
            app.MovieScaleSlider.Enable = 'on';
            app.ccButton.Enable = 'on';
            app.ccwButton.Enable = 'on';
            app.FrameIncrButton.Enable = 'on';
            app.FrameDecrButton.Enable = 'on';
            drawnow;
            
            % Start the movie
            PlayButtonPushed(app, event);
            
        end

        % Button pushed function: PlayButton
        function PlayButtonPushed(app, event)
            
            % Buttons
            app.PlayButton.Enable = 'off';
            app.StopButton.Enable = 'on';
            app.MovieFrameEditField.Enable = 'off';
            app.ccButton.Enable = 'on';
            app.ccwButton.Enable = 'on';
            app.FrameIncrButton.Enable = 'on';
            app.FrameDecrButton.Enable = 'on';
            app.ExitButton.Enable = 'off';
            
            counter = 1;
            app.stopmovie = false;
            scale = 32767*app.intensity_scaling;
            drawnow;
            
            % Play the movie continuously until app.stopmovie==true
            while app.stopmovie == false
                imshow(squeeze(app.movie(:,:,counter)),[0,round(scale*app.MovieScaleSlider.Value)],'InitialMagnification','fit','Parent',app.MovieFig);
                drawnow;
                counter = counter + 1;
                if counter>app.nr_frames 
                    counter=1; 
                end
                app.MovieFrameEditField.Value = counter;
            end              
            
        end

        % Button pushed function: StopButton
        function StopButtonPushed(app, event)
            
            % Buttons
            app.PlayButton.Enable = 'on';
            app.StopButton.Enable = 'off';
            app.MovieFrameEditField.Enable = 'on';
            app.MovieScaleSlider.Enable = 'on';
            app.ccButton.Enable = 'on';
            app.ccwButton.Enable = 'on';
            app.FrameIncrButton.Enable = 'on';
            app.FrameDecrButton.Enable = 'on';
            app.ExitButton.Enable = 'on';
                      
            % Stop the movie
            app.stopmovie = true;   
            drawnow;
            
        end

        % Value changed function: MovieFrameEditField
        function MovieFrameEditFieldValueChanged(app, event)
            value = app.MovieFrameEditField.Value;
            
             % If running, stop the movie
            StopButtonPushed(app, event);
            
            % Check if input value <= number of cardiac frames
            if value>app.nr_frames 
                app.MovieFrameEditField.Value = app.nr_frames; 
            end
            
            % Show the movie frame
            PlotCurrentMovieFrameFcn(app);
            
        end

        % Value changed function: MovieScaleSlider
        function MovieScaleSliderValueChanged(app, event)
                        
            % Show the movie frame
            PlotCurrentMovieFrameFcn(app);
            
        end

        % Button pushed function: ccButton
        function ccButtonPushed(app, event)
            
           % Rotate movie clock-wise
           app.movie = rot90(app.movie,-1);
           
           % Show the movie frame
           PlotCurrentMovieFrameFcn(app);
           
           % Reset buttons
           app.Lamp5.Color = 'Red';
           app.Lamp6.Color = 'Red';
           
        
        end

        % Button pushed function: ccwButton
        function ccwButtonPushed(app, event)
            
            % rotate movie counter-clock-wise
            app.movie = rot90(app.movie);
            
            % show the movie frame
            PlotCurrentMovieFrameFcn(app);
            
            % Reset buttons
            app.Lamp5.Color = 'Red';
            app.Lamp6.Color = 'Red';
        
        end

        % Button pushed function: FrameIncrButton
        function FrameIncrButtonPushed(app, event)
            
            % Rotate movie +1 frame along the time/frame axis
            app.movie = circshift(app.movie,-1,3);
            app.cs_movie = circshift(app.cs_movie,1,1);
            
            % Show the movie frame
            PlotCurrentMovieFrameFcn(app);
            
            % Reset buttons
            app.Lamp5.Color = 'Red';
            app.Lamp6.Color = 'Red';
        
        end

        % Button pushed function: FrameDecrButton
        function FrameDecrButtonPushed(app, event)
            
            % Rotate movie -1 frame along the time/frame axis
            app.movie = circshift(app.movie,+1,3);
            app.cs_movie = circshift(app.cs_movie,-1,1);
            
            % Show the movie frame
            PlotCurrentMovieFrameFcn(app);
            
            % Reset buttons
            app.Lamp5.Color = 'Red';
            app.Lamp6.Color = 'Red';
                
        end

        % Button pushed function: ExportDicomButton
        function ExportDicomButtonPushed(app, event)
            
            % If running, stop the movie
            StopButtonPushed(app, event);
            
            % Indicate busy
            app.Lamp5.Color = 'Yellow';
            app.LoadMRDfileButton.Enable = 'off';
            app.NavigatorEndEditField.Enable = 'off';
            app.NavigatorNRPointsEditField.Enable = 'off';
            app.NavigatorFlipSwitch.Enable = 'off';
            app.StartEditField.Enable = 'off';
            app.RangeEditField.Enable = 'off';
            app.StartSlider.Enable = 'off';
            app.RangeSlider.Enable = 'off';
            app.WindowCheckBox.Enable = 'off';
            app.WindowStartEditField.Enable = 'off';
            app.WindowStartSlider.Enable = 'off';
            app.WindowEndEditField.Enable = 'off';
            app.WindowEndSlider.Enable = 'off';
            app.HeartEditField.Enable = 'off';
            app.RespirationEditField.Enable = 'off';
            app.HeartWidthEditField.Enable = 'off';
            app.RespirationWidthEditField.Enable = 'off';
            app.RespirationWindowEditField.Enable = 'off';
            app.ResetFilterValuesButton.Enable = 'off';
            app.FilterNavigatorButton.Enable = 'off';
            app.FramesEditField.Enable = 'off';
            app.movieDropDown.Enable = 'off';
            app.SortKspaceButton.Enable = 'off';
            app.WaveletEditField.Enable = 'off';
            app.TVEditField.Enable = 'off';
            app.ReconstructButton.Enable = 'off';
            app.ExportDicomButton.Enable = 'off';
            app.ExportGIFButton.Enable = 'off';
            app.PlayButton.Enable = 'off';
            app.StopButton.Enable = 'off'; 
            app.MovieFrameEditField.Enable = 'off';
            app.MovieScaleSlider.Enable = 'off';
            app.ccButton.Enable = 'off';
            app.ccwButton.Enable = 'off';
            app.FrameIncrButton.Enable = 'off';
            app.FrameDecrButton.Enable = 'off';
            drawnow;
            
            % Ask for dicom export directory
            app.UIFigure.Visible = 'off';
            app.dicom_export_path = uigetdir(app.dicom_export_path,'Dicom export path'); 
            app.UIFigure.Visible = 'on';
            drawnow;
            
            % Check if directory exists
            ready = true;
            if ~ischar(app.dicom_export_path)     % user cancel
                ready = false;
                app.dicom_export_path = '';
            else
                [~, Attrib] = fileattrib(app.dicom_export_path);
                if ~any(Attrib.UserWrite)       % check if directory is writable
                    ready = false;
                end
            end
            
            % Export to dicom
            if ready
                export_dicom(app.dicom_export_path,app.cs_movie,app.parameters,app.heartrate,app.acq_dur,app.nr_frames,app.tag);
                app.Lamp5.Color = 'Green';
            else
                f = app.UIFigure;
                uialert(f,'Not a valid directory','Error');   
                app.Lamp5.Color = 'Red';
            end
                        
            % Reset buttons
            app.LoadMRDfileButton.Enable = 'on';
            app.NavigatorEndEditField.Enable = 'on';
            app.NavigatorNRPointsEditField.Enable = 'on';
            app.NavigatorFlipSwitch.Enable = 'on';
            app.StartEditField.Enable = 'on';
            app.RangeEditField.Enable = 'on';
            app.StartSlider.Enable = 'on';
            app.RangeSlider.Enable = 'on';
            app.WindowCheckBox.Enable = 'on';
            if app.WindowCheckBox.Value == true
                app.WindowStartEditField.Enable = 'on';
                app.WindowStartSlider.Enable = 'on';
                app.WindowEndEditField.Enable = 'on';
                app.WindowEndSlider.Enable = 'on';
            else
                app.WindowStartEditField.Enable = 'off';
                app.WindowStartSlider.Enable = 'off';
                app.WindowEndEditField.Enable = 'off';
                app.WindowEndSlider.Enable = 'off';
            end
            app.HeartEditField.Enable = 'on';
            app.RespirationEditField.Enable = 'on';
            app.HeartWidthEditField.Enable = 'on';
            app.RespirationWidthEditField.Enable = 'on';
            app.RespirationWindowEditField.Enable = 'on';
            app.ResetFilterValuesButton.Enable = 'on';
            app.FilterNavigatorButton.Enable = 'on';
            app.FramesEditField.Enable = 'on';
            app.movieDropDown.Enable = 'on';
            app.SortKspaceButton.Enable = 'on';
            app.WaveletEditField.Enable = 'on';
            app.TVEditField.Enable = 'on';
            app.ReconstructButton.Enable = 'on';
            app.ExportDicomButton.Enable = 'on';
            app.ExportGIFButton.Enable = 'on';
            app.PlayButton.Enable = 'on';
            app.StopButton.Enable = 'off';
            app.MovieFrameEditField.Enable = 'on';
            app.MovieScaleSlider.Enable = 'on';
            app.ccButton.Enable = 'on';
            app.ccwButton.Enable = 'on';
            app.FrameIncrButton.Enable = 'on';
            app.FrameDecrButton.Enable = 'on';
            drawnow;
            
        end

        % Button pushed function: ExportGIFButton
        function ExportGIFButtonPushed(app, event)
            
            % If running, stop the movie
            StopButtonPushed(app, event);
            
            % Indicate busy
            app.Lamp6.Color = 'Yellow';
            app.LoadMRDfileButton.Enable = 'off';
            app.NavigatorEndEditField.Enable = 'off';
            app.NavigatorNRPointsEditField.Enable = 'off';
            app.NavigatorFlipSwitch.Enable = 'off';
            app.StartEditField.Enable = 'off';
            app.RangeEditField.Enable = 'off';
            app.StartSlider.Enable = 'off';
            app.RangeSlider.Enable = 'off';
            app.WindowCheckBox.Enable = 'off';
            app.WindowStartEditField.Enable = 'off';
            app.WindowStartSlider.Enable = 'off';
            app.WindowEndEditField.Enable = 'off';
            app.WindowEndSlider.Enable = 'off';
            app.HeartEditField.Enable = 'off';
            app.RespirationEditField.Enable = 'off';
            app.HeartWidthEditField.Enable = 'off';
            app.RespirationWidthEditField.Enable = 'off';
            app.RespirationWindowEditField.Enable = 'off';
            app.ResetFilterValuesButton.Enable = 'off';
            app.FilterNavigatorButton.Enable = 'off';
            app.FramesEditField.Enable = 'off';
            app.movieDropDown.Enable = 'off';
            app.SortKspaceButton.Enable = 'off';
            app.WaveletEditField.Enable = 'off';
            app.TVEditField.Enable = 'off';
            app.ReconstructButton.Enable = 'off';
            app.ExportDicomButton.Enable = 'off';
            app.ExportGIFButton.Enable = 'off';
            app.PlayButton.Enable = 'off';
            app.StopButton.Enable = 'off'; 
            app.MovieFrameEditField.Enable = 'off';
            app.MovieScaleSlider.Enable = 'off';
            app.ccButton.Enable = 'off';
            app.ccwButton.Enable = 'off';
            app.FrameIncrButton.Enable = 'off';
            app.FrameDecrButton.Enable = 'off';
            drawnow;
            
            % Ask for directory
            app.UIFigure.Visible = 'off';
            app.gif_export_path = uigetdir(app.gif_export_path,'GIF export path'); 
            app.UIFigure.Visible = 'on';
            drawnow;
            
            % Check if directory exists
            ready = true;
            if ~ischar(app.gif_export_path)   % user cancel
                ready = false;
                app.gif_export_path = '';
            else
                [~, Attrib] = fileattrib(app.gif_export_path);   
                if ~any(Attrib.UserWrite)   % check if directory is writable
                    ready = false;
                end
            end
            
            % Export to animated gif
            if ready
                export_gif(app.gif_export_path,app.movie,app.nr_frames,app.tag,app.MovieScaleSlider.Value);
                app.Lamp6.Color = 'Green';
            else
                f = app.UIFigure;
                uialert(f,'Not a valid directory','Error');   
                app.Lamp6.Color = 'Red';
            end
                
            % Reset buttons
            app.LoadMRDfileButton.Enable = 'on';
            app.NavigatorEndEditField.Enable = 'on';
            app.NavigatorNRPointsEditField.Enable = 'on';
            app.NavigatorFlipSwitch.Enable = 'on';
            app.StartEditField.Enable = 'on';
            app.RangeEditField.Enable = 'on';
            app.StartSlider.Enable = 'on';
            app.RangeSlider.Enable = 'on';
            app.WindowCheckBox.Enable = 'on';
            if app.WindowCheckBox.Value == true
                app.WindowStartEditField.Enable = 'on';
                app.WindowStartSlider.Enable = 'on';
                app.WindowEndEditField.Enable = 'on';
                app.WindowEndSlider.Enable = 'on';
            else
                app.WindowStartEditField.Enable = 'off';
                app.WindowStartSlider.Enable = 'off';
                app.WindowEndEditField.Enable = 'off';
                app.WindowEndSlider.Enable = 'off';
            end
            app.HeartEditField.Enable = 'on';
            app.RespirationEditField.Enable = 'on';
            app.HeartWidthEditField.Enable = 'on';
            app.RespirationWidthEditField.Enable = 'on';
            app.RespirationWindowEditField.Enable = 'on';
            app.ResetFilterValuesButton.Enable = 'on';
            app.FilterNavigatorButton.Enable = 'on';
            app.FramesEditField.Enable = 'on';
            app.movieDropDown.Enable = 'on';
            app.SortKspaceButton.Enable = 'on';
            app.WaveletEditField.Enable = 'on';
            app.TVEditField.Enable = 'on';
            app.ReconstructButton.Enable = 'on';
            app.ExportDicomButton.Enable = 'on';
            app.ExportGIFButton.Enable = 'on';
            app.PlayButton.Enable = 'on';
            app.StopButton.Enable = 'off';
            app.MovieFrameEditField.Enable = 'on';
            app.MovieScaleSlider.Enable = 'on';
            app.ccButton.Enable = 'on';
            app.ccwButton.Enable = 'on';
            app.FrameIncrButton.Enable = 'on';
            app.FrameDecrButton.Enable = 'on';
            drawnow;
                
        end

        % Button pushed function: ExitButton
        function ExitButtonPushed(app, event)
            
            % Exit
            app.delete;
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Color = [0.9412 0.9412 0.9412];
            app.UIFigure.Position = [100 100 1386 887];
            app.UIFigure.Resize = 'off';

            % Create DashboardPanel
            app.DashboardPanel = uipanel(app.UIFigure);
            app.DashboardPanel.AutoResizeChildren = 'off';
            app.DashboardPanel.ForegroundColor = [0 0.451 0.7412];
            app.DashboardPanel.TitlePosition = 'centertop';
            app.DashboardPanel.Title = 'Dashboard';
            app.DashboardPanel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.DashboardPanel.FontWeight = 'bold';
            app.DashboardPanel.FontSize = 15;
            app.DashboardPanel.Position = [21 48 180 770];

            % Create LoadMRDfileButton
            app.LoadMRDfileButton = uibutton(app.DashboardPanel, 'push');
            app.LoadMRDfileButton.ButtonPushedFcn = createCallbackFcn(app, @LoadMRDfileButtonPushed, true);
            app.LoadMRDfileButton.BackgroundColor = [0.8 0.8 0.8];
            app.LoadMRDfileButton.Enable = 'off';
            app.LoadMRDfileButton.Position = [12 712 100 22];
            app.LoadMRDfileButton.Text = 'Load MRD file';

            % Create DetectedratesBPMPanel
            app.DetectedratesBPMPanel = uipanel(app.DashboardPanel);
            app.DetectedratesBPMPanel.AutoResizeChildren = 'off';
            app.DetectedratesBPMPanel.Title = 'Heart / respiration rates';
            app.DetectedratesBPMPanel.FontWeight = 'bold';
            app.DetectedratesBPMPanel.Position = [12 546 157 134];

            % Create respbpmLabel
            app.respbpmLabel = uilabel(app.DetectedratesBPMPanel);
            app.respbpmLabel.HorizontalAlignment = 'right';
            app.respbpmLabel.Position = [3 37 66 22];
            app.respbpmLabel.Text = 'resp. (bpm)';

            % Create RespirationEditField
            app.RespirationEditField = uieditfield(app.DetectedratesBPMPanel, 'numeric');
            app.RespirationEditField.Limits = [0 200];
            app.RespirationEditField.ValueChangedFcn = createCallbackFcn(app, @FilterEditFieldValueChanged, true);
            app.RespirationEditField.Enable = 'off';
            app.RespirationEditField.Position = [78 38 35 20];
            app.RespirationEditField.Value = 50;

            % Create heartbpmLabel
            app.heartbpmLabel = uilabel(app.DetectedratesBPMPanel);
            app.heartbpmLabel.HorizontalAlignment = 'right';
            app.heartbpmLabel.Position = [5 64 64 22];
            app.heartbpmLabel.Text = 'heart (bpm)';

            % Create HeartEditField
            app.HeartEditField = uieditfield(app.DetectedratesBPMPanel, 'numeric');
            app.HeartEditField.Limits = [0 2000];
            app.HeartEditField.ValueChangedFcn = createCallbackFcn(app, @FilterEditFieldValueChanged, true);
            app.HeartEditField.Enable = 'off';
            app.HeartEditField.Position = [78 65 35 20];
            app.HeartEditField.Value = 500;

            % Create windowLabel
            app.windowLabel = uilabel(app.DetectedratesBPMPanel);
            app.windowLabel.HorizontalAlignment = 'right';
            app.windowLabel.Position = [5 10 64 22];
            app.windowLabel.Text = 'window (%)';

            % Create RespirationWindowEditField
            app.RespirationWindowEditField = uieditfield(app.DetectedratesBPMPanel, 'numeric');
            app.RespirationWindowEditField.Limits = [5 95];
            app.RespirationWindowEditField.ValueDisplayFormat = '%.0f';
            app.RespirationWindowEditField.ValueChangedFcn = createCallbackFcn(app, @FilterEditFieldValueChanged, true);
            app.RespirationWindowEditField.Enable = 'off';
            app.RespirationWindowEditField.Position = [78 11 35 20];
            app.RespirationWindowEditField.Value = 30;

            % Create RespirationWidthEditField
            app.RespirationWidthEditField = uieditfield(app.DetectedratesBPMPanel, 'numeric');
            app.RespirationWidthEditField.Limits = [5 100];
            app.RespirationWidthEditField.ValueChangedFcn = createCallbackFcn(app, @FilterEditFieldValueChanged, true);
            app.RespirationWidthEditField.Enable = 'off';
            app.RespirationWidthEditField.Position = [116 38 35 20];
            app.RespirationWidthEditField.Value = 20;

            % Create HeartWidthEditField
            app.HeartWidthEditField = uieditfield(app.DetectedratesBPMPanel, 'numeric');
            app.HeartWidthEditField.Limits = [20 300];
            app.HeartWidthEditField.ValueDisplayFormat = '%.0f';
            app.HeartWidthEditField.ValueChangedFcn = createCallbackFcn(app, @FilterEditFieldValueChanged, true);
            app.HeartWidthEditField.Enable = 'off';
            app.HeartWidthEditField.Position = [116 65 35 20];
            app.HeartWidthEditField.Value = 100;

            % Create centerLabel
            app.centerLabel = uilabel(app.DetectedratesBPMPanel);
            app.centerLabel.HorizontalAlignment = 'center';
            app.centerLabel.Position = [76 86 39 22];
            app.centerLabel.Text = 'center';

            % Create widthLabel
            app.widthLabel = uilabel(app.DetectedratesBPMPanel);
            app.widthLabel.HorizontalAlignment = 'center';
            app.widthLabel.Position = [117 86 35 22];
            app.widthLabel.Text = 'width';

            % Create ResetFilterValuesButton
            app.ResetFilterValuesButton = uibutton(app.DetectedratesBPMPanel, 'push');
            app.ResetFilterValuesButton.ButtonPushedFcn = createCallbackFcn(app, @ResetFilterValuesButtonPushed, true);
            app.ResetFilterValuesButton.VerticalAlignment = 'top';
            app.ResetFilterValuesButton.BackgroundColor = [0.8 0.8 0.8];
            app.ResetFilterValuesButton.FontSize = 10;
            app.ResetFilterValuesButton.Enable = 'off';
            app.ResetFilterValuesButton.Position = [117 10 34 22];
            app.ResetFilterValuesButton.Text = 'reset';

            % Create Lamp1
            app.Lamp1 = uilamp(app.DashboardPanel);
            app.Lamp1.Interruptible = 'off';
            app.Lamp1.Position = [132 714 20 20];
            app.Lamp1.Color = [1 0 0];

            % Create FilterNavigatorButton
            app.FilterNavigatorButton = uibutton(app.DashboardPanel, 'push');
            app.FilterNavigatorButton.ButtonPushedFcn = createCallbackFcn(app, @FilterNavigatorButtonPushed, true);
            app.FilterNavigatorButton.BackgroundColor = [0.8 0.8 0.8];
            app.FilterNavigatorButton.Enable = 'off';
            app.FilterNavigatorButton.Position = [12 510 100 22];
            app.FilterNavigatorButton.Text = 'Filter navigator';

            % Create Lamp2
            app.Lamp2 = uilamp(app.DashboardPanel);
            app.Lamp2.Position = [132 511 20 20];
            app.Lamp2.Color = [1 0 0];

            % Create SortKspaceButton
            app.SortKspaceButton = uibutton(app.DashboardPanel, 'push');
            app.SortKspaceButton.ButtonPushedFcn = createCallbackFcn(app, @SortKspaceButtonPushed, true);
            app.SortKspaceButton.BackgroundColor = [0.8 0.8 0.8];
            app.SortKspaceButton.Enable = 'off';
            app.SortKspaceButton.Position = [12 353 100 22];
            app.SortKspaceButton.Text = 'Sort k-space';

            % Create Lamp3
            app.Lamp3 = uilamp(app.DashboardPanel);
            app.Lamp3.Position = [132 354 20 20];
            app.Lamp3.Color = [1 0 0];

            % Create ReconstructButton
            app.ReconstructButton = uibutton(app.DashboardPanel, 'push');
            app.ReconstructButton.ButtonPushedFcn = createCallbackFcn(app, @ReconstructButtonPushed, true);
            app.ReconstructButton.BackgroundColor = [0.8 0.8 0.8];
            app.ReconstructButton.Enable = 'off';
            app.ReconstructButton.Position = [12 157 100 22];
            app.ReconstructButton.Text = 'Reconstruct';

            % Create Lamp4
            app.Lamp4 = uilamp(app.DashboardPanel);
            app.Lamp4.Position = [133 158 20 20];
            app.Lamp4.Color = [1 0 0];

            % Create CSrecoparametersPanel
            app.CSrecoparametersPanel = uipanel(app.DashboardPanel);
            app.CSrecoparametersPanel.AutoResizeChildren = 'off';
            app.CSrecoparametersPanel.Title = 'CS reco parameters';
            app.CSrecoparametersPanel.FontWeight = 'bold';
            app.CSrecoparametersPanel.Position = [12 193 157 126];

            % Create TVEditFieldLabel
            app.TVEditFieldLabel = uilabel(app.CSrecoparametersPanel);
            app.TVEditFieldLabel.HorizontalAlignment = 'right';
            app.TVEditFieldLabel.Position = [61 48 25 15];
            app.TVEditFieldLabel.Text = 'TV';

            % Create TVEditField
            app.TVEditField = uieditfield(app.CSrecoparametersPanel, 'numeric');
            app.TVEditField.Limits = [0 2];
            app.TVEditField.ValueDisplayFormat = '%.4f';
            app.TVEditField.ValueChangedFcn = createCallbackFcn(app, @TVEditFieldValueChanged, true);
            app.TVEditField.Enable = 'off';
            app.TVEditField.Position = [100 45 46 20];
            app.TVEditField.Value = 0.1;

            % Create WaveletEditFieldLabel
            app.WaveletEditFieldLabel = uilabel(app.CSrecoparametersPanel);
            app.WaveletEditFieldLabel.HorizontalAlignment = 'right';
            app.WaveletEditFieldLabel.Position = [39 78 48 15];
            app.WaveletEditFieldLabel.Text = 'Wavelet';

            % Create WaveletEditField
            app.WaveletEditField = uieditfield(app.CSrecoparametersPanel, 'numeric');
            app.WaveletEditField.Limits = [0 1];
            app.WaveletEditField.ValueDisplayFormat = '%.4f';
            app.WaveletEditField.ValueChangedFcn = createCallbackFcn(app, @WaveletEditFieldValueChanged, true);
            app.WaveletEditField.Enable = 'off';
            app.WaveletEditField.Position = [100 75 46 20];
            app.WaveletEditField.Value = 0.001;

            % Create recoEditFieldLabel
            app.recoEditFieldLabel = uilabel(app.CSrecoparametersPanel);
            app.recoEditFieldLabel.HorizontalAlignment = 'right';
            app.recoEditFieldLabel.Position = [32 13 55 22];
            app.recoEditFieldLabel.Text = 'reco';

            % Create RecoEditField
            app.RecoEditField = uieditfield(app.CSrecoparametersPanel, 'text');
            app.RecoEditField.Editable = 'off';
            app.RecoEditField.HorizontalAlignment = 'right';
            app.RecoEditField.FontColor = [0.549 0.549 0.549];
            app.RecoEditField.Position = [99 13 47 22];
            app.RecoEditField.Value = 'Matlab';

            % Create ExportDicomButton
            app.ExportDicomButton = uibutton(app.DashboardPanel, 'push');
            app.ExportDicomButton.ButtonPushedFcn = createCallbackFcn(app, @ExportDicomButtonPushed, true);
            app.ExportDicomButton.BackgroundColor = [0.8 0.8 0.8];
            app.ExportDicomButton.Enable = 'off';
            app.ExportDicomButton.Position = [12 98 100 22];
            app.ExportDicomButton.Text = 'Export Dicom';

            % Create Lamp5
            app.Lamp5 = uilamp(app.DashboardPanel);
            app.Lamp5.Position = [133 99 20 20];
            app.Lamp5.Color = [1 0 0];

            % Create CinePanel
            app.CinePanel = uipanel(app.DashboardPanel);
            app.CinePanel.AutoResizeChildren = 'off';
            app.CinePanel.Title = 'Cine';
            app.CinePanel.FontWeight = 'bold';
            app.CinePanel.Position = [12 388 157 85];

            % Create framesEditFieldLabel
            app.framesEditFieldLabel = uilabel(app.CinePanel);
            app.framesEditFieldLabel.HorizontalAlignment = 'right';
            app.framesEditFieldLabel.Position = [47 10 53 19];
            app.framesEditFieldLabel.Text = '# frames';

            % Create FramesEditField
            app.FramesEditField = uieditfield(app.CinePanel, 'numeric');
            app.FramesEditField.Limits = [6 240];
            app.FramesEditField.RoundFractionalValues = 'on';
            app.FramesEditField.ValueDisplayFormat = '%.0f';
            app.FramesEditField.ValueChangedFcn = createCallbackFcn(app, @FramesEditFieldValueChanged, true);
            app.FramesEditField.Enable = 'off';
            app.FramesEditField.Position = [109 8 38 22];
            app.FramesEditField.Value = 25;

            % Create movieDropDownLabel
            app.movieDropDownLabel = uilabel(app.CinePanel);
            app.movieDropDownLabel.HorizontalAlignment = 'right';
            app.movieDropDownLabel.Position = [3 37 38 22];
            app.movieDropDownLabel.Text = 'movie';

            % Create movieDropDown
            app.movieDropDown = uidropdown(app.CinePanel);
            app.movieDropDown.Items = {'cardiac', 'respiratory'};
            app.movieDropDown.ValueChangedFcn = createCallbackFcn(app, @FramesEditFieldValueChanged, true);
            app.movieDropDown.Enable = 'off';
            app.movieDropDown.Position = [47 37 99 22];
            app.movieDropDown.Value = 'cardiac';

            % Create ExitButton
            app.ExitButton = uibutton(app.DashboardPanel, 'push');
            app.ExitButton.ButtonPushedFcn = createCallbackFcn(app, @ExitButtonPushed, true);
            app.ExitButton.BackgroundColor = [0.8 0.8 0.8];
            app.ExitButton.Position = [12 10 100 22];
            app.ExitButton.Text = 'Exit';

            % Create ExportGIFButton
            app.ExportGIFButton = uibutton(app.DashboardPanel, 'push');
            app.ExportGIFButton.ButtonPushedFcn = createCallbackFcn(app, @ExportGIFButtonPushed, true);
            app.ExportGIFButton.BackgroundColor = [0.8 0.8 0.8];
            app.ExportGIFButton.Enable = 'off';
            app.ExportGIFButton.Position = [12 55 100 22];
            app.ExportGIFButton.Text = 'Export GIF';

            % Create Lamp6
            app.Lamp6 = uilamp(app.DashboardPanel);
            app.Lamp6.Position = [133 56 20 20];
            app.Lamp6.Color = [1 0 0];

            % Create SelfgatedCardiacMRIReconstructorLabel
            app.SelfgatedCardiacMRIReconstructorLabel = uilabel(app.UIFigure);
            app.SelfgatedCardiacMRIReconstructorLabel.HorizontalAlignment = 'center';
            app.SelfgatedCardiacMRIReconstructorLabel.VerticalAlignment = 'top';
            app.SelfgatedCardiacMRIReconstructorLabel.FontSize = 28;
            app.SelfgatedCardiacMRIReconstructorLabel.FontWeight = 'bold';
            app.SelfgatedCardiacMRIReconstructorLabel.FontColor = [0 0.451 0.7412];
            app.SelfgatedCardiacMRIReconstructorLabel.Position = [443 837 516 37];
            app.SelfgatedCardiacMRIReconstructorLabel.Text = 'Selfgated Cardiac MRI Reconstructor';

            % Create AcquisitionparametersPanel
            app.AcquisitionparametersPanel = uipanel(app.UIFigure);
            app.AcquisitionparametersPanel.AutoResizeChildren = 'off';
            app.AcquisitionparametersPanel.ForegroundColor = [0 0.4471 0.7412];
            app.AcquisitionparametersPanel.TitlePosition = 'centertop';
            app.AcquisitionparametersPanel.Title = 'Acquisition parameters';
            app.AcquisitionparametersPanel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.AcquisitionparametersPanel.FontWeight = 'bold';
            app.AcquisitionparametersPanel.FontSize = 14;
            app.AcquisitionparametersPanel.Position = [221 48 426 300];

            % Create NyEditFieldLabel
            app.NyEditFieldLabel = uilabel(app.AcquisitionparametersPanel);
            app.NyEditFieldLabel.HorizontalAlignment = 'right';
            app.NyEditFieldLabel.VerticalAlignment = 'top';
            app.NyEditFieldLabel.Position = [91 159 25 15];
            app.NyEditFieldLabel.Text = 'Ny';

            % Create NyViewField
            app.NyViewField = uieditfield(app.AcquisitionparametersPanel, 'numeric');
            app.NyViewField.Editable = 'off';
            app.NyViewField.Position = [123 155 95 22];

            % Create NxEditFieldLabel
            app.NxEditFieldLabel = uilabel(app.AcquisitionparametersPanel);
            app.NxEditFieldLabel.HorizontalAlignment = 'right';
            app.NxEditFieldLabel.VerticalAlignment = 'top';
            app.NxEditFieldLabel.Position = [91 126 25 15];
            app.NxEditFieldLabel.Text = 'Nx';

            % Create NxViewField
            app.NxViewField = uieditfield(app.AcquisitionparametersPanel, 'numeric');
            app.NxViewField.Editable = 'off';
            app.NxViewField.Position = [123 122 95 22];

            % Create klinesrepetitionLabel
            app.klinesrepetitionLabel = uilabel(app.AcquisitionparametersPanel);
            app.klinesrepetitionLabel.HorizontalAlignment = 'right';
            app.klinesrepetitionLabel.VerticalAlignment = 'top';
            app.klinesrepetitionLabel.Position = [4 86 112 22];
            app.klinesrepetitionLabel.Text = 'k-lines / repetition';

            % Create KlinesRepetitionViewField
            app.KlinesRepetitionViewField = uieditfield(app.AcquisitionparametersPanel, 'numeric');
            app.KlinesRepetitionViewField.Editable = 'off';
            app.KlinesRepetitionViewField.Position = [123 89 95 22];

            % Create repetitionsLabel
            app.repetitionsLabel = uilabel(app.AcquisitionparametersPanel);
            app.repetitionsLabel.HorizontalAlignment = 'right';
            app.repetitionsLabel.VerticalAlignment = 'top';
            app.repetitionsLabel.Position = [242 117 72 22];
            app.repetitionsLabel.Text = 'repetitions';

            % Create RepetitionsViewField
            app.RepetitionsViewField = uieditfield(app.AcquisitionparametersPanel, 'numeric');
            app.RepetitionsViewField.RoundFractionalValues = 'on';
            app.RepetitionsViewField.ValueDisplayFormat = '%.0f';
            app.RepetitionsViewField.Editable = 'off';
            app.RepetitionsViewField.Position = [321 121 91 22];

            % Create klinesLabel
            app.klinesLabel = uilabel(app.AcquisitionparametersPanel);
            app.klinesLabel.HorizontalAlignment = 'right';
            app.klinesLabel.VerticalAlignment = 'top';
            app.klinesLabel.Position = [234 85 78 22];
            app.klinesLabel.Text = ' # k-lines';

            % Create NrKlinesViewField
            app.NrKlinesViewField = uieditfield(app.AcquisitionparametersPanel, 'numeric');
            app.NrKlinesViewField.ValueDisplayFormat = '%.0f';
            app.NrKlinesViewField.Editable = 'off';
            app.NrKlinesViewField.Position = [321 88 91 22];

            % Create scantimeminLabel
            app.scantimeminLabel = uilabel(app.AcquisitionparametersPanel);
            app.scantimeminLabel.HorizontalAlignment = 'right';
            app.scantimeminLabel.Position = [27 23 89 22];
            app.scantimeminLabel.Text = 'scan time (min)';

            % Create AcquisitionTimeMinViewField
            app.AcquisitionTimeMinViewField = uieditfield(app.AcquisitionparametersPanel, 'numeric');
            app.AcquisitionTimeMinViewField.Editable = 'off';
            app.AcquisitionTimeMinViewField.Position = [123 23 95 22];

            % Create DataFile
            app.DataFile = uitextarea(app.AcquisitionparametersPanel);
            app.DataFile.ValueChangedFcn = createCallbackFcn(app, @LoadMRDfileButtonPushed, true);
            app.DataFile.Editable = 'off';
            app.DataFile.HorizontalAlignment = 'right';
            app.DataFile.Position = [70 243 147 22];
            app.DataFile.Value = {' '};

            % Create datafileLabel
            app.datafileLabel = uilabel(app.AcquisitionparametersPanel);
            app.datafileLabel.HorizontalAlignment = 'right';
            app.datafileLabel.Position = [14 243 49 22];
            app.datafileLabel.Text = 'data file';

            % Create averagesEditFieldLabel
            app.averagesEditFieldLabel = uilabel(app.AcquisitionparametersPanel);
            app.averagesEditFieldLabel.HorizontalAlignment = 'right';
            app.averagesEditFieldLabel.Position = [260 55 54 22];
            app.averagesEditFieldLabel.Text = 'averages';

            % Create AveragesViewField
            app.AveragesViewField = uieditfield(app.AcquisitionparametersPanel, 'numeric');
            app.AveragesViewField.Editable = 'off';
            app.AveragesViewField.Position = [321 55 91 22];

            % Create fillingLabel
            app.fillingLabel = uilabel(app.AcquisitionparametersPanel);
            app.fillingLabel.HorizontalAlignment = 'right';
            app.fillingLabel.Position = [259 23 55 22];
            app.fillingLabel.Text = 'filling (%)';

            % Create FillingViewField
            app.FillingViewField = uieditfield(app.AcquisitionparametersPanel, 'numeric');
            app.FillingViewField.Limits = [0 100];
            app.FillingViewField.ValueDisplayFormat = '%.0f';
            app.FillingViewField.Editable = 'off';
            app.FillingViewField.Position = [321 23 91 22];

            % Create TRmsLabel
            app.TRmsLabel = uilabel(app.AcquisitionparametersPanel);
            app.TRmsLabel.HorizontalAlignment = 'right';
            app.TRmsLabel.VerticalAlignment = 'top';
            app.TRmsLabel.Position = [70 52 46 22];
            app.TRmsLabel.Text = 'TR (ms)';

            % Create TRViewField
            app.TRViewField = uieditfield(app.AcquisitionparametersPanel, 'numeric');
            app.TRViewField.Editable = 'off';
            app.TRViewField.Position = [123 55 95 22];

            % Create trajectoryEditFieldLabel
            app.trajectoryEditFieldLabel = uilabel(app.AcquisitionparametersPanel);
            app.trajectoryEditFieldLabel.HorizontalAlignment = 'right';
            app.trajectoryEditFieldLabel.Position = [256 155 56 22];
            app.trajectoryEditFieldLabel.Text = 'trajectory';

            % Create TrajectoryViewField
            app.TrajectoryViewField = uieditfield(app.AcquisitionparametersPanel, 'text');
            app.TrajectoryViewField.Editable = 'off';
            app.TrajectoryViewField.HorizontalAlignment = 'right';
            app.TrajectoryViewField.Position = [321 155 91 22];

            % Create TrajectoryFig
            app.TrajectoryFig = uiaxes(app.AcquisitionparametersPanel);
            title(app.TrajectoryFig, '')
            xlabel(app.TrajectoryFig, '')
            ylabel(app.TrajectoryFig, '')
            app.TrajectoryFig.FontSize = 1;
            app.TrajectoryFig.Box = 'on';
            app.TrajectoryFig.XColor = [0.8 0.8 0.8];
            app.TrajectoryFig.XTick = [];
            app.TrajectoryFig.YColor = [0.8 0.8 0.8];
            app.TrajectoryFig.YTick = [];
            app.TrajectoryFig.LineWidth = 0.2;
            app.TrajectoryFig.Color = [0.9686 0.9686 0.9686];
            app.TrajectoryFig.XGrid = 'on';
            app.TrajectoryFig.YGrid = 'on';
            app.TrajectoryFig.LabelFontSizeMultiplier = 1;
            app.TrajectoryFig.TitleFontSizeMultiplier = 1;
            app.TrajectoryFig.Position = [259 184 159 91];

            % Create AmsterdamUMCGustavStrijkersVersion32Aug2019Label
            app.AmsterdamUMCGustavStrijkersVersion32Aug2019Label = uilabel(app.UIFigure);
            app.AmsterdamUMCGustavStrijkersVersion32Aug2019Label.HorizontalAlignment = 'right';
            app.AmsterdamUMCGustavStrijkersVersion32Aug2019Label.FontSize = 17;
            app.AmsterdamUMCGustavStrijkersVersion32Aug2019Label.FontColor = [0 0.4471 0.7412];
            app.AmsterdamUMCGustavStrijkersVersion32Aug2019Label.Position = [910 14 451 22];
            app.AmsterdamUMCGustavStrijkersVersion32Aug2019Label.Text = 'Amsterdam UMC, Gustav Strijkers, Version 3.2, Aug 2019';

            % Create NavigatorPanel
            app.NavigatorPanel = uipanel(app.UIFigure);
            app.NavigatorPanel.AutoResizeChildren = 'off';
            app.NavigatorPanel.ForegroundColor = [0 0.4471 0.7412];
            app.NavigatorPanel.TitlePosition = 'centertop';
            app.NavigatorPanel.Title = 'Navigator';
            app.NavigatorPanel.FontWeight = 'bold';
            app.NavigatorPanel.FontSize = 14;
            app.NavigatorPanel.Position = [221 368 426 450];

            % Create RawNavFig
            app.RawNavFig = uiaxes(app.NavigatorPanel);
            title(app.RawNavFig, 'Raw navigator')
            xlabel(app.RawNavFig, 'Samples')
            ylabel(app.RawNavFig, 'Signal')
            app.RawNavFig.FontSize = 11;
            app.RawNavFig.Box = 'on';
            app.RawNavFig.Position = [10 232 270 185];

            % Create SpectrumFig
            app.SpectrumFig = uiaxes(app.NavigatorPanel);
            title(app.SpectrumFig, 'Navigator Spectrum')
            xlabel(app.SpectrumFig, 'Frequency (bpm)')
            ylabel(app.SpectrumFig, 'Intensity')
            app.SpectrumFig.FontSize = 11;
            app.SpectrumFig.Box = 'on';
            app.SpectrumFig.Position = [10 21 270 185];

            % Create primaryLabel
            app.primaryLabel = uilabel(app.NavigatorPanel);
            app.primaryLabel.HorizontalAlignment = 'right';
            app.primaryLabel.VerticalAlignment = 'top';
            app.primaryLabel.Position = [305 359 46 22];
            app.primaryLabel.Text = 'primary';

            % Create NavigatorEndEditField
            app.NavigatorEndEditField = uieditfield(app.NavigatorPanel, 'numeric');
            app.NavigatorEndEditField.Limits = [1 25];
            app.NavigatorEndEditField.ValueDisplayFormat = '%.0f';
            app.NavigatorEndEditField.ValueChangedFcn = createCallbackFcn(app, @NavPointEditFieldValueChanged, true);
            app.NavigatorEndEditField.Enable = 'off';
            app.NavigatorEndEditField.Position = [361 363 40 20];
            app.NavigatorEndEditField.Value = 10;

            % Create pointsLabel
            app.pointsLabel = uilabel(app.NavigatorPanel);
            app.pointsLabel.HorizontalAlignment = 'right';
            app.pointsLabel.VerticalAlignment = 'top';
            app.pointsLabel.Position = [303 336 49 15];
            app.pointsLabel.Text = '# points';

            % Create NavigatorNRPointsEditField
            app.NavigatorNRPointsEditField = uieditfield(app.NavigatorPanel, 'numeric');
            app.NavigatorNRPointsEditField.Limits = [1 8];
            app.NavigatorNRPointsEditField.ValueDisplayFormat = '%.0f';
            app.NavigatorNRPointsEditField.ValueChangedFcn = createCallbackFcn(app, @NavPointEditFieldValueChanged, true);
            app.NavigatorNRPointsEditField.Enable = 'off';
            app.NavigatorNRPointsEditField.Position = [361 333 40 20];
            app.NavigatorNRPointsEditField.Value = 1;

            % Create FlipSwitchLabel
            app.FlipSwitchLabel = uilabel(app.NavigatorPanel);
            app.FlipSwitchLabel.HorizontalAlignment = 'center';
            app.FlipSwitchLabel.VerticalAlignment = 'top';
            app.FlipSwitchLabel.Position = [345 278 25 15];
            app.FlipSwitchLabel.Text = 'Flip';

            % Create NavigatorFlipSwitch
            app.NavigatorFlipSwitch = uiswitch(app.NavigatorPanel, 'toggle');
            app.NavigatorFlipSwitch.Items = {'Down', 'Up'};
            app.NavigatorFlipSwitch.ValueChangedFcn = createCallbackFcn(app, @NavPointEditFieldValueChanged, true);
            app.NavigatorFlipSwitch.Enable = 'off';
            app.NavigatorFlipSwitch.Position = [378 268 15 34];
            app.NavigatorFlipSwitch.Value = 'Up';

            % Create NavigatorLabel
            app.NavigatorLabel = uilabel(app.NavigatorPanel);
            app.NavigatorLabel.HorizontalAlignment = 'center';
            app.NavigatorLabel.FontWeight = 'bold';
            app.NavigatorLabel.Position = [315 391 61 22];
            app.NavigatorLabel.Text = 'Navigator';

            % Create NavigatoranalysisPanel
            app.NavigatoranalysisPanel = uipanel(app.UIFigure);
            app.NavigatoranalysisPanel.AutoResizeChildren = 'off';
            app.NavigatoranalysisPanel.ForegroundColor = [0 0.4471 0.7412];
            app.NavigatoranalysisPanel.TitlePosition = 'centertop';
            app.NavigatoranalysisPanel.Title = 'Navigator analysis';
            app.NavigatoranalysisPanel.FontWeight = 'bold';
            app.NavigatoranalysisPanel.FontSize = 14;
            app.NavigatoranalysisPanel.Position = [663 368 698 450];

            % Create CardiacNavFig
            app.CardiacNavFig = uiaxes(app.NavigatoranalysisPanel);
            title(app.CardiacNavFig, 'Heart navigator')
            xlabel(app.CardiacNavFig, 'Samples')
            ylabel(app.CardiacNavFig, 'Signal')
            app.CardiacNavFig.FontSize = 11;
            app.CardiacNavFig.Box = 'on';
            app.CardiacNavFig.Position = [24 234 270 185];

            % Create RespirationNavFig
            app.RespirationNavFig = uiaxes(app.NavigatoranalysisPanel);
            title(app.RespirationNavFig, 'Respiration navigator')
            xlabel(app.RespirationNavFig, 'Samples')
            ylabel(app.RespirationNavFig, 'Signal')
            app.RespirationNavFig.FontSize = 11;
            app.RespirationNavFig.Box = 'on';
            app.RespirationNavFig.Position = [308 234 270 185];

            % Create HeartRateTimeFig
            app.HeartRateTimeFig = uiaxes(app.NavigatoranalysisPanel);
            title(app.HeartRateTimeFig, 'Heart rate')
            xlabel(app.HeartRateTimeFig, 'Time (s)')
            ylabel(app.HeartRateTimeFig, 'Rate (bpm)')
            app.HeartRateTimeFig.FontSize = 11;
            app.HeartRateTimeFig.XLim = [0 100];
            app.HeartRateTimeFig.YLim = [0 1000];
            app.HeartRateTimeFig.Box = 'on';
            app.HeartRateTimeFig.Position = [14 23 280 185];

            % Create RespirationRateTimeFig
            app.RespirationRateTimeFig = uiaxes(app.NavigatoranalysisPanel);
            title(app.RespirationRateTimeFig, 'Respiration rate')
            xlabel(app.RespirationRateTimeFig, 'Time (s)')
            ylabel(app.RespirationRateTimeFig, 'Rate (bpm)')
            app.RespirationRateTimeFig.FontSize = 11;
            app.RespirationRateTimeFig.XLim = [0 100];
            app.RespirationRateTimeFig.YLim = [0 100];
            app.RespirationRateTimeFig.Box = 'on';
            app.RespirationRateTimeFig.Position = [303 23 275 185];

            % Create startEditFieldLabel
            app.startEditFieldLabel = uilabel(app.NavigatoranalysisPanel);
            app.startEditFieldLabel.HorizontalAlignment = 'right';
            app.startEditFieldLabel.VerticalAlignment = 'top';
            app.startEditFieldLabel.Position = [593 363 29 15];
            app.startEditFieldLabel.Text = 'start';

            % Create StartEditField
            app.StartEditField = uieditfield(app.NavigatoranalysisPanel, 'numeric');
            app.StartEditField.Limits = [1 Inf];
            app.StartEditField.RoundFractionalValues = 'on';
            app.StartEditField.ValueDisplayFormat = '%.0f';
            app.StartEditField.ValueChangedFcn = createCallbackFcn(app, @DisplayEditFieldValuesChanged, true);
            app.StartEditField.Enable = 'off';
            app.StartEditField.Position = [631 359 55 22];
            app.StartEditField.Value = 1000;

            % Create rangeEditFieldLabel
            app.rangeEditFieldLabel = uilabel(app.NavigatoranalysisPanel);
            app.rangeEditFieldLabel.HorizontalAlignment = 'right';
            app.rangeEditFieldLabel.VerticalAlignment = 'top';
            app.rangeEditFieldLabel.Position = [586 304 36 15];
            app.rangeEditFieldLabel.Text = 'range';

            % Create RangeEditField
            app.RangeEditField = uieditfield(app.NavigatoranalysisPanel, 'numeric');
            app.RangeEditField.Limits = [1 2000];
            app.RangeEditField.RoundFractionalValues = 'on';
            app.RangeEditField.ValueDisplayFormat = '%.0f';
            app.RangeEditField.ValueChangedFcn = createCallbackFcn(app, @DisplayEditFieldValuesChanged, true);
            app.RangeEditField.Enable = 'off';
            app.RangeEditField.Position = [631 300 55 22];
            app.RangeEditField.Value = 600;

            % Create DisplayrangeLabel
            app.DisplayrangeLabel = uilabel(app.NavigatoranalysisPanel);
            app.DisplayrangeLabel.HorizontalAlignment = 'center';
            app.DisplayrangeLabel.FontWeight = 'bold';
            app.DisplayrangeLabel.Position = [594.5 391 84 22];
            app.DisplayrangeLabel.Text = 'Display range';

            % Create StartSlider
            app.StartSlider = uislider(app.NavigatoranalysisPanel);
            app.StartSlider.Limits = [1 6000];
            app.StartSlider.MajorTicks = [];
            app.StartSlider.MajorTickLabels = {'1', '6000'};
            app.StartSlider.ValueChangedFcn = createCallbackFcn(app, @DisplaySlidersValueChanged, true);
            app.StartSlider.MinorTicks = [];
            app.StartSlider.Enable = 'off';
            app.StartSlider.Position = [604 339 82 3];
            app.StartSlider.Value = 1000;

            % Create RangeSlider
            app.RangeSlider = uislider(app.NavigatoranalysisPanel);
            app.RangeSlider.Limits = [1 2500];
            app.RangeSlider.MajorTicks = [];
            app.RangeSlider.MajorTickLabels = {'1', '6000'};
            app.RangeSlider.ValueChangedFcn = createCallbackFcn(app, @DisplaySlidersValueChanged, true);
            app.RangeSlider.MinorTicks = [];
            app.RangeSlider.Enable = 'off';
            app.RangeSlider.Position = [604 281 82 3];
            app.RangeSlider.Value = 600;

            % Create WindowCheckBox
            app.WindowCheckBox = uicheckbox(app.NavigatoranalysisPanel);
            app.WindowCheckBox.ValueChangedFcn = createCallbackFcn(app, @WindowCheckBoxValueChanged, true);
            app.WindowCheckBox.Enable = 'off';
            app.WindowCheckBox.Text = '  Window';
            app.WindowCheckBox.FontWeight = 'bold';
            app.WindowCheckBox.Position = [608 158 75 22];

            % Create startEditFieldLabel_2
            app.startEditFieldLabel_2 = uilabel(app.NavigatoranalysisPanel);
            app.startEditFieldLabel_2.HorizontalAlignment = 'right';
            app.startEditFieldLabel_2.VerticalAlignment = 'top';
            app.startEditFieldLabel_2.Position = [593 128 29 15];
            app.startEditFieldLabel_2.Text = 'start';

            % Create WindowStartEditField
            app.WindowStartEditField = uieditfield(app.NavigatoranalysisPanel, 'numeric');
            app.WindowStartEditField.Limits = [0 Inf];
            app.WindowStartEditField.RoundFractionalValues = 'on';
            app.WindowStartEditField.ValueDisplayFormat = '%.0f';
            app.WindowStartEditField.ValueChangedFcn = createCallbackFcn(app, @WindowEditFieldValueChanged, true);
            app.WindowStartEditField.Enable = 'off';
            app.WindowStartEditField.Position = [631 124 55 22];

            % Create endLabel
            app.endLabel = uilabel(app.NavigatoranalysisPanel);
            app.endLabel.HorizontalAlignment = 'right';
            app.endLabel.VerticalAlignment = 'top';
            app.endLabel.Position = [593 72 29 22];
            app.endLabel.Text = 'end';

            % Create WindowEndEditField
            app.WindowEndEditField = uieditfield(app.NavigatoranalysisPanel, 'numeric');
            app.WindowEndEditField.Limits = [1 Inf];
            app.WindowEndEditField.RoundFractionalValues = 'on';
            app.WindowEndEditField.ValueDisplayFormat = '%.0f';
            app.WindowEndEditField.ValueChangedFcn = createCallbackFcn(app, @WindowEditFieldValueChanged, true);
            app.WindowEndEditField.Enable = 'off';
            app.WindowEndEditField.Position = [631 75 55 22];
            app.WindowEndEditField.Value = 1;

            % Create WindowStartSlider
            app.WindowStartSlider = uislider(app.NavigatoranalysisPanel);
            app.WindowStartSlider.Limits = [1 6000];
            app.WindowStartSlider.MajorTicks = [];
            app.WindowStartSlider.MajorTickLabels = {'1', '6000'};
            app.WindowStartSlider.ValueChangedFcn = createCallbackFcn(app, @WindowSliderValueChanged, true);
            app.WindowStartSlider.MinorTicks = [];
            app.WindowStartSlider.Enable = 'off';
            app.WindowStartSlider.Position = [604 109 82 3];
            app.WindowStartSlider.Value = 1000;

            % Create WindowEndSlider
            app.WindowEndSlider = uislider(app.NavigatoranalysisPanel);
            app.WindowEndSlider.Limits = [1 6000];
            app.WindowEndSlider.MajorTicks = [];
            app.WindowEndSlider.MajorTickLabels = {'1', '6000'};
            app.WindowEndSlider.ValueChangedFcn = createCallbackFcn(app, @WindowSliderValueChanged, true);
            app.WindowEndSlider.MinorTicks = [];
            app.WindowEndSlider.Enable = 'off';
            app.WindowEndSlider.Position = [604 57 82 3];
            app.WindowEndSlider.Value = 1000;

            % Create MoviePanel
            app.MoviePanel = uipanel(app.UIFigure);
            app.MoviePanel.AutoResizeChildren = 'off';
            app.MoviePanel.ForegroundColor = [0 0.4471 0.7412];
            app.MoviePanel.TitlePosition = 'centertop';
            app.MoviePanel.Title = 'Movie';
            app.MoviePanel.FontWeight = 'bold';
            app.MoviePanel.FontSize = 14;
            app.MoviePanel.Position = [663 48 698 300];

            % Create PlayButton
            app.PlayButton = uibutton(app.MoviePanel, 'push');
            app.PlayButton.ButtonPushedFcn = createCallbackFcn(app, @PlayButtonPushed, true);
            app.PlayButton.BackgroundColor = [0.8 0.8 0.8];
            app.PlayButton.Enable = 'off';
            app.PlayButton.Position = [24 236 100 22];
            app.PlayButton.Text = 'Play';

            % Create StopButton
            app.StopButton = uibutton(app.MoviePanel, 'push');
            app.StopButton.ButtonPushedFcn = createCallbackFcn(app, @StopButtonPushed, true);
            app.StopButton.BackgroundColor = [0.8 0.8 0.8];
            app.StopButton.Enable = 'off';
            app.StopButton.Position = [24 196 100 22];
            app.StopButton.Text = 'Stop';

            % Create frameLabel
            app.frameLabel = uilabel(app.MoviePanel);
            app.frameLabel.Position = [24 147 46 22];
            app.frameLabel.Text = 'frame #';

            % Create MovieFrameEditField
            app.MovieFrameEditField = uieditfield(app.MoviePanel, 'numeric');
            app.MovieFrameEditField.ValueChangedFcn = createCallbackFcn(app, @MovieFrameEditFieldValueChanged, true);
            app.MovieFrameEditField.Enable = 'off';
            app.MovieFrameEditField.Position = [70 147 53 22];

            % Create intensityscalingLabel
            app.intensityscalingLabel = uilabel(app.MoviePanel);
            app.intensityscalingLabel.Position = [494 208 50 28];
            app.intensityscalingLabel.Text = {'intensity'; 'scaling'};

            % Create MovieScaleSlider
            app.MovieScaleSlider = uislider(app.MoviePanel);
            app.MovieScaleSlider.Limits = [0 2];
            app.MovieScaleSlider.MajorTicks = [0 1 2];
            app.MovieScaleSlider.Orientation = 'vertical';
            app.MovieScaleSlider.ValueChangedFcn = createCallbackFcn(app, @MovieScaleSliderValueChanged, true);
            app.MovieScaleSlider.Enable = 'off';
            app.MovieScaleSlider.FontSize = 10;
            app.MovieScaleSlider.Position = [553 194 3 57];
            app.MovieScaleSlider.Value = 1;

            % Create ccButton
            app.ccButton = uibutton(app.MoviePanel, 'push');
            app.ccButton.ButtonPushedFcn = createCallbackFcn(app, @ccButtonPushed, true);
            app.ccButton.BackgroundColor = [0.902 0.902 0.902];
            app.ccButton.Enable = 'off';
            app.ccButton.Position = [518 112 42 22];
            app.ccButton.Text = 'cc';

            % Create ccwButton
            app.ccwButton = uibutton(app.MoviePanel, 'push');
            app.ccwButton.ButtonPushedFcn = createCallbackFcn(app, @ccwButtonPushed, true);
            app.ccwButton.BackgroundColor = [0.902 0.902 0.902];
            app.ccwButton.Enable = 'off';
            app.ccwButton.Position = [518 81 44 22];
            app.ccwButton.Text = {'ccw'; ''};

            % Create RotateLabel
            app.RotateLabel = uilabel(app.MoviePanel);
            app.RotateLabel.HorizontalAlignment = 'center';
            app.RotateLabel.Position = [518 143 41 22];
            app.RotateLabel.Text = 'Rotate';

            % Create FrameIncrButton
            app.FrameIncrButton = uibutton(app.MoviePanel, 'push');
            app.FrameIncrButton.ButtonPushedFcn = createCallbackFcn(app, @FrameIncrButtonPushed, true);
            app.FrameIncrButton.BackgroundColor = [0.902 0.902 0.902];
            app.FrameIncrButton.Enable = 'off';
            app.FrameIncrButton.Position = [593 112 46 22];
            app.FrameIncrButton.Text = '+1';

            % Create FrameLabel
            app.FrameLabel = uilabel(app.MoviePanel);
            app.FrameLabel.HorizontalAlignment = 'center';
            app.FrameLabel.Position = [596 143 40 22];
            app.FrameLabel.Text = 'Frame';

            % Create FrameDecrButton
            app.FrameDecrButton = uibutton(app.MoviePanel, 'push');
            app.FrameDecrButton.ButtonPushedFcn = createCallbackFcn(app, @FrameDecrButtonPushed, true);
            app.FrameDecrButton.BackgroundColor = [0.902 0.902 0.902];
            app.FrameDecrButton.Enable = 'off';
            app.FrameDecrButton.Position = [593 81 46 22];
            app.FrameDecrButton.Text = '-1';

            % Create heartbpmLabel_2
            app.heartbpmLabel_2 = uilabel(app.MoviePanel);
            app.heartbpmLabel_2.HorizontalAlignment = 'right';
            app.heartbpmLabel_2.Position = [19 18 67 22];
            app.heartbpmLabel_2.Text = 'heart (bpm)';

            % Create FinalHeartViewField
            app.FinalHeartViewField = uieditfield(app.MoviePanel, 'numeric');
            app.FinalHeartViewField.Editable = 'off';
            app.FinalHeartViewField.Enable = 'off';
            app.FinalHeartViewField.Position = [97 20 35 20];

            % Create respbpmLabel_2
            app.respbpmLabel_2 = uilabel(app.MoviePanel);
            app.respbpmLabel_2.HorizontalAlignment = 'right';
            app.respbpmLabel_2.Position = [20 50 66 22];
            app.respbpmLabel_2.Text = 'resp. (bpm)';

            % Create FinalRespirationViewField
            app.FinalRespirationViewField = uieditfield(app.MoviePanel, 'numeric');
            app.FinalRespirationViewField.Editable = 'off';
            app.FinalRespirationViewField.Enable = 'off';
            app.FinalRespirationViewField.Position = [97 52 35 20];

            % Create Image2
            app.Image2 = uiimage(app.MoviePanel);
            app.Image2.Position = [209 4 270 270];
            app.Image2.ImageSource = 'square.png';

            % Create MovieFig
            app.MovieFig = uiaxes(app.MoviePanel);
            app.MovieFig.DataAspectRatio = [255 255 1];
            app.MovieFig.PlotBoxAspectRatio = [1 1 1];
            app.MovieFig.FontSize = 1;
            app.MovieFig.XLim = [0 255];
            app.MovieFig.YLim = [0 255];
            app.MovieFig.GridColor = 'none';
            app.MovieFig.Box = 'on';
            app.MovieFig.XColor = [0.902 0.902 0.902];
            app.MovieFig.XTick = [];
            app.MovieFig.YColor = [0.902 0.902 0.902];
            app.MovieFig.YTick = [];
            app.MovieFig.Color = [0.902 0.902 0.902];
            app.MovieFig.XGrid = 'on';
            app.MovieFig.YGrid = 'on';
            app.MovieFig.Position = [214 9 260 260];

            % Create Image3
            app.Image3 = uiimage(app.UIFigure);
            app.Image3.Position = [1294 827 80 57];
            app.Image3.ImageSource = 'AmsterdamUMC.gif';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = retrospective32_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @StartupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end