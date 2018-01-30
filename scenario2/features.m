% Load NIST data file
data_file = prnist(0:9, 1:10);

% display dataset
figure,show(data_file)

% Hide warning messages
prwarning off;

% obtain the features rep. of digit images
data_set = feature_preparation(data_file, 20);

% Investigate classifier based on Features
crossvalidation(data_set, 5, 10)

% k-Nearest Neighbor
gridsearch(data_set, [], 'cross-validation', 'knnc', 1:10)

% Back-propagation Feed-forward Neural Network
gridsearch(data_set, [], 'cross-validation', 'bpxnc', 5:5:50, 2000)

% Support Vector Machine 
gridsearch(data_set, [], 'cross-validation', 'svc', 1:10, [], 'radial_basis')




% Feature reduction %

% Load NIST data file
data_file = prnist(0:9, 1:10);

data_set = feature_preparation(data_file, 20);

% Get the best n features
start = clock;
n = 24;
selected_features = featself(data_set, 'eucl-s', n);
finish = clock;
fprintf('%2.3f s\n', etime(finish, start));

% Generate feature curve
feature_curve = clevalf(data_set*selected_features, ldc, [1:1:24], 0.8, 5);
plote(feature_curve);


%%%%%% Combining Classifier %%%%%%

% Specify number of objects for training set (10)
number_of_objects = 10;

% Retrieve NIST data file
data_file = prnist(0:9, 1:number_of_objects);

% Pre-process and convert data file to data set
data_set = feature_preparation(data_file, 20);

% Compute the classifier 
combine_classifiers(data_set, 5, 10, ldc)