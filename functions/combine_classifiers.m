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

    [error_1, std_1]= prcrossval(data_set, adaboostc([],classifier,1,[],0), fold, repetition);
    fprintf('adaboost 1 \t\t: %2.3f (%2.3f)\n', error_1, std_1);

    [error_10, std_10]= prcrossval(data_set, adaboostc([],classifier,10,[],0), fold, repetition);
    fprintf('adaboost 10 \t\t: %2.3f (%2.3f)\n', error_10, std_10);

    [error_100, std_100]= prcrossval(data_set, adaboostc([],classifier,100,[],0), fold, repetition);
    fprintf('adaboost 100 \t\t: %2.3f (%2.3f)\n', error_100, std_100);

    [error_1000, std_1000]= prcrossval(data_set, adaboostc([],classifier,1000,[],0), fold, repetition);
    fprintf('adaboost 1000 \t\t: %2.3f (%2.3f)\n', error_1000, std_1000);
    
    
    fprintf('\n');

end