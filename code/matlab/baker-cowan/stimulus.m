function H = stimulus(A, P)
    H = @(t) A .* firingrate(sin((2*pi*t)./P), -50, 0);
end