clearvars;

Nsweep = 25;
Nruns = 1;
N = 128;
T = 500;
periodRange = linspace(30, 200, Nsweep);
ampRange = linspace(0, 1.5, Nsweep);
sigmaRange = linspace(2, 20, Nsweep);
alphaRange = linspace(0, 1, Nsweep);
betaRange = linspace(0, 0.1, Nsweep);

sweepvals = zeros(Nsweep,Nsweep);
[local, lateral, coeffs, stimulus] = default_params();

for i = 1:Nsweep
    disp(i);
    for j = 1:Nsweep
        coeffs(1) = alphaRange(i);
        coeffs(2) = betaRange(j);
    
        runavg = zeros(Nruns,1);
        for k = 1:Nruns
            [~, u] = runsim(N, T, local, lateral, coeffs, stimulus);
            % u = firingrate(u,2,1);
            runavg(k) = pdiff(u);
        end
        sweepvals(i,j) = mean(runavg);
    end
end

clf;
surf(betaRange, alphaRange, sweepvals);
colorbar;
xlabel("$\beta$", "FontSize", 25);
ylabel("$\alpha$", "FontSize", 25);
axis tight;