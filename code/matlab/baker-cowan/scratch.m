%{
clearvars;

Nsamples = 5;
N = 128;
T = 1000;
params = Parameters();
A = 0;
P = 100;
Beta = 0.8;
set(params, 'H', stimulus(A,P));
set(params, 'Beta', Beta);

% Generate samples
fprintf("A=%.1f, P=%i, Beta=%.1f\n", A, P, Beta);
samples = generatesamples(Nsamples, N, T, params);

% Closest to all
sample_mean = mean(samples, 1);
closest_sample = zeros(N,N);
closest = ones(N,N)*inf;
for i = 1:size(samples,1)
   sample = samples(i,:,:);
   D = mean(sample - sample_mean, 'all');
   if D < closest
       closest_sample = sample;
       closest = D;
   end
end
%}
sample = samples(5,:,:);

% Viz
% Plot closest sample
clf;
surface(squeeze(sample), 'Edgecolor', 'none');
caxis([-3, 3]);
%title(sprintf("A=%.1f, P=%i, $\\beta=%.1f$", A, P, Beta), 'FontSize', 40);
xticklabels([]);
yticklabels([]);
axis tight;