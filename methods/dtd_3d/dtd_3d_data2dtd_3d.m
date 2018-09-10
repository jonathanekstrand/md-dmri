function dtd_3d = dtd_3d_data2dtd_3d(stemp, bt_mx6, te, dtd_3d_nodes)

[dtd_3d_nx6,r2] = dtd_3d_nodes2nx6r2(dtd_3d_nodes);

k = exp(-bt_mx6*dtd_3d_nx6').*exp(-te*r2');
snorm = max(stemp);
w = snorm*lsqnonneg(k,stemp/snorm);

dtd_3d = dtd_3d_nodesw2dist(dtd_3d_nodes,w);
dtd_3d = dtd_3d_sort(dtd_3d);




