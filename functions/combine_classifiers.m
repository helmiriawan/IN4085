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

function combine_classifiers(data_set, fold, repetition, classifier)

    fprintf('\nError\n-------------------\n');


    % Adaboost %

%     [error_1, std_1]= prcrossval(data_set, adaboostc([],classifier,1,[],0), fold, repetition);
%     fprintf('adaboost 1 \t\t: %2.3f (%2.3f)\n', error_1, std_1);
% 
%     [error_10, std_10]= prcrossval(data_set, adaboostc([],classifier,10,[],0), fold, repetition);
%     fprintf('adaboost 10 \t\t: %2.3f (%2.3f)\n', error_10, std_10);
% 
%     [error_100, std_100]= prcrossval(data_set, adaboostc([],classifier,100,[],0), fold, repetition);
%     fprintf('adaboost 100 \t\t: %2.3f (%2.3f)\n', error_100, std_100);
% 
%     [error_1000, std_1000]= prcrossval(data_set, adaboostc([],classifier,1000,[],0), fold, repetition);
%     fprintf('adaboost 1000 \t\t: %2.3f (%2.3f)\n', error_1000, std_1000);
    
    
    fprintf('\nCombining Classifer with Classifier\n');
    % Classifier to be combined
    p1 = qdc*classc;
    p2 = knnc([],1)*classc;
    p3 = parzenc*classc;
    p = [p1 p2 p3];
    
    fprintf('\nError\n-------------------\n');
    % Parametric %

    % Nearest Mean classifier
    [error, std]= prcrossval(data_set, p*nmc, fold, repetition);
    fprintf('nmc\t\t: %2.3f (%2.3f)\n', error, std);

    % Linear Bayes Normal Classifier
    [error, std]= prcrossval(data_set, p*ldc, fold, repetition);
    fprintf('ldc\t\t: %2.3f (%2.3f)\n', error, std);

    % Quadratic Bayes Normal Classifier
    [error, std]= prcrossval(data_set, p*qdc, fold, repetition);
    fprintf('qdc\t\t: %2.3f (%2.3f)\n', error, std);

    % Fisher's linear classifier
    [error, std]= prcrossval(data_set, p*fisherc, fold, repetition);
    fprintf('fisherc\t: %2.3f (%2.3f)\n', error, std);

    % Logistic linear classifier
    [error, std]= prcrossval(data_set, p*loglc, fold, repetition);
    fprintf('loglc\t: %2.3f (%2.3f)\n', error, std);


    % Non-parametric %

    % 1-Nearest Neighbor classifier
    [error, std]= prcrossval(data_set, p*knnc([], 1), fold, repetition);
    fprintf('1-nnc\t: %2.3f (%2.3f)\n', error, std);

    % Parzen classifier
    [error, std]= prcrossval(data_set, p*parzenc, fold, repetition);
    fprintf('parzenc\t: %2.3f (%2.3f)\n', error, std);
    
    
    fprintf('\n');

end