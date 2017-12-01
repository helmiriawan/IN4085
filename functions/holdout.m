%HOLDOUT_ERROR Function for generating hold out error and training time
%taken
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
% Estimate hold-out error of several types of classifiers with training 
% time taken: Nearest Mean, Linear Bayes Normal, Quadratic Bayes Normal, 
% Fisher's linear, Logistic linear, 1-Nearest Neighbor, 3-Nearest Neighbor, 
% and Parzen.
%
% SEE ALSO (<a href="http://37steps.com/prtools">PRTools Guide</a>)
% TESTC, FISHERC, KNNC, LDC, LOGLC, NMC, PARZENC, PLOTE, QDC

function holdout(training, test)

    % Train Nearest Mean classifier
    start = clock;
    nmc_classifier = nmc(training);
    finish = clock;
    nmc_time = etime(finish, start);

    % Train Linear Bayes Normal Classifier
    start = clock;
    ldc_classifier = ldc(training);
    finish = clock;
    ldc_time = etime(finish, start);

    % Train Quadratic Bayes Normal Classifier
    start = clock;
    qdc_classifier = qdc(training);
    finish = clock;
    qdc_time = etime(finish, start);

    % Train Fisher's linear classifier
    start = clock;
    fisherc_classifier = fisherc(training);
    finish = clock;
    fisherc_time = etime(finish, start);

    % Train Logistic linear classifier
    start = clock;
    loglc_classifier = loglc(training);
    finish = clock;
    loglc_time = etime(finish, start);

    % Train 1-Nearest Neighbor classifier
    start = clock;
    k1nnc_classifier = knnc(training, 1);
    finish = clock;
    k1nnc_time = etime(finish, start);

    % Train 3-Nearest Neighbor classifier
    start = clock;
    k3nnc_classifier = knnc(training, 3);
    finish = clock;
    k3nnc_time = etime(finish, start);

    % Train Parzen classifier
    start = clock;
    parzenc_classifier = parzenc(training);
    finish = clock;
    parzenc_time = etime(finish, start);

    % Test the classifiers
    nmc_error = testc(test, nmc_classifier);
    ldc_error = testc(test, ldc_classifier);
    qdc_error = testc(test, qdc_classifier);
    fisherc_error = testc(test, fisherc_classifier);
    loglc_error = testc(test, loglc_classifier);
    k1nnc_error = testc(test, k1nnc_classifier);
    k3nnc_error = testc(test, k3nnc_classifier);
    parzenc_error = testc(test, parzenc_classifier);

    % Show the results
    fprintf('\nHold-out error\n-------------------\n');
    fprintf('nmc\t\t: %2.2f (%2.1f s)\n', nmc_error, nmc_time);
    fprintf('ldc\t\t: %2.2f (%2.1f s)\n', ldc_error, ldc_time);
    fprintf('qdc\t\t: %2.2f (%2.1f s)\n', qdc_error, qdc_time);
    fprintf('fisherc\t: %2.2f (%2.1f s)\n', fisherc_error, fisherc_time);
    fprintf('loglc\t: %2.2f (%2.1f s)\n', loglc_error, loglc_time);
    fprintf('1-nnc\t: %2.2f (%2.1f s)\n', k1nnc_error, k1nnc_time);
    fprintf('3-nnc\t: %2.2f (%2.1f s)\n', k3nnc_error, k3nnc_time);
    fprintf('parzenc\t: %2.2f (%2.1f s)\n', parzenc_error, parzenc_time);
    fprintf('\n');
    
end