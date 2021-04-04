function [X, Y, Wlat] = wlat(N, L, d0, P0, xi)
%WLAT Generate lateral connectivity kernel
% Inputs
%   N : Size of spatial domain
%   L : Matrix whose rows are lattice-generating vectors
%   d0 : Lattice spacing
%   xi : Spatial decay rate
% Outputs
%   X : X-coordinates
%   Y : Y-coordinates
%   Wlat : Lateral connectivity kernel


[X, Y] = meshgrid(linspace(-N/2, N/2, N));

% Generate featuremap
x = reshape(X, [], 1);
y = reshape(Y, [], 1);
R = [x, y];
P = featuremap(R, L, d0);
P = reshape(P, [N,N]);

% Generate exponential decay
Rnorm = reshape(vecnorm(R,2,2), [N,N]);
J0 = exp(-Rnorm/xi);

% Multiply and return
Wlat = heavisidestep(P - P0) .* heavisidestep(Rnorm - d0/2) .* J0;

end

