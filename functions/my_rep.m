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

%     data_set = data_preparation(data_file, 20);
    data_set = feature_preparation(data_file, 20);
%     data_set = dissimilarity_preparation(data_file, 20, 30, 0);

end