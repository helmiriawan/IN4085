% Load NIST data file
data_file = prnist(0:9, 1:10);

% Hide warning messages
prwarning off;





% Investigate pixel size %

for pixel = [10 20 30]
    data_set = data_preparation(data_file, pixel);
    crossvalidation(data_set, 5, 10)
end





% Model optimization %

% Data preparation
data_set = data_preparation(data_file, 20);

% k-Nearest Neighbor
gridsearch(data_set, [], 'cross-validation', 'knnc', 1:10)

% Back-propagation Feed-forward Neural Network
gridsearch(data_set, [], 'cross-validation', 'bpxnc', 5:5:50, 2000)

% Support Vector Machine
gridsearch(data_set, [], 'cross-validation', 'svc', 1:10, [], 'radial_basis')





% Feature reduction %

% Load NIST data file
data_file = prnist(0:9, 1:10);
data_set = data_preparation(data_file, 20);

% Get the best n features
start = clock;
n = 200;
selected_features = featself(data_set, 'eucl-s', n);
finish = clock;
fprintf('%2.3f s\n', etime(finish, start));

% Plot the feature curve
feature_curve(data_set*selected_features, [20:20:200])

% Evaluate with cross validation
crossvalidation(data_set*selected_features, 5, 10)

% k-Nearest Neighbor
gridsearch(data_set*selected_features, [], 'cross-validation', 'knnc', 1:10)

% Back-propagation Feed-forward Neural Network
gridsearch(data_set*selected_features, [], 'cross-validation', 'bpxnc', 5:5:50, 2000)

% Support Vector Machine 
gridsearch(data_set*selected_features, [], 'cross-validation', 'svc', 1:10, [], 'radial_basis')
