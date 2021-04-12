function samples = getSamples(Nsamples, N, T, params)
%GETSAMPLES Get a set of samples by taking field values at t=T
% Inputs
%   Nsamples : Number of samples to generate
%   N        : Size of field
%   T        : Duration of simulation
%   params   : Simulation parameters
% Output
%   samples  : Generated samples

samples = zeros(Nsamples, N, N);

fprintf("Generating %i samples...\n", Nsamples);
for i = 1:Nsamples
    fprintf("-- %i/%i\n",i,Nsamples);
    [~,u] = runsim(N,T,params);
    samples(i,:,:) = squeeze(u(end,:,:));
end

end

