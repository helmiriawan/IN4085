%DATA_PREPARATION Function for data preparation
% 
%  A = DATA_PREPARATION(X, N)
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
% resizing, and converting the result to prdataset.
%
% SEE ALSO (<a href="http://37steps.com/prtools">PRTools Guide</a>)
% IM_BOX, IM_RESIZE, PRDATASET

function data_set = data_preparation(data_file, pixel_size)

    % Add rows/columns to make images square
    data_file = im_box(data_file, 0, 1);

    % Resize images to 20x20 pixels
    data_file = im_resize(data_file, [pixel_size pixel_size]);

    % Convert prdatafile to prdataset
    data_set = prdataset(data_file, []);

end