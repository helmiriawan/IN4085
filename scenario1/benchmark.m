% Specify number of objects for training set (200-1000)
number_of_objects = 400;

% Retrieve NIST data file
data_file = prnist(0:9, 1:number_of_objects);

% Pre-process and convert data file to data set
data_set = my_rep(data_file);

% Compute the classifier
start = clock;
classifier = svc(data_set, 'radial_basis', 6);
finish = clock;

% Evaluate the error classification
error = nist_eval('my_rep', classifier, 100);

% Show training time
fprintf('%2.3f s\n', etime(finish, start));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% With feature reduction

% Compute the classifier
selected_features = featself(data_set, 'eucl-s', 280);
start = clock;
classifier = selected_features*svc(data_set*selected_features, 'radial_basis', 6);
finish = clock;

% Evaluate the error classification
error = nist_eval('my_rep', classifier, 100);

% Show training time
fprintf('%2.3f s\n', etime(finish, start));