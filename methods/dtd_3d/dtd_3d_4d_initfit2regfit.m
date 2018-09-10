function res = dtd_3d_4d_initfit2regfit(s, mfs_fn, opt, nodes4d)
% function mfs_fn = dtd_3d_4d_data2fit(s, o, opt)

if (nargin < 3), opt = []; end

res = -1;

ind = opt.dtd_3d.ind_start:s.xps.n;

%Verify the xps
%dti_euler_mic_check_xps(s.xps);

% Loop over the volume and fit the model
xps = s.xps; % this appears to improve parallel performance
f = @(signal, dtd_3d_nodes) dtd_3d_1d_initfit2regfit(signal, xps, opt, ind, dtd_3d_nodes);
dummy = mio_fit_model_suppdata(f, s, mfs_fn, opt, nodes4d);

res = 1;