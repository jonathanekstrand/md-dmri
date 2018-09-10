function opt = dtd_bdelta_opt(opt)
% function opt = dtd_bdelta_opt(opt)
%
% Makes sure that all needed fields in the options structure are present

opt.dtd_bdelta.present = 1;

opt.dtd_bdelta = msf_ensure_field(opt.dtd_bdelta, 'slider', 1);

opt.dtd_bdelta = msf_ensure_field(opt.dtd_bdelta, 'tmp', 1); 
opt.dtd_bdelta = msf_ensure_field(opt.dtd_bdelta, 'lsq_opts', ...
    optimoptions('lsqcurvefit', 'display', 'off','MaxFunEvals',1e3));
opt.dtd_bdelta = msf_ensure_field(opt.dtd_bdelta, 'do_plot', 0);
opt.dtd_bdelta = msf_ensure_field(opt.dtd_bdelta, 'do_pa', 1);
opt.dtd_bdelta = msf_ensure_field(opt.dtd_bdelta, 'fig_maps', {'s0','iso','saniso_n','ufa'});
opt.dtd_bdelta = msf_ensure_field(opt.dtd_bdelta, 'fig_prefix', 'dtd_bdelta');
