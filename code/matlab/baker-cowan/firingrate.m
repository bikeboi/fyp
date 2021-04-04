function y = firingrate(x, gamma, theta)
%FIRINGRATE Compute firing rate from activity level
% Inputs
%   x     : Activity level
%   gamma : Gain
% Output
%   y     : Firing rate

y = 1 ./ (1 + exp(-gamma*(x-theta)));

end

