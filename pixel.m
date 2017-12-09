% Data Understanding %

% Load NIST data set
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
    [training, test] = data_preparation(data_file, pixel);
    learning_curve(training, test, 200:200:2000)
    holdout(training, test)
end





% Model optimization %

% k-Nearest Neighbor
[training, test] = data_preparation(data_file, 20);
gridsearch_knn(training, test, 1:10)

% Back-propagation Feed-forward Neural Network
[training, test] = data_preparation(data_file, 20);
gridsearch_bpxnc(training, test, 5:5:50, 2000)

% Support Vector Machine 
[training, test] = data_preparation(data_file, 20);
gridsearch_svc(training, test, 'radial_basis', 1:10)
