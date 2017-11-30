% Data Understanding %


% Load NIST data set
data_file = prnist(0:9, 1:400);

% Show sample data
show(data_file(1:40:4000))

% Show data of first class
show(data_file(1:400))

% Show single image
show(data_file(1))





% Data Preparation %

% Using self-made function
[training, test] = data_preparation(data_file, 20);





% Modeling %

% Generate feature curve
feature_curve(training, test, [40:40:400])

% Train classifier
classifier = nmc(training);

% Evaluate classifier
testc(test, classifier)
