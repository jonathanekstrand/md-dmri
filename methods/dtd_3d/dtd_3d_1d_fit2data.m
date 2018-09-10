function s = dtd_3d_1d_fit2data(m, xps)

if m(1)>0
    dtd_3d = dtd_3d_m2dtd_3d(m);
    [dtd_3d_nx6,r2,w] = dtd_3d_dist2nx6r2w(dtd_3d);
    k = exp(-xps.bt*dtd_3d_nx6').*exp(-xps.te*r2');
    s = k*w;
else
    s = zeros(xps.n,1);
end

