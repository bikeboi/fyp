clearvars;

params = Parameters();

N = 64;
T = 1000;
Amp = 1;
Beta = 1.0;
Nruns = 5;
Nspan = 50;
results = zeros(Nruns, Nspan);

Pstart = 12;
Pend = 250;

set(params, 'Beta', Beta);

for i = 1:Nruns
    [ps, rs] = periodsweep(Pstart, Pend, Nspan, 64, T, Amp, params);
    results(i,:) = rs;
    fprintf("Run:%i\n",i);
end

meanLine = mean(results,1);
errsMax = max(results, [], 1) - meanLine;
errsMin = meanLine - min(results, [], 1);

clf;
errorbar(ps, meanLine, errsMax, errsMin,...
    'Color', '#EDB120', 'MarkerEdgeColor', 'none');
hold on;
for i = 1:Nruns
   scatter(ps, results(i,:), 30, [0 0.4470 0.7410], 'filled');
   hold on;
end

% Save data
name = sprintf('data/period_sweep_%i-%i_T=%i_Amp=%i_Beta=%.1e.mat', Pstart, Pend, T, Amp, Beta);
fprintf("Saving as: %s \n", name);
save(name, 'ps', 'results');