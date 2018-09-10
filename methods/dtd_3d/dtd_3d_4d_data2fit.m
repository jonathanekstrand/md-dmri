function res = dtd_3d_4d_data2fit(s, mfs_fn, opt)
% function mfs_fn = dtd_3d_4d_data2fit(s, o, opt)

if (nargin < 3), opt = []; end

res = -1;

% ind = opt.dtd_3d.ind_start:s.xps.n;
ind = find(s.xps.b ~= 0);

%Verify the xps
%dti_euler_mic_check_xps(s.xps);

% Loop over the volume and fit the model
xps = s.xps; % this appears to improve parallel performance
f = @(signal) dtd_3d_1d_data2fit(signal, xps, opt, ind);
dummy = mio_fit_model(f, s, mfs_fn, opt);

res = 1;