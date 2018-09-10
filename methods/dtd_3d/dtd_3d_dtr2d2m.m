function m = dtd_3d_dtd_3d2m(dtd_3d,opt)

m = zeros(1 + 6*opt.dtd_3d.n_out,1);
if ~isempty(dtd_3d)
    m(1:numel(dtd_3d)) = dtd_3d;
    m = m(1:(1 + 6*opt.dtd_3d.n_out),1);
    m(1) = min([dtd_3d(1) opt.dtd_3d.n_out]);
end
m = m';
