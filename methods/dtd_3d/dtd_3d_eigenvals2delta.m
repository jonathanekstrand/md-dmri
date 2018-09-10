function delta = dtd_3d_eigenvals2delta(iso, eigvals_nx3)
% function iso = tm_eigvals2iso(eigvals_nx3)
%
% Input: D_iso and nx3 matrix of eigenvalues
% Output: nx1 vector of anisotropy and asymmetry (D_delta)


eigval_xx = eigvals_nx3(:,1);
eigval_yy = eigvals_nx3(:,2);
eigval_zz = eigvals_nx3(:,3);

delta = 1 - eigval_yy./iso;

%delta = (eigval_xx./iso - 1)./2;

