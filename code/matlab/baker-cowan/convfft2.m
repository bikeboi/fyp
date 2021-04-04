function y = convfft2(f, g)
%CONVFFT2 Convolves f with g using FFT

ns = size(g)/2;
G = circshift(g, ns);
y = real(ifft2(fft2(f) .* fft2(G)));

end

