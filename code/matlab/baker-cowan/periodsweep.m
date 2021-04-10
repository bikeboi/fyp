function [span, results] = periodsweep(start, stop, N, space, time, amp, params)
%PERIODSWEEP Parameter sweep of period values given other params

span = linspace(start, stop, N);
results = zeros(1,N);

for i = 1:N
   fprintf('%i/%i-',i,N);
   period = span(i);
   set(params, 'H', stimulus(1,period));
   [~, u] = runsim(space, time, params);
   results(i) = pdiff(u);
end

end

