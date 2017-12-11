% Load NIST data file
data_file = prnist(0:9, 1:10);





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

% k-Nearest Neighbor
gridsearch(data_set, [], 'cross-validation', 'bpxnc', 5:5:50, 2000)

% Support Vector Machine 
gridsearch(data_set, [], 'cross-validation', 'svc', 1:10, [], 'radial_basis')