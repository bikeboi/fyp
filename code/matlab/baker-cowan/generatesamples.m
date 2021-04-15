function samples = generatesamples(Nsamples, N, T, params)
%GENERATESAMPLES Get a set of samples by taking field values at t=T
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
    fprintf("-- %i/%i | ",i,Nsamples);
    [~, u, ~] = runsim(N,T,params);
    
    % Compute maximum rho_t over result
    rho_max = 0;
    rho_max_ix = 1;
    for j = 1:size(u,1)
       rho_t = pdiff(squeeze(u(j,:,:)));
       if rho_t > rho_max
           rho_max_ix = j;
           rho_max = rho_t;
       end
    end
    fprintf("Highest Rho: %.2f\n", rho_max);
    
    % Select most patterned sample
    samples(i,:,:) = squeeze(u(rho_max_ix,:,:));
end

end

