%FEATURE_PREPARATION Function for feature preparation
% 
%  A = FEATURE_PREPARATION(X, N, M)
%  
%
% INPUT
%   X    Data file
%   N    Desired size (N x N)
% 
% OUTPUT
%   A    Data set.
%
% DESCRIPTION
% Perform data preparation. This function consists of making images square,
% resizing, and obtaining the features of image.
%
% SEE ALSO (<a href="http://37steps.com/prtools">PRTools Guide</a>)
% IM_BOX, IM_RESIZE, PRDATASET

function data_set = feature_preparation(data_file, pixel_size)

    % Add rows/columns to make images square
    data_file = im_box(data_file, 0, 1);

    % Resize images to pixel_sizexpixel_size
    data_file = im_resize(data_file, [pixel_size pixel_size]);

    % Obtain the features of NIST images
    data_set = im_features(data_file,data_file,'all');

end