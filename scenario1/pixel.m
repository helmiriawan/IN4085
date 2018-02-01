% Data Understanding %

% Load NIST data file
data_file = prnist(0:9, 1:250);

% Show sample data
show(data_file(1:40:4000))

% Show data of first class
show(data_file(1:400))

% Show single image
show(data_file(1))

% Hide warning messages
prwarning off;





% Investigate pixel size %

for pixel = [10 20 30]
    data_set = data_preparation(data_file, pixel);
    crossvalidation(data_set, 5, 10)
end





% Model optimization %

% k-Nearest Neighbor
data_file = prnist(0:9, 1:250);
data_set = data_preparation(data_file, 20);
gridsearch(data_set, [], 'cross-validation', 'knnc', 1:10)

% Back-propagation Feed-forward Neural Network
data_file = prnist(0:9, 1:250);
data_set = data_preparation(data_file, 20);
gridsearch(data_set, [], 'cross-validation', 'bpxnc', 5:5:50, 2000)

% Support Vector Machine
data_file = prnist(0:9, 1:400);
data_set = data_preparation(data_file, 20);
[training, test] = gendat(data_set, 0.5);
gridsearch(training, test, 'hold-out', 'svc', 1:10, [], 'radial_basis')





% Feature reduction %

% Data preparation
data_file = prnist(0:9, 1:400);
data_set = data_preparation(data_file, 20);
[training, test] = gendat(data_set, 0.5);

% Get the best n features
start = clock;
n = 400;
selected_features = featself(data_set, 'eucl-s', n);
finish = clock;
fprintf('%2.3f s\n', etime(finish, start));

% Generate feature curve
feature_curve = clevalf(training*selected_features, svc([], 'radial_basis', 6), [40:40:400], [], 1, test*selected_features);
plote(feature_curve);