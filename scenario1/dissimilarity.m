%%%%%%% Data Understanding %%%%%%%

% Load NIST data file
data_file = prnist(0:9, 1:250);

% Hide warning messages
prwarning off;

% Investigate classifier based on Dissimilarity (euclidian distance)
% data_set = dissimilarity_preparation(data_file,20,30,0);

% Investigate classifier based on Dissimilarity (city-block)
data_set = dissimilarity_preparation(data_file,20,30,1);

crossvalidation(data_set, 5, 10)

%%%%%%% Model optimization %%%%%%%

% k-Nearest Neighbor
gridsearch(data_set, [], 'cross-validation', 'knnc', 1:10)

% Back-propagation Feed-forward Neural Network
gridsearch(data_set, [], 'cross-validation', 'bpxnc', 5:5:50, 2000)

% Support Vector Machine
data_file = prnist(0:9, 1:400);
data_set = dissimilarity_preparation(data_file,20,30,0);
[training, test] = gendat(data_set, 0.5);
gridsearch(training, test, 'hold-out', 'svc', 1:10, [], 'radial_basis')



% Feature reduction %

% Load NIST data file
data_file = prnist(0:9, 1:250);

data_set = dissimilarity_preparation(data_file,20,30,0);

% Get the best n features
start = clock;
n = 30;
selected_features = featself(data_set, 'eucl-s', n);
finish = clock;
fprintf('%2.3f s\n', etime(finish, start));

% Generate feature curve
feature_curve_qdc = clevalf(data_set*selected_features, qdc, [1:1:30], 0.4, 5);
plote(feature_curve);

feature_curve_knnc = clevalf(data_set*selected_features, knnc([],1), [1:1:30], 0.4, 5);
plote(feature_curve);

feature_curve_parzenc = clevalf(data_set*selected_features, parzenc, [1:1:30], 0.4, 5);
plote(feature_curve);