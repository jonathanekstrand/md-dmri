function xps = mdm_xps_subsample(xps, ind)% function xps = mdm_xps_subsample(xps, ind)% help the usermdm_xps_check(xps);if (numel(ind) ~= xps.n)    error('expected logical array with %i elements ', xps.n);endf = fieldnames(xps);for c = 1:numel(f)        switch (f{c})        case {'intent', 'n', 'c_volume'}            1;        otherwise            try                xps.(f{c}) = xps.(f{c})(ind,:);            catch me                disp(f{c});                rethrow(me);            end                end    end xps.n = numel(xps.b);