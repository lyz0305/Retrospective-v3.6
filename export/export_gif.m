function export_gif(gifexportpath,movie,number_of_frames,tag,intensity_scale_slider)

% exports movie to animated gif

delay_time = 1/number_of_frames;  % one heartbeat is 1 second in the movie

if intensity_scale_slider == 0 
    intensity_scale_slider = 0.01;
end

scale = (1/intensity_scale_slider)*255/max(movie(:));

for idx = 1:number_of_frames
    if idx == 1
        imwrite(uint8(scale*squeeze(movie(:,:,idx))),[gifexportpath,'/movie-',tag,'-',num2str(number_of_frames),'frames.gif'],'DelayTime',delay_time,'LoopCount',inf);
    else
        imwrite(uint8(scale*squeeze(movie(:,:,idx))),[gifexportpath,'/movie-',tag,'-',num2str(number_of_frames),'frames.gif'],'WriteMode','append','DelayTime',delay_time);
    end
end
            
end                 