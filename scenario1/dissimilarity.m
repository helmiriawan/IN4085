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
feature_curve_qdc = clevalf(data_set*selected_features, qdc, [1:1:30], 0.8, 5);
plote(feature_curve);

feature_curve_knnc = clevalf(data_set*selected_features, knnc([],1), [1:1:30], 0.8, 5);
plote(feature_curve);

feature_curve_parzenc = clevalf(data_set*selected_features, parzenc, [1:1:30], 0.8, 5);
plote(feature_curve);



% Combine Classifiers %

% Load NIST data file
data_file = prnist(0:9, 1:250);

data_set = dissimilarity_preparation(data_file,20,30,0);

error_mean = 0;
error_min = 0;
error_max = 0;
error_prod = 0;
error_median = 0;
error_vote = 0;
for i=1:10
    [trn,tst] = gendat(data_set,0.5);
    w1 = qdc(trn)*classc;
    w2 = knnc(trn,1)*classc;
    w3 = parzenc(trn)*classc;
    v = [w1; w2; w3]; 
    w = v*meanc;
    error_mean = error_mean + [tst tst tst]*w*testc;
    w = v*minc;
    error_min = error_min + [tst tst tst]*w*testc;
    w = v*maxc;
    error_max = error_max + [tst tst tst]*w*testc;   
    w = v*prodc;
    error_prod = error_prod + [tst tst tst]*w*testc;     
    w = v*medianc;
    error_median = error_median + [tst tst tst]*w*testc;  
    w = v*votec;
    error_vote = error_vote + [tst tst tst]*w*testc;  
end

error_mean = error_mean/10;
error_min = error_min/10;
error_max = error_max/10;
error_prod = error_prod/10;
error_median = error_median/10;
error_vote = error_vote/10;

% combine classifier with classfier

combine_classifiers(data_set, 5, 10)
