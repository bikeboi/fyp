clearvars;

Nsamples = 5;
N = 128;
T = 1000;
params = Parameters();
A = 1.5;
P = 200;
Beta = 0.8;
set(params, 'H', stimulus(A,P));
set(params, 'Beta', Beta);

% Generate samples
fprintf("A=%.1f, P=%i, Beta=%.1f\n", A, P, Beta);
samples = getSamples(Nsamples, N, T, params);

% Most common sample
sample_mean = mean(samples, 1);
ds = mean(abs(samples - sample_mean), [2,3]);
[~,k] = min(ds,[],1,'linear');

% Inter-sample distance
variance = mean(ds);

%Viz
clf;
surface(squeeze(samples(k,:,:)), 'Edgecolor', 'none');
% caxis([-4, 4]);
axis tight;
set(gca, 'FontSize', 30);
xticks([]);
yticks([]);
title(sprintf('$\\beta=%.1f$', Beta),...
    sprintf('$(\\bar{D}=%.2f)$',variance));

%{
for i = 1:Nsamples
   subplot(2, Nsamples/2, i);
   surface(squeeze(samples(i,:,:)), 'Edgecolor', 'none');
   axis tight;
   set(gca, 'visible', 'off');
end
%}