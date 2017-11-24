% Function for data preparation
%
% INPUT
%   data_set        Data set input
%   pixel_size      New pixel size (height and width)
%
% OUTPUT
%   training        Training set
%   test            Test set
%

function [training, test] = data_preparation(data_set, pixel_size)

    % Add rows/columns to make images square
    data_set = im_box(data_set, 0, 1);

    % Resize images to 20x20 pixels
    data_set = im_resize(data_set, [pixel_size pixel_size]);

    % Split the data into training and test set
    [training, test] = gendat(data_set, 0.5);

end