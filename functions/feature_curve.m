%FEATURE_CURVE Function for generating feature curve
% 
%  FEATURE_CURVE(A, S, N)
%  
%
% INPUT
%   A    Training data set.
%   S    Independent test data set.
%   N    Vector of training set sizes, used to generate subsets of A
%        (default [2,3,5,7,10,15,20,30,50,70,100]). N is per class
%        unless A has no priors set or has soft labels.
%
% DESCRIPTION
% Generate feature curves with several types of classifiers: Nearest Mean, 
% Linear Bayes Normal, Quadratic Bayes Normal, Fisher's linear, Logistic 
% linear, 1-Nearest Neighbor, 3-Nearest Neighbor, and Parzen.
%
% SEE ALSO (<a href="http://37steps.com/prtools">PRTools Guide</a>)
% CLEVALF, FISHERC, KNNC, LDC, LOGLC, NMC, PARZENC, PLOTE, QDC

function feature_curve(training, test, size)

    % Generate feature curve with Nearest Mean classifier
    nmc_curve = clevalf(training, nmc, size, [], 1, test);
    
    % Generate feature curve with Linear Bayes Normal classifier
    ldc_curve = clevalf(training, ldc, size, [], 1, test);
    
    % Generate feature curve with Quadratic Bayes Normal classifier
    qdc_curve = clevalf(training, qdc, size, [], 1, test);
    
    % Generate feature curve with Fisher's linear classifier
    fisherc_curve = clevalf(training, fisherc, size, [], 1, test);
    
    % Generate feature curve with Logistic linear classifier
    loglc_curve = clevalf(training, loglc, size, [], 1, test);
    
    % Generate feature curve with 1-Nearest Neighbor classifier
    k1nnc_curve = clevalf(training, knnc([],1), size, [], 1, test);
        
    % Generate feature curve with Parzen classifier
    parzenc_curve = clevalf(training, parzenc, size, [], 1, test);
    
    % Generate list of feature curves
    list = [
        nmc_curve
        ldc_curve
        qdc_curve
        fisherc_curve
        loglc_curve
        k1nnc_curve
        parzenc_curve
    ];
    
    % Show feature curves in one figure
    plote(list, [], [], [], 'noapperror'); 

end