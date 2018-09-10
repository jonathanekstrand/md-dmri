function m = dtd_bdelta_s_vs_b_for_b_delta(S, xps, fun_data2fit, fun_fit2data, fun_opt, h, ind)
% function dtd_bdelta_s_vs_b_for_b_delta(S, xps, fun_data2fit, fun_fit2data, fun_opt, h, h2)

if (nargin < 8), ind = []; end

% adapt xps
xps = msf_ensure_field(xps, 'b_eta', zeros(size(xps.b_delta)));

% fit function

if (nargin < 8)   
    ind = ones(size(S)) == 1;
end

m = fun_data2fit(S(ind), mdm_xps_subsample(xps, ind), fun_opt());

% c = 2;

% find unique b_delta
b_delta_input = round(xps.b_delta * 100) / 100;

[b_delta_uni,~] = unique(b_delta_input);

b_delta_uni = sort(b_delta_uni);

if (numel(b_delta_uni) == 1)
    cmap = [0 0 0];
else
    cmap = 0.8 * hsv(numel(b_delta_uni) + 2);
end

lines = [];

cla(h);
hold(h, 'off');
for c = 1:numel(b_delta_uni)
    
    ind2 = b_delta_input == b_delta_uni(c);
    
    ind3 = ind2 & (~ind);
    
    h1 = semilogy(h, xps.b(ind2) * 1e-9, S(ind2) / m(1), 'o', 'color', cmap(c,:), ...
        'markersize', 5, 'markerfacecolor', cmap(c,:));

    hold(h, 'on');

    h2 = semilogy(h, xps.b(ind3) * 1e-9, S(ind3) / m(1), 'x', 'color', cmap(c,:), ...
        'markersize', 10, 'markerfacecolor', cmap(c,:));
    
    clear xps2;
    try
        xps2.n = 32;
        xps2.b = linspace(eps, max(xps.b(ind2)) * 1.1, xps2.n);
        xps2.b_delta = mean(xps.b_delta(ind2));
        xps2.b_eta   = mean(xps.b_eta(ind2));
        
        S_fit = fun_fit2data(m, xps2);
    catch
        xps2 = mdm_xps_subsample(xps, ind2);
        S_fit = fun_fit2data(m, xps2);
    end
    
    h3 = semilogy(h, xps2.b * 1e-9, S_fit / m(1), '-', 'color', cmap(c,:), 'linewidth', 2);
    lines = [lines; h3];
end

l_str = cell(1,numel(b_delta_uni));
for c = 1:numel(b_delta_uni)
%     plot(h,10,10,'-', 'color', cmap(c,:), 'linewidth', 2);
%     hold(h, 'on');
    l_str{c} = ['b_\Delta = ' num2str(b_delta_uni(c))];
end




% ylim(h, [-1 1]);
% legend(h, l_str, 'location', 'southwest');
legend(lines, l_str, 'location', 'southwest');
% axis(h, 'off');

axis(h, 'on');
box(h, 'off');
set(h, 'tickdir','out');



ylim(h, [10^floor(log10(min(S(S(:) > 0) / m(1)))) 1.1]);

xlabel(h, 'b [ms/um^2]');
ylabel(h, 'Signal');

% legend()




% show legend
% if (~isempty(h2))
%     
%     l_str = cell(1,numel(b_delta_uni));
%     for c = 1:numel(b_delta_uni)
%         plot(h2,10,10,'-', 'color', cmap(c,:), 'linewidth', 2);
%         hold(h2, 'on');
%         l_str{c} = ['b_\Delta = ' num2str(b_delta_uni(c))];
%     end
%     ylim(h2, [-1 1]);
%     legend(h2, l_str, 'location', 'northwest');
%     axis(h2, 'off');
% 
% end

