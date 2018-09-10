function dtd_3d = dtd_3d_extinction(stemp, bt_mx6, te, dtd_3d, opt)

n_nodes = opt.dtd_3d.n_in;
n_extinction = opt.dtd_3d.n_extinction;

for niter = 1:n_extinction    
    n_in = dtd_3d(1);
    n_max = min([(n_in-opt.dtd_3d.n_kill) opt.dtd_3d.n_out dtd_3d(1)]);

    dtd_3d_nodes1 = dtd_3d_dist2nodes(dtd_3d);
    ind = 1:n_max;
    dtd_3d_nodes1 = dtd_3d_nodes_select(dtd_3d_nodes1,ind);
    ind = 1 + floor((n_max-1)*linspace(0,1,n_nodes).^3);
    ind(ind<1) = 1;
    %dtd_3d_nodes1(1)
    %ind
    if dtd_3d_nodes1(1) == 0
        dtd_3d = [];
        break
    end
    
    dtd_3d_nodes2 = dtd_3d_nodes_select(dtd_3d_nodes1,ind);
    dtd_3d_nodes2 = dtd_3d_nodes_mutate(dtd_3d_nodes2,opt);

    dtd_3d_nodes = dtd_3d_nodes_merge(dtd_3d_nodes1,dtd_3d_nodes2);

    dtd_3d = dtd_3d_data2dtd_3d(stemp,bt_mx6,te,dtd_3d_nodes);    
end

if ~isempty(dtd_3d)
    dtd_3d_nodes = dtd_3d_dist2nodes(dtd_3d);
    n_max = min([opt.dtd_3d.n_out dtd_3d(1)]);
    ind = 1:n_max;
    dtd_3d_nodes = dtd_3d_nodes_select(dtd_3d_nodes,ind);
    dtd_3d = dtd_3d_data2dtd_3d(stemp,bt_mx6,te,dtd_3d_nodes);    
end
