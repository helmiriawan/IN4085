%HOLDOUT_ERROR Function for generating hold out error and training time
% 
%  HOLDOUT(A, S)
%  
%
% INPUT
%   A    Training data set.
%   S    Independent test data set.
%
% DESCRIPTION
% Estimate hold-out error of several types of classifiers with training 
% time taken: Nearest Mean, Linear Bayes Normal, Quadratic Bayes Normal, 
% Fisher's linear, Logistic linear, 1-Nearest Neighbor, and Parzen
% classifier.
%
% SEE ALSO (<a href="http://37steps.com/prtools">PRTools Guide</a>)
% FISHERC, KNNC, LDC, LOGLC, NMC, PARZENC, PLOTE, QDC, TESTC

function holdout(training, test)

    fprintf('\nHold-out error\n-------------------\n');


    % Parametric %

    % Nearest Mean classifier
    start = clock;
    classifier = nmc(training);
    finish = clock;
    error = testc(test, classifier);
    fprintf('nmc\t\t: %2.3f (%2.2f s)\n', error, etime(finish, start));

    % Linear Bayes Normal Classifier
    start = clock;
    classifier = ldc(training);
    finish = clock;
    error = testc(test, classifier);
    fprintf('ldc\t\t: %2.3f (%2.2f s)\n', error, etime(finish, start));

    % Quadratic Bayes Normal Classifier
    start = clock;
    classifier = qdc(training);
    finish = clock;
    error = testc(test, classifier);
    fprintf('qdc\t\t: %2.3f (%2.2f s)\n', error, etime(finish, start));

    % Fisher's linear classifier
    start = clock;
    classifier = fisherc(training);
    finish = clock;
    error = testc(test, classifier);
    fprintf('fisherc\t: %2.3f (%2.2f s)\n', error, etime(finish, start));

    % Logistic linear classifier
    start = clock;
    classifier = loglc(training);
    finish = clock;
    error = testc(test, classifier);
    fprintf('loglc\t: %2.3f (%2.2f s)\n', error, etime(finish, start));


    % Non-parametric %

    % 1-Nearest Neighbor classifier
    start = clock;
    classifier = knnc(training, 1);
    finish = clock;
    error = testc(test, classifier);
    fprintf('1-nnc\t: %2.3f (%2.2f s)\n', error, etime(finish, start));

    % Parzen classifier
    start = clock;
    classifier = parzenc(training);
    finish = clock;
    error = testc(test, classifier);
    fprintf('parzenc\t: %2.3f (%2.2f s)\n', error, etime(finish, start));
    
    fprintf('\n');
    
end