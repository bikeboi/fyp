clearvars;

N = 128;
T = 250;
viewlim = 5;

params = Parameters();

% Modify any parameters
A = 1.5;
P = 150;
Beta = 0.8;
L = [1, 0; -1/2, 1/(2*sqrt(3))];
set(params, 'H', stimulus(A,P));
set(params, 'Beta', Beta);
set(params, 'L', L);

% Run simulation
[ts, y] = runsim(N, T, params);
[X, Y, Wloc] = ricker2D(N, params.Sigma);

% Get first and final states
y0 = squeeze(y(1,:,:));
yn = squeeze(y(end,:,:));

% Pattern difference across simulation
pattern = pdiff(y);

% Visualize
clf;
viz = surf(X, Y, yn, 'Edgecolor', 'none');
colorbar;
set(gca, 'nextplot', 'replaceChildren');
axis tight;

zlim([-viewlim, viewlim]);
caxis([-viewlim, viewlim]);

%set(gca, 'Visible', 'off');
%writer = VideoWriter('figures/anim');
%writer.Quality = 100;

for i = 1:length(ts)
    t = ts(i);
    yt = squeeze(y(i,:,:));
    viz.ZData = yt;
    viz.CData = yt;
    title(sprintf("t = %.2f / %i [ms]", t, T));
    drawnow;
    pause(0.001);
    %writeVideo(writer, getframe);
end

%close(writer);
