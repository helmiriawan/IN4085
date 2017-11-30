%FEATURE_CURVE Function for generating feature curve
% 
%  I = FEATURE_CURVE(A, S, N)
%  
%
% INPUT
%   A    Training data set.
%   S    Independent test data set.
%   N    Vector of training set sizes, used to generate subsets of A
%        (default [2,3,5,7,10,15,20,30,50,70,100]). TRAINSIZE is per
%        class unless A has no priors set or has soft labels.
%
% OUTPUT
%   G    Array of graphics handles.
%
% DESCRIPTION
% Generate feature curves with different classifiers.
%
% SEE ALSO (<a href="http://37steps.com/prtools">PRTools Guide</a>)
% CLEVALF, LDC, NMC, PLOTE, QDC

function graphics = feature_curve(training, test, size)

    % Generate feature curve with Nearest Mean Classifier
    nmc_curve = clevalf(training, nmc, size, [], 1, test);
    
    % Generate feature curve with Linear Bayes Normal Classifier
    ldc_curve = clevalf(training, ldc, size, [], 1, test);
    
    % Generate feature curve with Quadratic Bayes Normal Classifier
    qdc_curve = clevalf(training, qdc, size, [], 1, test);
    
    % Show feature curves
    plote({nmc_curve, ldc_curve, qdc_curve}, [], [], [], 'noapperror'); 

end