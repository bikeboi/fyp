function [t, u] = runsim(N, T, params)

% Stimulus
A = params.Amplitude;
P = params.Period;
H = @(t) A*heavisidestep(sin((2*pi*t)/P));

% Connectivity
% -- Local
[~, ~, Wloc] = ricker2D(N, params.Sigma);

% -- Lateral
[~, ~, Wlat] = wlat(N, params.L, params.D0, params.P0, params.Xi);

% Solve
f = @(t,y) dynamics(...
    t,y,...
    Wloc, Wlat,...
    params.Alpha, params.Beta,...
    params.Gamma, params.Theta)...
    + H(t);

u0 = unifrnd(0, 0.01, N, N);
[t, u] = ode45(f, [0 T], u0);
u = reshape(u, [], N, N);

end