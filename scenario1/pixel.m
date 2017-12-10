% Data Understanding %

% Load NIST data file
data_file = prnist(0:9, 1:400);

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
    [training, test] = gendat(data_set, 0.5);
    learning_curve(training, test, 200:200:2000)
    holdout(training, test)
end





% Model optimization %

% Data preparation
data_set = data_preparation(data_file, 20);
[training, test] = gendat(data_set, 0.5);

% k-Nearest Neighbor
gridsearch(training, test, 'knnc', 1:10)

% Back-propagation Feed-forward Neural Network
gridsearch(training, test, 'bpxnc', 5:5:50, 2000)

% Support Vector Machine 
gridsearch(training, test, 'svc', 1:10, [], 'radial_basis')
