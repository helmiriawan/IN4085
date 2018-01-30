% Specify number of objects for training set (10)
number_of_objects = 10;

% Retrieve NIST data file
data_file = prnist(0:9, 1:number_of_objects);

% Pre-process and convert data file to data set
data_set = my_rep(data_file);

% Compute the classifier
start = clock;
classifier = ldc(data_set);
finish = clock;

% Compute the classifier
start = clock;
classifier = ldc(data_set);
finish = clock;

% Evaluate the error classification
error = nist_eval('my_rep', classifier, 100);

% Show training time
fprintf('%2.3f s\n', etime(finish, start));





% With feature reduction
% Compute the classifier
start = clock;
selected_features = featself(data_set, 'eucl-s', 12);
classifier = selected_features*ldc(data_set*selected_features);
finish = clock;

% Evaluate the error classification
error_ldc_100 = nist_eval('my_rep', classifier, 100);
error_ldc_50 = nist_eval('my_rep', classifier, 50);
error_ldc_10 = nist_eval('my_rep', classifier, 10);

% Show training time
fprintf('%2.3f s\n', etime(finish, start));