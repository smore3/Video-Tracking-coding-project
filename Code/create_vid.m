%Script file to combine images to an uncompressed avi file
%Directory that contains images

in_dir = 'e:\images\';
fout = 'analysis.avi'; %Output file name

% num_images = numFrms; %Number of images

%Set a suitable frame rate fps
aviobj = avifile(fout);
for i = 1:frmn
           
% temp = sprintf('%d', i);
%name = [in_dir, 'image_', temp, '.bmp']; %For ppm, change
name = [in_dir, 'img_' num2str(frmn) '_' num2str(k)  '.jpg'];
[img map] = imread(name);
frm = im2frame(img,map);
aviobj = addframe(aviobj,frm);
        
    end
aviobj = close(aviobj);