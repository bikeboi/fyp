classdef Parameters < matlab.mixin.SetGet
    %Parameter Simulation parameters

    properties
        % Proportinality constants
        Mu {mustBeNumeric}     % Strength of total synaptic drive
        Beta {mustBeNumeric}   % Strength of lateral connections
        
        % Firing rate
        Gamma {mustBeNumeric}  % Gain (steepness)
        Theta {mustBeNumeric}  % Threshold
        
        % Connectivity
        % -- Local
        Sigma {mustBeNumeric}  % Width of local kernel
        % -- Lateral
        L  {mustBeNumeric}     % Lattice generators
        D0 {mustBeNumeric}     % Lattice spacing
        P0 {mustBeNumeric}     % Size of lateral projection sites
        Xi {mustBeNumeric}     % Rate of connection strength decay
        
        % Stimulus
        H                          % Stimulus function
    end
    
    methods
        function obj = Parameters()
           obj.Mu = 0.5;
           obj.Beta = 0;
           obj.Gamma = 2;
           obj.Theta = 1;
           obj.Sigma = 2;
           obj.L = [1 0; 0 1];
           obj.D0 = 8;
           obj.P0 = 0.95;
           obj.Xi = 7;
           obj.H = stimulus(1, 80);
        end
    end
end

