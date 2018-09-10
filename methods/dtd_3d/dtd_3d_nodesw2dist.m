function dtd_3d = dtd_3d_nodesw2dist(dtd_3d_nodes,w)

[n,par,perp,theta,phi,r2] = dtd_3d_nodes2par(dtd_3d_nodes);

dtd_3d = [par'; perp'; theta'; phi'; r2'; w'];
dtd_3d = [n; dtd_3d(:)];
