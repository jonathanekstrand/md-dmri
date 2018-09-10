function m = dtd_3d_1d_initfit2regfit(signal, xps, opt, ind, dtd_3d_nodes)
% function m = dtd_3d_1d_initfit2regfit(signal, xps, opt, ind)
%
% Size-shape-orientation diffusion tensor distribution

if (nargin < 4), ind = ones(size(signal)) > 0; end

bt_mx6 = xps.bt(find(ind),:);
te = xps.te(ind);
stemp = signal(ind);

if dtd_3d_nodes(1)>1
    dtd_3d_nodes = dtd_3d_nodes(1:(1+5*dtd_3d_nodes(1)));
    dtd_3d = dtd_3d_data2dtd_3d(stemp,bt_mx6,te,dtd_3d_nodes);
else
    dtd_3d = [];
end
if ~isempty(dtd_3d)
    if dtd_3d(1) > 0
        dtd_3d_nodes = dtd_3d_dist2nodes(dtd_3d);
        n_max = min([opt.dtd_3d.n_out dtd_3d(1)]);
        dtd_3d_nodes = dtd_3d_nodes_select(dtd_3d_nodes,1:n_max);
        dtd_3d = dtd_3d_data2dtd_3d(stemp,bt_mx6,te,dtd_3d_nodes); 
    end
end

m = dtd_3d_dtd_3d2m(dtd_3d,opt);
%size(m), pause
if (opt.dtd_3d.do_plot)
    figure(1), clf
    signal_fit = dtd_3d_1d_fit2data(m, xps);
    %[~,s_ind] = sort(signal_fit,'descend');
    %semilogy(xps.b,signal,'.',xps.b,signal_fit,'o',xps.b,m(1)*weight,'x');
    plot(1:xps.n,signal,'o',1:xps.n,signal_fit,'x');
    %set(gca,'YLim',m(1)*[.01 1.2])
    pause(0.05);
end