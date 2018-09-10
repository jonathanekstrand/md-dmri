function dtd_3d_nodes_out = dtd_3d_nodes_select(dtd_3d_nodes,ind)

[n,par,perp,theta,phi,r2] = dtd_3d_nodes2par(dtd_3d_nodes);

n = numel(ind);
par = par(ind);
perp = perp(ind);
theta = theta(ind);
phi = phi(ind);
r2 = r2(ind);

dtd_3d_nodes_out = [par'; perp'; theta'; phi'; r2'];
dtd_3d_nodes_out = [n; dtd_3d_nodes_out(:)];
