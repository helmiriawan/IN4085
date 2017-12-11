%GRIDSEARCH Function to do grid search
% 
%  GRIDSEARCH_KNN(A, S, E, C, P, I, K)
%  
%
% INPUT
%   A    Training data set.
%   S    Independent test data set.
%   E    Evaluation technique.
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
% KNNC, BPXNC, PRCROSSVAL, SVC, TESTC

function gridsearch(training, test, evaluation, classifier, list, iteration, kernel)

    % List of classifiers and evaluation methods
    classifiers = 'knnc  bpxnc  svc';
    methods = 'hold-out  cross-validation';

    % K-nearest Neighbors %
    if strcmp(classifier, 'knnc')

        % Hold-out
        if strcmp(evaluation, 'hold-out')

            fprintf('\nk, error, training time\n');
            for k = list
                start = clock;
                classifier = knnc(training, k);
                finish = clock;
                error = testc(test, classifier);
                fprintf('%d, %1.3f, %4.3f\n', k, error, etime(finish, start));
            end
            fprintf('\n');

        % Cross-validation
        elseif strcmp(evaluation, 'cross-validation')

            fprintf('\nk, error, standard deviation\n');
            for k = list
                [error, std]= prcrossval(training, knnc([], k), 5, 10);
                fprintf('%d, %1.3f, %4.3f\n', k, error, std);
            end
            fprintf('\n');

        else
            fprintf('Please use one of these evaluation\n\t%s\n', methods);

        end


    % Back-propagation Feed-forward Neural Network %
    elseif strcmp(classifier, 'bpxnc')

        % Hold-out
        if strcmp(evaluation, 'hold-out')

            fprintf('\nnodes, error, training time\n');
            for n = list
                start = clock;
                classifier = bpxnc(training, n, iteration);
                finish = clock;
                error = testc(test, classifier);
                fprintf('%d, %1.3f, %4.3f\n', n, error, etime(finish, start));
            end
            fprintf('\n');

        % Cross-validation
        elseif strcmp(evaluation, 'cross-validation')

            fprintf('\nk, error, standard deviation\n');
            for n = list
                [error, std]= prcrossval(training, bpxnc([], n, iteration), 5, 10);
                fprintf('%d, %1.3f, %4.3f\n', n, error, std);
            end
            fprintf('\n');

        else
            fprintf('Please use one of these evaluation\n\t%s\n', methods);

        end


    % Support Vector Machine %
    elseif strcmp(classifier, 'svc')

        % Hold-out
        if strcmp(evaluation, 'hold-out')

            fprintf('\nregularization parameter, error, training time\n');
            for c = list
                start = clock;
                classifier = svc(training, kernel, c);
                finish = clock;
                error = testc(test, classifier);
                fprintf('%d, %1.3f, %4.3f\n', c, error, etime(finish, start));
            end
            fprintf('\n');

        % Cross-validation
        elseif strcmp(evaluation, 'cross-validation')

            fprintf('\nk, error, standard deviation\n');
            for c = list
                [error, std]= prcrossval(training, svc([], kernel, c), 5, 10);
                fprintf('%d, %1.3f, %4.3f\n', c, error, std);
            end
            fprintf('\n');

        else
            fprintf('Please use one of these evaluation\n\t%s\n', methods);

        end

    else
        fprintf('Please use one of these classifiers\n\t%s\n', classifiers);
    
    end

end