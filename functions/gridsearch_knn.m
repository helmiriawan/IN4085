%GRIDSEARCH_KNN Function to do grid search for k-nn classifier
% 
%  GRIDSEARCH_KNN(A, S, N)
%  
%
% INPUT
%   A    Training data set.
%   S    Independent test data set.
%   N    List of k to perform (e.g 1:5).
%
% DESCRIPTION
% Estimate hold-out error of different number of nearest neighbors in order
% to find the most suitable k for k-Nearest Neighbor classifier.
%
% SEE ALSO (<a href="http://37steps.com/prtools">PRTools Guide</a>)
% KNNC

function gridsearch_knn(training, test, list)

    fprintf('\nk, error\n');
    for k = list
        classifier = knnc(training, k);
        error = testc(test, classifier);
        fprintf('%d, %1.3f\n', k, error);
    end
    fprintf('\n');

end