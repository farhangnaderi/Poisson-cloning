function [final_out1] = poissonCloning(foreground_in,background_in)

%%Load images and masks
close all

background = im2double(imread(background_in));
foreground = im2double(imread(foreground_in));

% destination_point_x = 240;
% destination_point_y = 230;
%load('masks2');

%%Select patch
disp('Select source patch and double click. Don''t get too close to the edges');
mask = roipoly(foreground);

disp('Select destination');
figure;

imshow(background);

h = imrect;
a = h.getPosition;

destination_point_x=ceil(a(1));
destination_point_y=ceil(a(2));
destination_size_x=ceil(a(3));
destination_size_y=ceil(a(4));

%Resize source image
scale = destination_size_x/size(foreground,1);
foreground = imresize(foreground,scale);
mask = imresize(mask,scale);

close all

final_out1 = rgbClone( destination_point_x, destination_point_y, mask, foreground ,background);

figure;
imshow(final_out1);
title('Result');
end

