function dtd_3d_nodes_out = dtd_3d_mutate(dtd_3d_nodes,opt)

[n,par,perp,theta,phi,r2] = dtd_3d_nodes2par(dtd_3d_nodes);

par = par.*(1+opt.dtd_3d.dfuzz*randn(n,1));
perp = perp.*(1+opt.dtd_3d.dfuzz*randn(n,1));
theta = theta + opt.dtd_3d.ofuzz*randn(n,1);
phi = phi + opt.dtd_3d.ofuzz*randn(n,1);
r2 = r2.*(1+opt.dtd_3d.r2fuzz*randn(n,1));

par(par>opt.dtd_3d.dmax) = opt.dtd_3d.dmax;
perp(perp>opt.dtd_3d.dmax) = opt.dtd_3d.dmax;
r2(r2>opt.dtd_3d.r2max) = opt.dtd_3d.r2max;
par(par<opt.dtd_3d.dmin) = opt.dtd_3d.dmin;
perp(perp<opt.dtd_3d.dmin) = opt.dtd_3d.dmin;
r2(r2<opt.dtd_3d.r2min) = opt.dtd_3d.r2min;

dtd_3d_nodes_out = [par'; perp'; theta'; phi'; r2'];
dtd_3d_nodes_out = [n; dtd_3d_nodes_out(:)];
