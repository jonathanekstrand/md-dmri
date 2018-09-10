function dtd_3d_out = dtd_3d_sort(dtd_3d_in)

[n,par,perp,theta,phi,r2,w] = dtd_3d_dist2par(dtd_3d_in);

[wsort,ind] = sort(w,'descend');
ind = ind(wsort>0);

n = numel(ind);
par = par(ind);
perp = perp(ind);
theta = theta(ind);
phi = phi(ind);
r2 = r2(ind);
w = w(ind);

dtd_3d_out = [par'; perp'; theta'; phi'; r2'; w'];
dtd_3d_out = [n; dtd_3d_out(:)];
