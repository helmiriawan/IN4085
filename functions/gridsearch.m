%GRIDSEARCH Function to do grid search
% 
%  GRIDSEARCH_KNN(A, S, C, P, I, K)
%  
%
% INPUT
%   A    Training data set.
%   S    Independent test data set.
%   C    Classifer.
%   P    List of parameter to change (e.g 1:5 or 5:5:50).
%   I    Number of iterations to train bpxnc (default: inf)
%   K    Untrained mapping to compute kernel during training svc
%        Default: linear kernel (PROXM('p',1))
%
% DESCRIPTION
% Estimate hold-out error of different number of parameters in order
% to find the most suitable parameter for the classifier.
%
% The type of parameter is based on the classifier, as can be seen in list
% below.
%
% knn       Number of the nearest neighbors used.
% bpxnc     Number of units in hidden layer.
% svc       Regularisation parameter.
%
% SEE ALSO (<a href="http://37steps.com/prtools">PRTools Guide</a>)
% KNNC, BPXNC, SVC, TESTC

function gridsearch(training, test, classifier, list, iteration, kernel)

    classifiers = 'knnc  bpxnc  svc';

    if strcmp(classifier, 'knnc')

        fprintf('\nk, error, training time\n');
        for k = list
            start = clock;
            classifier = knnc(training, k);
            finish = clock;
            time = etime(finish, start);
            error = testc(test, classifier);
            fprintf('%d, %1.3f, %4.3f\n', k, error, time);
        end
        fprintf('\n');

    elseif strcmp(classifier, 'bpxnc')

        fprintf('\nnodes, error, training time\n');
        for n = list
            start = clock;
            classifier = bpxnc(training, n, iteration);
            finish = clock;
            time = etime(finish, start);
            error = testc(test, classifier);
            fprintf('%d, %1.3f, %4.3f\n', n, error, time);
        end
        fprintf('\n');

    elseif strcmp(classifier, 'svc')
        
        fprintf('\nregularization parameter, error, training time\n');
        for c = list
            start = clock;
            classifier = svc(training, kernel, c);
            finish = clock;
            time = etime(finish, start);
            error = testc(test, classifier);
            fprintf('%d, %1.3f, %4.3f\n', c, error, time);
        end
        fprintf('\n');

    else
        fprintf('Please use one of these classifiers\n\t%s\n', classifiers);
    
    end

end