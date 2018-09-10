function [n,par,perp,theta,phi,r2,w] = dtd_3d_dist2par(dtd_3d)

n = dtd_3d(1);

if n>0
    m = numel(dtd_3d(2:end))/n;
    dtd_3d_array = reshape(dtd_3d(2:end),[m n]);
    par = dtd_3d_array(1,:)';
    perp = dtd_3d_array(2,:)';
    theta = dtd_3d_array(3,:)';
    phi = dtd_3d_array(4,:)';
    r2 = dtd_3d_array(5,:)';
    w = dtd_3d_array(6,:)';
else
    par = [];
    perp = [];
    theta = [];
    phi = [];
    r2 = [];
    w = [];
end
