%GRIDSEARCH_BPXNC Function to do grid search for Back-propagation
%Feed-forward Neural Network classifier
% 
%  GRIDSEARCH_BPXNC(A, S, N)
%  
%
% INPUT
%   A    Training data set.
%   S    Independent test data set.
%   N    List of number of nodes to perform (e.g 1:5).
%
% DESCRIPTION
% Estimate hold-out error of different number of nodes in order to find the
% most suitable number of nodes for Back-propagation Feed-forward Neural 
% Network classifier.
%
% SEE ALSO (<a href="http://37steps.com/prtools">PRTools Guide</a>)
% BPNXC, TESTC

function gridsearch_bpxnc(training, test, list, iteration)

    fprintf('\nnodes, error, training time\n');
    for n = list
        start = clock;
        classifier = bpxnc(training, n, iteration);
        finish = clock;
        time = etime(finish, start);
        error = testc(test, classifier);
        fprintf('%d, %1.3f, %4.3f\n', n, error, time);
    end
    fprintf('\n');

end