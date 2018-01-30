%%%% euclidean distance Dissimilarity %%%%

% Specify number of objects for training set (10)
number_of_objects = 10;

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
classifier = w*w2*ldc(data_set);
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
classifier = w*w2*svc(data_set, 'radial_basis', 9);
finish = clock;
error100_svc = nist_eval('my_rep', classifier, 100);
error50_svc = nist_eval('my_rep', classifier, 50);
error10_svc = nist_eval('my_rep', classifier, 10);
fprintf('%2.3f s\n', etime(finish, start));


%%%% city-block Dissimilarity %%%%

% Specify number of objects for training set (10)
number_of_objects = 10;

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
classifier = w*w2*ldc(data_set);
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
