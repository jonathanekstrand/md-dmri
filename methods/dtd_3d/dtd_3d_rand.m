function dtd_3d_nodes = dtd_3d_rand(n,dmin,dmax,r2min,r2max)


% ratio = 1*(100).^rand(1,n);
% delta = (ratio-1)./(2+ratio);
% iso = dmax./(1+2*delta);
% iso = dmin*(iso/dmin).^rand(1,n);

par = dmin*(dmax/dmin).^rand(1,n);

% Which should be use?
perp = dmin*(dmax/dmin).^rand(1,n);
% perp = dmin*(par/dmin).^rand(1,n);


% par = iso.*(1+2*delta);
% perp = iso.*(1-delta);

% What does this do?
% perp(round(.9*n):n) = par(round(.9*n):n);

theta = acos(2*rand(1,n)-1);
phi = 2*pi*rand(1,n);
r2 = r2min*(r2max/r2min).^rand(1,n);

dtd_3d_nodes = [par; perp; theta; phi; r2];
dtd_3d_nodes = [n; dtd_3d_nodes(:)];


