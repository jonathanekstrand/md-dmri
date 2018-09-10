function dtd_3d_nodes = dtd_3d_dist2nodes(dtd_3d)

[n,par,perp,theta,phi,r2,w] = dtd_3d_dist2par(dtd_3d);

dtd_3d_nodes = [par'; perp'; theta'; phi'; r2'];
dtd_3d_nodes = [n; dtd_3d_nodes(:)];
