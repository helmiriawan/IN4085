%%%% euclidean distance Dissimilarity %%%%

% Specify number of objects for training set (200-1000)
number_of_objects = 400;

% Retrieve NIST data file
data_file = prnist(0:9, 1:number_of_objects);

% Pre-process and convert data file to data set
a = my_rep(data_file);
w = proxm(a);	% euclidian distance	
d = a*w;
w2 = psem(d,30);
data_set = d*w2;

% Compute the classifier
start = clock;
classifier = w*w2*qdc(data_set);
finish = clock;

% Evaluate the error classification
error100_qdc = nist_eval('my_rep', classifier, 100);
error50_qdc = nist_eval('my_rep', classifier, 50);
error10_qdc = nist_eval('my_rep', classifier, 10);

% Show training time
fprintf('%2.3f s\n', etime(finish, start));

% Compute 1-nnc
start = clock;
classifier = w*w2*knnc(data_set,1);
finish = clock;
error100_knnc = nist_eval('my_rep', classifier, 100);
error50_knnc = nist_eval('my_rep', classifier, 50);
error10_knnc = nist_eval('my_rep', classifier, 10);
fprintf('%2.3f s\n', etime(finish, start));

% Compute parzenc
start = clock;
classifier = w*w2*parzenc(data_set);
finish = clock;
error100_parzenc = nist_eval('my_rep', classifier, 100);
error50_parzenc = nist_eval('my_rep', classifier, 50);
error10_parzenc = nist_eval('my_rep', classifier, 10);
fprintf('%2.3f s\n', etime(finish, start));

% Compute svc
start = clock;
classifier = w*w2*svc(data_set, 'radial_basis', 5);
finish = clock;
error100_svc = nist_eval('my_rep', classifier, 100);
error50_svc = nist_eval('my_rep', classifier, 50);
error10_svc = nist_eval('my_rep', classifier, 10);
fprintf('%2.3f s\n', etime(finish, start));


%%%% city-block Dissimilarity %%%%

% Specify number of objects for training set (10)
number_of_objects = 400;

% Retrieve NIST data file
data_file = prnist(0:9, 1:number_of_objects);

% Pre-process and convert data file to data set
a = my_rep(data_file);
w = proxm(a,'c');	% city-block	
d = a*w;
w2 = psem(d,30);
data_set = d*w2;

% Compute the classifier
start = clock;
classifier = w*w2*qdc(data_set);
finish = clock;

% Evaluate the error classification
error100_ldc = nist_eval('my_rep', classifier, 100);
error50_ldc = nist_eval('my_rep', classifier, 50);
error10_ldc = nist_eval('my_rep', classifier, 10);

% Show training time
fprintf('%2.3f s\n', etime(finish, start));

% Compute 1-nnc
start = clock;
classifier = w*w2*knnc(data_set,1);
finish = clock;
error100_knnc = nist_eval('my_rep', classifier, 100);
error50_knnc = nist_eval('my_rep', classifier, 50);
error10_knnc = nist_eval('my_rep', classifier, 10);
fprintf('%2.3f s\n', etime(finish, start));

% Compute parzenc
start = clock;
classifier = w*w2*parzenc(data_set);
finish = clock;
error100_parzenc = nist_eval('my_rep', classifier, 100);
error50_parzenc = nist_eval('my_rep', classifier, 50);
error10_parzenc = nist_eval('my_rep', classifier, 10);
fprintf('%2.3f s\n', etime(finish, start));

% Compute svc
start = clock;
classifier = w*w2*svc(data_set, 'radial_basis', 6);
finish = clock;
error100_svc = nist_eval('my_rep', classifier, 100);
error50_svc = nist_eval('my_rep', classifier, 50);
error10_svc = nist_eval('my_rep', classifier, 10);
fprintf('%2.3f s\n', etime(finish, start));




% Feature reduction %

% Specify number of objects for training set (200-1000)
number_of_objects = 400;

% Retrieve NIST data file
data_file = prnist(0:9, 1:number_of_objects);

% Pre-process and convert data file to data set
a = my_rep(data_file);
w = proxm(a);	% euclidian distance	
d = a*w;
w2 = psem(d,30);
data_set = d*w2;

% Get the best n features
start = clock;
n = 23;
selected_features = featself(data_set, 'eucl-s', n);
finish = clock;
fprintf('%2.3f s\n', etime(finish, start));

% Compute the qdc classifier
start = clock;
classifier = w*w2*selected_features*qdc(data_set*selected_features);
finish = clock;
fprintf('%2.3f s\n', etime(finish, start));
error100_qdc = nist_eval('my_rep', classifier, 100);
error50_qdc = nist_eval('my_rep', classifier, 50);
error10_qdc = nist_eval('my_rep', classifier, 10);

% Compute 1-nnc
start = clock;
classifier = w*w2*selected_features*knnc(data_set*selected_features,1);
finish = clock;
error100_knnc = nist_eval('my_rep', classifier, 100);
error50_knnc = nist_eval('my_rep', classifier, 50);
error10_knnc = nist_eval('my_rep', classifier, 10);
fprintf('%2.3f s\n', etime(finish, start));

% Compute parzenc
start = clock;
classifier = w*w2*selected_features*parzenc(data_set*selected_features);
finish = clock;
error100_parzenc = nist_eval('my_rep', classifier, 100);
error50_parzenc = nist_eval('my_rep', classifier, 50);
error10_parzenc = nist_eval('my_rep', classifier, 10);
fprintf('%2.3f s\n', etime(finish, start));


% Combine Classifiers %

% Specify number of objects for training set (200-1000)
number_of_objects = 400;

% Retrieve NIST data file
data_file = prnist(0:9, 1:number_of_objects);

% Pre-process and convert data file to data set
a = my_rep(data_file);
w = proxm(a);	% euclidian distance	
d = a*w;
w2 = psem(d,30);
data_set = d*w2;

% combine with parzenc
p = [qdc*classc knnc([],1) parzenc]*parzenc;
w3 = data_set*p;

% Compute the classifier
start = clock;
classifier = w*w2*w3;
finish = clock;
error = nist_eval('my_rep', classifier, 100);
fprintf('%2.3f s\n', etime(finish, start));

% combine with 1-nnc
p = [qdc*classc knnc([],1) parzenc]*knnc([],1);
w3 = data_set*p;

start = clock;
classifier = w*w2*w3;
finish = clock;

error = nist_eval('my_rep', classifier, 100);
fprintf('%2.3f s\n', etime(finish, start));
