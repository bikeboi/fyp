classdef Parameters < matlab.mixin.SetGet
    %Parameter Simulation parameters

    properties
        % Proportinality constants
        Alpha {mustBeNumeric}  % Rate of activity decay
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
        Amplitude {mustBeNumeric} % Stimulus amplitude
        Period {mustBeNumeric}    % Stimulus period
    end
    
    methods
        function obj = Parameters()
           obj.Alpha = 1;
           obj.Beta = 0;
           obj.Gamma = 2;
           obj.Theta = 1;
           obj.Sigma = 2;
           obj.L = [1 0; 0 1];
           obj.D0 = 20;
           obj.P0 = 0.95;
           obj.Xi = 14;
           obj.Amplitude = 0;
           obj.Period = 80;
        end
    end
end

