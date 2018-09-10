function s = inty_1d_fit2data(m, xps)

if m(1)>0
    inty = inty_m2inty(m);
    [inty_nx6,r2,w] = inty_dist2nx6r2w(inty);
    k = exp(-xps.bt*inty_nx6').*exp(-xps.te*r2');
    s = k*w;
else
    s = zeros(xps.n,1);
end

