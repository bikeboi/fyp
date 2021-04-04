function y = convfft(f, g)
%CONVFFT Convolves f with g using FFT

ns = floor(size(g) / 2);
G = circshift(g, ns);
y = real(ifft(fft(f) .* fft(G)));

end

