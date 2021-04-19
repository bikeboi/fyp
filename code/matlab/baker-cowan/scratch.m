clearvars;

clf;
tlo = tiledlayout(2,2,'TileSpacing','compact', 'Padding', 'compact');

% Figure options
fs = 15;
ts = 30;

load('data/period_v_amp_P=10-500_A=0-2_T=1000_beta=0.mat');

t(1) = nexttile(tlo);
surface(t(1), periodRange, ampRange, sweepvals, 'Edgecolor', 'none');
axis tight;
caxis([0 7000]);
set(gca, 'FontSize', fs);
xticklabels([]);
title(t(1), '$\beta = 0.0$', 'FontSize', ts);

load('data/period_v_amp_P=10-500_A=0-2_T=1000_beta=0_2.mat');

t(2) = nexttile(tlo);
surface(t(2), periodRange, ampRange, sweepvals, 'Edgecolor', 'none');
axis tight;
caxis([0 7000]);
set(gca, 'FontSize', fs);
xticklabels([]);
yticklabels([]);
title(t(2), '$\beta = 0.2$', 'FontSize', ts);

load('data/period_v_amp_P=10-500_A=0-2_T=1000_beta=0_4.mat');

t(3) = nexttile(tlo);
surface(t(3), periodRange, ampRange, sweepvals, 'Edgecolor', 'none');
axis tight;
caxis([0 7000]);
set(gca, 'FontSize', fs);
title(t(3), '$\beta = 0.4$', 'FontSize', ts);

load('data/period_v_amp_P=10-500_A=0-2_T=1000_beta=0_8.mat');

t(4) = nexttile(tlo);
surface(t(4), periodRange, ampRange, sweepvals, 'Edgecolor', 'none');
axis tight;
caxis([0 7000]);
set(gca, 'FontSize', fs);
yticklabels([]);
title(t(4), '$\beta = 0.8$', 'FontSize', ts);

cbh = colorbar(t(end));
cbh.Layout.Tile = 'north';