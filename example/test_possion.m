pde = possion_data();
basis_type = 101;
np = [8, 16, 32, 64, 128, 256, 512, 1024];
fprintf('error.l2_norm\t error.infinite_norm\t error.h1_semi_norm\t\n');
for i = 1: length(np)
    [mesh.P, mesh.T] = generate_P_T(pde.left, pde.right, np(i) );
    [FE.Pb, FE.Tb] = generate_Pb_Tb(mesh.P, mesh.T, basis_type);
    FE.boundarynodes = generate_boundarynodes(basis_type, FE.Pb);
    [solution, error] = possion_solver_1d(pde, mesh, FE, basis_type, basis_type); 
    fprintf('%e\t %e\t %e\t\n', error.l2_norm, error.infinite_norm, error.h1_semi_norm);
end