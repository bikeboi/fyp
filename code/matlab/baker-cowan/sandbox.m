clearvars;

params = Parameters();

N = 128;
d0 = params.D0*2;
n = sqrt(2);
d = d0/n;
xi = params.Xi;
L = [1, 0; 0, 1];

% Generate field coordinates
[x, y] = meshgrid(linspace(-N/2, N/2, N));
R = [x(:), y(:)];
Latt = R * L;
LattX = Latt(:,1);
LattY = Latt(:,2);
D = reshape(sin(LattX) + cos(LattY), N, N);

% Featuremap
P = reshape(featuremap(R, L, d), N, N);
PD = P .* (1 + D);

clf;
surface(x, y, PD, 'Edgecolor', 'none');
axis tight;
colorbar;