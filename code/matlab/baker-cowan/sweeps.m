clearvars;

Nsweep = 50;
Nruns = 1;
N = 64;
T = 1000;

ampRange = linspace(0, 2, Nsweep);
periodRange = linspace(10, 500, Nsweep);

sweepvals = zeros(Nsweep,Nsweep);

for i = 1:Nsweep
    fprintf("%i:\n",i);
    for j = 1:Nsweep
        fprintf(" %i\r",j);
        params = Parameters();
        beta = 0.8;
        A = ampRange(i);
        P = periodRange(j);
        set(params, 'H', stimulus(A, P))
        set(params, 'Beta', beta);
    
        runavg = zeros(Nruns,1);
        for k = 1:Nruns
            [~, u] = runsim(N, T, params);
            % u = firingrate(u,2,1);
            runavg(k) = pdiff(u);
        end
        sweepvals(i,j) = mean(runavg);
    end
    fprintf('\n');
end

clf;
surf(periodRange, ampRange, sweepvals);
colorbar;
xlabel("Period", "FontSize", 25);
ylabel("Amplitude", "FontSize", 25);
axis tight;