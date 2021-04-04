clearvars;

% Patterning function goodness
T = 10;
L = 10;
P = .5;
N = 1000;

[X, Y] = meshgrid(linspace(0, L, N), linspace(0, T, N));

% Base pattern
pattern = firingrate(sin((2*pi*X)/P) + cos((2*pi*Y)/P),1,0);

% Transient pattern
x = linspace(0, L, N);
sigma = 0.5;
weights = exp(-((x - L/2).^2) / (2*sigma^2)).';
transient = pattern .* weights;


Pbase = pdiff(pattern);
Ptrans = pdiff(transient);

clf;
subplot(1,2,1);
surface(X, Y, pattern, 'Edgecolor', 'none');
xlabel("$\mathcal{X}$",'Fontsize', 25);
ylabel("$\tau$",'Fontsize', 25);
xticks([]);
yticks([]);
title(sprintf("$P_\\mathrm{diff} = %2f$",Pbase),'Fontsize',30);
subplot(1,2,2);
surface(X, Y, transient, 'Edgecolor', 'none');
xlabel("$\mathcal{X}$",'Fontsize', 25);
ylabel("$\tau$",'Fontsize', 25);
xticks([]);
yticks([]);
title(sprintf("$P_\\mathrm{diff} = %2f$",Ptrans),'Fontsize',30);

function y = pdiff(U)
    U0 = U(:,1,1);
    diff = abs(U - U0);
    y = mean(sum(diff,[2,3]),1);
end