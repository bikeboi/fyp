function [alphaRange, result] = alphasweep(start, stop, N, space, time, params)
%ALPHASWEEP Parameter sweep of alpha values given other params

alphaRange = linspace(start, stop, N);
result = zeros(1,N);

for i = 1:N
   fprintf('%i/%i\r',i,N);
   alpha = alphaRange(i);
   set(params, 'Alpha', alpha);
   [~, u] = runsim(space, time, params);
   result(i) = pdiff(u);
end

end

