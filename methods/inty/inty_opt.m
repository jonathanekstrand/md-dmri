function opt = inty_opt(opt)
% function opt = inty_opt(opt)
%
% Makes sure that all needed fields in the options structure are present

opt.inty.present = 1;

opt.inty = msf_ensure_field(opt.inty, 'tmp', 1); 
opt.inty = msf_ensure_field(opt.inty, 'do_plot', 0);
opt.inty = msf_ensure_field(opt.inty, 'ind_start', 1);
opt.inty = msf_ensure_field(opt.inty, 'dmin', 1e-11);
opt.inty = msf_ensure_field(opt.inty, 'dmax', 4.5e-9);
opt.inty = msf_ensure_field(opt.inty, 'r2min', 1);
opt.inty = msf_ensure_field(opt.inty, 'r2max', 20);
opt.inty = msf_ensure_field(opt.inty, 'n_in', 2e2); % n_in: Number of nodes in NNLS inversion. [100 - 1000]
opt.inty = msf_ensure_field(opt.inty, 'n_out', 10);
opt.inty = msf_ensure_field(opt.inty, 'n_kill', 1);
opt.inty = msf_ensure_field(opt.inty, 'n_proliferation', 20);
opt.inty = msf_ensure_field(opt.inty, 'n_extinction', 20);
opt.inty = msf_ensure_field(opt.inty, 'ofuzz', .1*2*pi);
opt.inty = msf_ensure_field(opt.inty, 'dfuzz', .1);
opt.inty = msf_ensure_field(opt.inty, 'r2fuzz', .1);


opt.inty = msf_ensure_field(opt.inty, 'fig_maps', ...
    {'s0','s_fw','s_st','s_lt','s_pt','s_plt', 's_splt','s_residue',...
    'miso','viso_n','maniso_n','vaniso_n','msaniso_n','vsaniso_n','mr2','vr2','ufa','fa','op'});
opt.inty = msf_ensure_field(opt.inty, 'fig_prefix', 'inty');
opt.inty = msf_ensure_field(opt.inty, 'fig_cmaps',{'fa','cl','cp','ufa','ucl','ucp'});
opt.inty = msf_ensure_field(opt.inty, 'fig_ccol',{'t1x6','lambda33vec','lambda11vec','s1x6prim','s1x6prim','s1x6prim'});
opt.inty = msf_ensure_field(opt.inty, 'fig_ccolnorm',{'lambda33','mask','mask','slambda33prim','slambda33prim','slambda33prim'});
opt.inty = msf_ensure_field(opt.inty, 'do_intypdf', 0);

