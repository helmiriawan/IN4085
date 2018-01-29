%FEATURE_PREPARATION Function for Dissimilarity preparation
% 
%  A = DISSIMILARITY_PREPARATION(X, N, D, M)
%  
%
% INPUT
%   X    Data file
%   N    Desired size (N x N)
%   D    dimensional pseudo-Euclidean subspace 
%   M    Pseudo-Euclidean Linear Embedding criterion flag 
%        (0: euclidian distance, 1: city-block)
% 
% OUTPUT
%   A    Data set.
%
% DESCRIPTION
% Perform data preparation. This function consists of making images square,
% resizing, and obtaining the features of image. Then it construct the 
% dissmilarity matrix and embedded it into X Dimensional  pseudo-Euclidean 
% subspace .
% 
% SEE ALSO (<a href="http://37steps.com/prtools">PRTools Guide</a>)
% IM_BOX, IM_RESIZE, PRDATASET

function data_set = dissimilarity_preparation(data_file, pixel_size, dimension, measure)

    % Add rows/columns to make images square
    data_file = im_box(data_file, 0, 1);

    % Resize images to pixel_sizexpixel_size
    data_file = im_resize(data_file, [pixel_size pixel_size]);

    % Convert prdatafile to prdataset
    a = prdataset(data_file, []);
    
    % Define an mapping to the objects in a
    if measure == 1
        w = proxm(a,'city-block');
    else 
        w = proxm(a);
    end
    
    % Construct a dissimilarity representation for a
    d = a*w;
    
    %  Create linear mapping from a symmetric, square dissimilarity matrix
    %  into M-dimensional space
    w2 = psem(d,dimension);
    
    % Linear embedding into a pseudo-Euclidean M-dimension space
    data_set = d*w2;
end