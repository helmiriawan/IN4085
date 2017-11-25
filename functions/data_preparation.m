%DATA_PREPARATION Function for data preparation
% 
%  [A, B] = DATA_PREPARATION(X, N)
%  
%
% INPUT
%   X    Dataset
%   N    Desired size (N x N)
%
% OUTPUT
%   A    Training set
%   B    Test set
%
% DESCRIPTION
% Perform data preparation. This part consists of making images square,
% resize images, and generating training and test set from the whole data.
%
% SEE ALSO (<a href="http://37steps.com/prtools">PRTools Guide</a>)
% IM_BOX, IM_RESIZE, GENDAT

function [training, test] = data_preparation(data_set, pixel_size)

    % Add rows/columns to make images square
    data_set = im_box(data_set, 0, 1);

    % Resize images to 20x20 pixels
    data_set = im_resize(data_set, [pixel_size pixel_size]);

    % Split the data into training and test set
    [training, test] = gendat(data_set, 0.5);

end