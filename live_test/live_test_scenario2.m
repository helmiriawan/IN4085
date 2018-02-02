
dir = strcat(pwd,'\binary\');
addpath(dir)

data_file = prdatafile(dir);

% Generate labels
labels = [];
k = 0;
name = 'digit_';
for i=1:10
    label = strcat(name,int2str(k));
    for j=1:10
        labels = vertcat(labels,label);
    end
    k = k + 1;
end

% Get features rep
test_set = feature_preparation(data_file,20);

% Set labels for test set
test_set = prdataset(test_set, labels);




% Specify number of objects for training set (10)
number_of_objects = 10;

% Retrieve NIST data file
data_file = prnist(0:9, 1:number_of_objects);

% Pre-process and convert data file to data set
training_set = feature_preparation(data_file,20);

% Compute the classifier
start = clock;
classifier = ldc(training_set);
finish = clock;

% Compute error using test set
error = test_set*classifier*testc;

label_original = getlab(test_set);
label_result = test_set*classifier*labeld;
confmat(label_original,label_result)
