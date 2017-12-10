% Specify number of objects for training set (200-1000)
number_of_objects = 500;

% Retrieve NIST data file
data_file = prnist(0:9, 1:number_of_objects);

% Pre-process and convert data file to data set
data_set = my_rep(data_file);

% Compute the classifier
classifier = svc(data_set, 'radial_basis', 6);

% Evaluate the error classification
error = nist_eval('my_rep', classifier, 100);