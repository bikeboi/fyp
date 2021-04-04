function y = ricker(x, s)
%Ricker Ricker wavelet function in two dimensions
% Inputs
%   r : Input
%   s : spread of the function
% Output
%   y : Ricker wavelet function

K = 2;
g1 = exp(-(x.^2)/(2*s^2));
g2 = 1/K .* exp(-(x.^2)/(K*2*s^2));

y = g1 - g2;

end

