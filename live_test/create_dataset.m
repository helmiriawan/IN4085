% Generate datafile

addpath('D:\Master ES TU Delft 2016\Elective Course\Pattern Recognition\IN4085\live_test\live_dataset')
addpath('D:\Master ES TU Delft 2016\Elective Course\Pattern Recognition\IN4085\live_test\binary')

listing = dir('D:\Master ES TU Delft 2016\Elective Course\Pattern Recognition\IN4085\live_test\live_dataset');
l = size(listing);
for i=1:l(1)  
    A = imread(listing(i+2).name);
    BW = imbinarize(rgb2gray(A));
    name = strcat('binary\',listing(i+2).name);
    imwrite(BW,name)
end

data_file = prdatafile('D:\Master ES TU Delft 2016\Elective Course\Pattern Recognition\IN4085\live_test\binary');




%%%% Copy steps below to obtain the dataset %%%% 
% data_file = prdatafile('binary');

% Add rows/columns to make images square
data_file = im_box(data_file, 0, 1);

% Resize images to 20x20 pixels
data_file = im_resize(data_file, [20 20]);

% Generate labels
labels = [];
k = 0;
for i=1:10
    for j=1:10
        labels = vertcat(labels,k);
    end
    k = k + 1;
end

% Convert prdatafile to prdataset
data_set = prdataset(data_file, labels);
