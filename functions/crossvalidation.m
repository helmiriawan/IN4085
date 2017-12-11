%CROSSVALIDATION Function to evaluate a few classifiers by using
%cross-validation
% 
%  CROSSVALIDATION(A, N, R)
%  
%
% INPUT
%   A    Training data set.
%   N    Number of folds (default: number of samples: leave-one-out).
%   R    Number of repetitions (default: 1)
%
% DESCRIPTION
% Estimate error and standard deviation of several types of classifiers
% with cross-validation techniques: Nearest Mean, Linear Bayes Normal,
% Quadratic Bayes Normal, Fisher's linear, Logistic linear, 1-Nearest
% Neighbor, and Parzen classifier.
%
% SEE ALSO (<a href="http://37steps.com/prtools">PRTools Guide</a>)
% FISHERC, KNNC, LDC, LOGLC, NMC, PARZENC, PLOTE, PRCROSSVAL, QDC

function crossvalidation(data_set, fold, repetition)

    fprintf('\nError\n-------------------\n');


    % Parametric %

    % Nearest Mean classifier
    [error, std]= prcrossval(data_set, nmc, fold, repetition);
    fprintf('nmc\t\t: %2.3f (%2.3f)\n', error, std);

    % Linear Bayes Normal Classifier
    [error, std]= prcrossval(data_set, ldc, fold, repetition);
    fprintf('ldc\t\t: %2.3f (%2.3f)\n', error, std);

    % Quadratic Bayes Normal Classifier
    [error, std]= prcrossval(data_set, qdc, fold, repetition);
    fprintf('qdc\t\t: %2.3f (%2.3f)\n', error, std);

    % Fisher's linear classifier
    [error, std]= prcrossval(data_set, fisherc, fold, repetition);
    fprintf('fisherc\t: %2.3f (%2.3f)\n', error, std);

    % Logistic linear classifier
    [error, std]= prcrossval(data_set, loglc, fold, repetition);
    fprintf('loglc\t: %2.3f (%2.3f)\n', error, std);


    % Non-parametric %

    % 1-Nearest Neighbor classifier
    [error, std]= prcrossval(data_set, knnc([], 1), fold, repetition);
    fprintf('1-nnc\t: %2.3f (%2.3f)\n', error, std);

    % Parzen classifier
    [error, std]= prcrossval(data_set, parzenc, fold, repetition);
    fprintf('parzenc\t: %2.3f (%2.3f)\n', error, std);

    fprintf('\n');

end