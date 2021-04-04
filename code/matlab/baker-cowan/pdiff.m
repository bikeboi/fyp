function y = pdiff(x)
%PATTERNDIFF Proxy measure of degree of patterning across a field across
% time
% Inputs
%   x : TxN dimensional field
% Outputs
%   y : Degree of patterning

x0 = x(:,1,1);
diff = abs(x - x0);
y = mean(sum(diff, [2,3]), 1);
end

