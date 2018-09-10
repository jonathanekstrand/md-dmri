function dist_s = dtd_3d_2d_discrete2smooth(c, dist_s)


n0 = c.n;
x0 = c.x;
y0 = c.y;
w0 = c.w;

% size(w0)

x = dist_s.x;
y = dist_s.y;
xsigma = dist_s.xsigma;
ysigma = dist_s.ysigma;
nx = numel(x);
ny = numel(y);

%dx
%dy

[xx,yy] = ndgrid(x,y);
xx_k = repmat(xx(:),[1 n0]);
yy_k = repmat(yy(:),[1 n0]);
x0_k = repmat(x0', [nx*ny 1]);
y0_k = repmat(y0', [nx*ny 1]);


k = 1/(xsigma*sqrt(2*pi)).*exp(-(xx_k-x0_k).^2/(2*xsigma^2)).*...
    1/(ysigma*sqrt(2*pi)).*exp(-(yy_k-y0_k).^2/(2*ysigma^2));

p = k*w0;


dist_s.w = reshape(p, [nx ny]);
dist_s.wprojx = sum(dist_s.w,2);
dist_s.wprojy = sum(dist_s.w,1);