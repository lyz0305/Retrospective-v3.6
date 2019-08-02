function output = norm_images(input)

% normalize the images for equal image intensity for all the frames

for i=1:size(input,1)
    input(i,:,:) = input(i,:,:)/mean(input(i,:));
end

input = round(32767*input/max(input(:)));

output = input;

end