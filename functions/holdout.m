%HOLDOUT_ERROR Function for generating hold out error
% 
%  E = HOLDOUT(A, S)
%  
%
% INPUT
%   A    Training data set.
%   S    Independent test data set.
%
% OUTPUT
%   E    Error / performance estimate
%
% DESCRIPTION
% Estimate hold-out error of several types of classifiers: Nearest Mean, 
% Linear Bayes Normal, Quadratic Bayes Normal, Fisher's linear, Logistic 
% linear, 1-Nearest Neighbor, 3-Nearest Neighbor, and Parzen.
%
% SEE ALSO (<a href="http://37steps.com/prtools">PRTools Guide</a>)
% TESTC, FISHERC, KNNC, LDC, LOGLC, NMC, PARZENC, PLOTE, QDC

function holdout(training, test)

    % Train Nearest Mean Classifier
    start = clock;
    nmc_classifier = nmc(training);
    finish = clock;
    nmc_time = etime(finish, start);

    % Estimate hold-out error using Nearest Mean Classifier
    start = clock;
    ldc_classifier = ldc(training);
    finish = clock;
    ldc_time = etime(finish, start);
    
    % Test the classifiers
    nmc_error = testc(test, nmc_classifier);
    ldc_error = testc(test, ldc_classifier);
    
    % Show the results
    fprintf('\nHold-out error\n-------------------\n');
    fprintf('nmc: %2.2f (%2.1f s)\n', nmc_error, nmc_time);
    fprintf('ldc: %2.2f (%2.1f s)\n', ldc_error, ldc_time);
    fprintf('\n');
    
end