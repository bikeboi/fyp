clearvars;

alpha = 0.225;
beta = 0.1632;

[X, Y] = meshgrid(-10:0.1:10);
[R, T] = retmap(X, Y, alpha, beta);
Z = sin(X);

R = reshape(R,1,[]);
T = reshape(T,1,[]);
Zf = reshape(Z,1,[]);

clf;
polarscatter(T,R,1000,Zf,'.');
set(gca, 'visible','off');

function [r,theta] = retmap(x, y, alpha, beta)
    % Static parameters
    w0 = 0.087;
    e = 0.051;
    
    % Compute polar coordinates
    r = (w0/e) .* (exp(e/alpha .* x));
    theta = e / beta .* y;
end