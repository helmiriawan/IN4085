% Data Understanding %


% Load NIST data set
data_set = prnist(0:9, 1:400);

% Show sample data
show(data_set(1:40:4000))

% Show data of first class
show(data_set(1:400))

% Show single image
show(data_set(1))





% Data Preparation %

% Using self-made function
[training, test] = data_preparation(data_set, 20);





% Modeling %


% Train classifier
classifier = nmc(training);

% Evaluate classifier
testc(test, classifier)

