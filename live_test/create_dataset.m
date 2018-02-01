% Generate datafile

directory = strcat(pwd,'\binary\');
addpath(directory)

directory = strcat(pwd,'\live_dataset\');
addpath(directory)

listing = dir(directory);
l = size(listing);
for i=1:(l(1)-2)  
    A = imread(listing(i+2).name);
    BW = imbinarize(rgb2gray(A));
    BW = imcomplement(BW);
    name = strcat('binary\',listing(i+2).name);
    imwrite(BW,name)
end

directory = strcat(pwd,'\binary\');
data_file = prdatafile(directory);

