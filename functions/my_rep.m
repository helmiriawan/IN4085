%MY_REP Function to do data preparation for the benchmark
% 
%  A = MY_REP(X, N)
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
% Perform data preparation for the benchmark. This function consists of
% making images square, resizing to 20x20, and converting the result to
% prdataset.
%
% SEE ALSO (<a href="http://37steps.com/prtools">PRTools Guide</a>)
% IM_BOX, IM_RESIZE, PRDATASET

function data_set = my_rep(data_file)

    % Add rows/columns to make images square
    data_file = im_box(data_file, 0, 1);

    % Resize images to 20x20 pixels
    data_file = im_resize(data_file, [20 20]);

    % Convert prdatafile to prdataset
    data_set = prdataset(data_file, []);

end