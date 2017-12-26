%%%%%%% Data Understanding %%%%%%%

% Load NIST data file
% data_file = prnist(0:9, 1:250);
data_file = prnist(0:9, 1:400);

% Show sample data
show(data_file(1:40:4000))

% Show data of first class
figure,show(data_file(1:400))

% Show single image
figure,show(data_file(1))

% Hide warning messages
prwarning off;


% Investigate classifier based on Features
data_set = feature_preparation(data_file, 128);
crossvalidation(data_set, 5, 10)



%%%%%%% Model optimization %%%%%%%

% k-Nearest Neighbor
gridsearch(data_set, [], 'cross-validation', 'knnc', 1:10)

% Back-propagation Feed-forward Neural Network
gridsearch(data_set, [], 'cross-validation', 'bpxnc', 5:5:50, 2000)

% Support Vector Machine
% data_file = prnist(0:9, 1:400);
% data_set = feature_preparation(data_file, 128);
[training, test] = gendat(data_set, 0.5);
gridsearch(training, test, 'hold-out', 'svc', 1:10, [], 'radial_basis')
