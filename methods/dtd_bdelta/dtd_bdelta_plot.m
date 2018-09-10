function dtd_bdelta_plot(S, xps, h, h2)
% function dtd_bdelta_plot(S, xps, h, h2)

%if (nargin < 4), h2 = []; end

ind = (S > 0.1 * max(S));

m = dtd_bdelta_s_vs_b_for_b_delta(S, xps, ...
    @dtd_bdelta_1d_data2fit, @dtd_bdelta_1d_fit2data, @dtd_bdelta_opt, h, ind);

title(h, sprintf('D_I = %0.2f, D(delta) = %0.2f', m(2) * 1e9, m(3)));

% opt = mdm_opt();
opt = dtd_bdelta_opt();

if(opt.dtd_bdelta.slider)
    

    slider = uicontrol('Style', 'slider',...    
                  'Min',1,'Max',4,'Value',1,...
                  'sliderstep',[1/3 1],...
                  'Position',[750 15 70 15],...
                  'Callback', {@do_plot,S,xps,h2});
end

function do_plot(varargin)

[source,S,xps,h2] = varargin{[1,3,4,5]};

num = source.Value;

ind = ones(size(S)) == 1;

opt = dtd_bdelta_opt();
m = dtd_bdelta_1d_data2fit(S, xps, opt);

% find unique b_delta
b_delta_input = round(xps.b_delta * 100) / 100;

[b_delta_uni,~] = unique(b_delta_input);

b_delta_uni = sort(b_delta_uni);

if (numel(b_delta_uni) == 1)
    cmap = [0 0 0];
else
    cmap = 0.8 * hsv(numel(b_delta_uni) + 2);
end

cla(h2);
hold(h2, 'off');

for c = num:num
    
    ind2 = b_delta_input == b_delta_uni(c);
    
    ind3 = ind2 & (~ind);
    
    semilogy(h2, xps.b(ind2) * 1e-9, S(ind2) / m(1), 'o', 'color', cmap(c,:), ...
        'markersize', 5, 'markerfacecolor', cmap(c,:));

    hold(h2, 'on');

    semilogy(h2, xps.b(ind3) * 1e-9, S(ind3) / m(1), 'x', 'color', cmap(c,:), ...
        'markersize', 10, 'markerfacecolor', cmap(c,:));
    clear xps2;
    try
        xps2.n = 32;
        xps2.b = linspace(eps, max(xps.b(ind2)) * 1.1, xps2.n);
        xps2.b_delta = mean(xps.b_delta(ind2));
        xps2.b_eta   = mean(xps.b_eta(ind2));
        
        S_fit = dtd_bdelta_1d_fit2data(m, xps2);
    catch
        xps2 = mdm_xps_subsample(xps, ind2);
        S_fit = dtd_bdelta_1d_fit2data(m, xps2);
    end
    
    semilogy(h2, xps2.b * 1e-9, S_fit / m(1), '-', 'color', cmap(c,:), 'linewidth', 2);
end
axis(h2, 'on');
box(h2, 'off');
set(h2, 'tickdir','out');

ylim(h2, [10^floor(log10(min(S(S(:) > 0) / m(1)))) 1.1]);
xlim(h2, [0 2.5]);

xlabel(h2, 'b [ms/um^2]');
ylabel(h2, 'Signal');



% title(h2, sprintf('D_I = %0.2f, D(delta) = %0.2f', m(2) * 1e9, m(3)));

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

