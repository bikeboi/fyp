function P = featuremap(r, L, d0)
% FEATUREMAP Returns value at r in feature domain
% Inputs
%   r  : Point to evaluate at
%   L  : Lattice generator matrix
%   d0 : Lattice spacing
% Outputs
%   P  : Feature-domain value at r

P = mean(cos((2*pi*r*L)/d0),2);

end