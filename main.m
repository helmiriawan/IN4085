%%%%%%%%%%%%%%%%%%%%%%
% Data Understanding %
%%%%%%%%%%%%%%%%%%%%%%

% Load NIST data set
data_set = prnist(0:9, 1:1000);

% Show sample data
show(data_set(1:100:10000))

% Show data of first class
show(data_set(1:1000))

% Show single image
show(data_set(1))


%%%%%%%%%%%%%%%%%%%%
% Data Preparation %
%%%%%%%%%%%%%%%%%%%%

% Add rows/columns to make images square
data_set = im_box(data_set, 0, 1);

% Resize images to 20x20 pixels
data_set = im_resize(data_set, [20 20]);
