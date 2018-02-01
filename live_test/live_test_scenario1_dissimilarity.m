
dir = strcat(pwd,'\binary\');
addpath(dir)

data_file = prdatafile(dir);

% Generate labels
labels = [];
k = 0;
name = 'digit_';
for i=1:10
    label = strcat(name,int2str(k));
    for j=1:10
        labels = vertcat(labels,label);
    end
    k = k + 1;
end

data_test_set = data_preparation(data_file,20);

% Set labels for test set
test_set = prdataset(data_test_set, labels);




% Specify number of objects for training set (200-1000)
number_of_objects = 400;

% Retrieve NIST data file
data_file = prnist(0:9, 1:number_of_objects);

% Pre-process and convert data file to data set
a = data_preparation(data_file,20);
w = proxm(a); % euclidian distance	
d = a*w;
w2 = psem(d,30);
data_set = d*w2;

% Compute the classifier
start = clock;
classifier = w*w2*qdc(data_set);
finish = clock;


% Compute error using test set
error = test_set*classifier*testc;
