function m = inty_1d_data2fit(signal, xps, opt, ind)
% function m = inty_1d_data2fit(signal, xps, opt, ind)
%
% Size-shape-orientation diffusion tensor distribution

% if (nargin < 4), ind = find(xps.b ~= 0); end
% if (nargin < 4), ind = find(xps.b ~= 0 & xps.b < 2e9); end
if (nargin < 4), ind = ones(size(signal)) > 0; end

% bt_mx6 = xps.bt(find(ind),:);
bt_mx6 = xps.bt(ind,:);
te = xps.te(ind);
stemp = signal(ind);

inty = inty_proliferation(stemp, bt_mx6, te, opt);
%inty
%pause
inty = inty_extinction(stemp, bt_mx6, te, inty, opt);
m = inty_inty2m(inty,opt);
% size(m)
if (opt.inty.do_plot)
    figure(1), clf
    signal_fit = inty_1d_fit2data(m, xps);
    %[~,s_ind] = sort(signal_fit,'descend');
    %semilogy(xps.b,signal,'.',xps.b,signal_fit,'o',xps.b,m(1)*weight,'x');
    plot(1:xps.n,signal,'o',1:xps.n,signal_fit,'x');
    %set(gca,'YLim',m(1)*[.01 1.2])
    pause(0.05);
end