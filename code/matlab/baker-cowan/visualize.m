clearvars;

N = 128;
T = 500;
viewlim = 10;

params = Parameters();

% Modify any parameters
set(params, 'Alpha', 1);
set(params, 'Beta', 0.1);
set(params, 'Amplitude', 2);
set(params, 'Period', 80);

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
viz = surface(X, Y, yn, 'Edgecolor', 'none');
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
