function [ts, y] = eulersolve(f, y0, T, dt)
% EULER Method for rough approximation of ODEs
% Inputs
%   f     : Time evolution function f(t,y)
%   y0    : Initial value
%   tspan : Time interval to evaluate over
%   dt    : Time step
% Output
%   t     : Time points evaluated at
%   y     : Solution

ts = (0:dt:T-dt);
n = length(ts);

y = zeros(size(y0));
y = repmat(y, [n,1]);
y(1,:) = y0;

for i = 1:length(ts)-1
    yi = squeeze(y(i,:));
    t = ts(i);
    dy = f(t, yi);
    y(i+1,:) = yi + dy*dt;
end

end