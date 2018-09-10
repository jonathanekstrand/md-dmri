function dtd_3d_nodes = dtd_3d_nodes_merge(dtd_3d_nodes1,dtd_3d_nodes2)

[n1,par1,perp1,theta1,phi1,r21] = dtd_3d_nodes2par(dtd_3d_nodes1);
[n2,par2,perp2,theta2,phi2,r22] = dtd_3d_nodes2par(dtd_3d_nodes2);

n = n1 + n2;
par = [par1; par2];
perp = [perp1; perp2];
theta = [theta1; theta2];
phi = [phi1; phi2];
r2 = [r21; r22];

dtd_3d_nodes = [par'; perp'; theta'; phi'; r2'];
dtd_3d_nodes = [n; dtd_3d_nodes(:)];
