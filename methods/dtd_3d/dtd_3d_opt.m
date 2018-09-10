function opt = dtd_3d_opt(opt)
% function opt = dtd_3d_opt(opt)
%
% Makes sure that all needed fields in the options structure are present

opt.dtd_3d.present = 1;

opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'tmp', 1); 
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'do_plot', 0);
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'ind_start', 1);
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'dmin', 1e-11);
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'dmax', 4.5e-9);
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'r2min', 1);
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'r2max', 20);
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'n_in', 2e2); % n_in: Number of nodes in NNLS inversion. [100 - 1000]
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'n_out', 10);
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'n_kill', 1);
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'n_proliferation', 20);
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'n_extinction', 20);
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'ofuzz', .1*2*pi);
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'dfuzz', .1);
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'r2fuzz', .1);


opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'fig_maps', ...
    {'s0','s_fw','s_st','s_lt','s_pt','s_plt', 's_splt','s_residue',...
    'miso','viso_n','maniso_n','vaniso_n','msaniso_n','vsaniso_n','mr2','vr2','ufa','fa','op'});
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'fig_prefix', 'dtd_3d');
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'fig_cmaps',{'fa','cl','cp','ufa','ucl','ucp'});
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'fig_ccol',{'t1x6','lambda33vec','lambda11vec','s1x6prim','s1x6prim','s1x6prim'});
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'fig_ccolnorm',{'lambda33','mask','mask','slambda33prim','slambda33prim','slambda33prim'});
opt.dtd_3d = msf_ensure_field(opt.dtd_3d, 'do_dtd_3dpdf', 1);

