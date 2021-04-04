function dy = dynamics(~, y, wloc, whoz, alpha, beta, gamma, theta)
%DYNAMICS Baker-Cowan model integro-differential equation
%   Evaluates the change in state at a given t,y,...

Y = reshape(y, size(wloc));
FY = firingrate(Y, gamma, theta);
Sloc = convfft2(wloc, FY);
Slat = convfft2(whoz, FY);
dy = -alpha*Y + Sloc + beta*Slat;
dy = reshape(dy, size(y));

end

