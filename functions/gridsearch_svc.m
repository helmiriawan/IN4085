%GRIDSEARCH_SVC Function to do grid search for Support Vector Machine
%classifier
% 
%  GRIDSEARCH_SVC(A, S, K, C)
%  
%
% INPUT
%   A    Training data set.
%   S    Independent test data set.
%   K    Untrained mapping to compute kernel during training
%        Default: linear kernel (PROXM('p',1))
%   N    List of number of regularization parameter to perform (e.g 1:5).
%
% DESCRIPTION
% Estimate hold-out error of different number of regularization parameter 
% in order to find the most suitable regularization parameter of Support 
% Vector Machine classifier.
%
% SEE ALSO (<a href="http://37steps.com/prtools">PRTools Guide</a>)
% SVC, TESTC

function gridsearch_svc(training, test, kernel, list)

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

end