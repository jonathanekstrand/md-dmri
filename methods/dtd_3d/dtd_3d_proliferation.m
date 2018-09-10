function dtd_3d = dtd_3d_proliferation(stemp, bt_mx6, te, opt)

dmin = opt.dtd_3d.dmin;
dmax = opt.dtd_3d.dmax;
r2min = opt.dtd_3d.r2min;
r2max = opt.dtd_3d.r2max;
n_nodes = opt.dtd_3d.n_in;
n_proliferation = opt.dtd_3d.n_proliferation;

dtd_3d_nodes1 = [];
for niter = 1:n_proliferation    
    dtd_3d_nodes2 = dtd_3d_rand(n_nodes,dmin,dmax,r2min,r2max);
    dtd_3d_nodes = dtd_3d_nodes_merge(dtd_3d_nodes1,dtd_3d_nodes2);

    dtd_3d = dtd_3d_data2dtd_3d(stemp, bt_mx6, te, dtd_3d_nodes);
    dtd_3d_nodes1 = dtd_3d_dist2nodes(dtd_3d);
end

