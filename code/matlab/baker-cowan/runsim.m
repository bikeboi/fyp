function [t, u, H] = runsim(N, T, params)

% Stimulus
H = params.H;

% Connectivity
% -- Local
[~, ~, Wloc] = ricker2D(N, params.Sigma);

% -- Lateral
[~, ~, Wlat] = wlat(N, params.L, params.D0, params.P0, params.Xi);

% Solve
f = @(t,y) dynamics(...
    t,y,...
    Wloc, Wlat,...
    params.Mu, params.Beta,...
    params.Gamma, params.Theta)...
    + H(t);

u0 = unifrnd(0, 0.01, N, N);
[t, u] = ode45(f, [0 T], u0);
u = reshape(u, [], N, N);

end