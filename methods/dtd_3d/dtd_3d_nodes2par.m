function [n,par,perp,theta,phi,r2] = dtd_3d_nodes2par(dtd_3d_nodes)

if ~isempty(dtd_3d_nodes)
    n = dtd_3d_nodes(1);
    if n > 0
        m = numel(dtd_3d_nodes(2:end))/n;
        dtd_3d_nodes_array = reshape(dtd_3d_nodes(2:end),[m n]);
        par = dtd_3d_nodes_array(1,:)';
        perp = dtd_3d_nodes_array(2,:)';
        theta = dtd_3d_nodes_array(3,:)';
        phi = dtd_3d_nodes_array(4,:)';
        r2 = dtd_3d_nodes_array(5,:)';
    else
        n = 0;
        par = [];
        perp = [];
        theta = [];
        phi = [];
        r2 = [];        
    end
else
    n = 0;
    par = [];
    perp = [];
    theta = [];
    phi = [];
    r2 = [];
end
