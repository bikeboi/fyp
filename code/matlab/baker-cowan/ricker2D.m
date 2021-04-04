function [X, Y, Z] = ricker2D(N, sigma)
%RICKER2D Generate  in 2-dimensions for N points over span
%   Estimates ricker wavelet by difference-of-gaussians
% Inputs
%   N    : Number of points to generate
%   span : 2-element vector specifying domain to evaluate over
%   v    : Base variance of gaussians
%   k    : Variance coefficient of second gaussian
% Output
%   X    : x-coordinates
%   Y    : y-coordinates
%   Z    : Ricker (Mexican Hat) wavelet in two dimensions

xs = linspace(-N/2, N/2, N);
[X, Y] = meshgrid(xs);
R = zeros(2,N,N);
R(1,:,:) = X;
R(2,:,:) = Y;
Rnorm = vecnorm(R,2,1);
Z = squeeze(ricker(Rnorm, sigma));

end