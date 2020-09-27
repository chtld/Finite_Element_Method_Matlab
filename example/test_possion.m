pde = possion_data();
basis_type = 101;
np = [8, 16, 32, 64, 128, 256, 512, 1024];
for i = 1: length(np)
    [mesh.P, mesh.T] = generate_P_T(pde.left, pde.right, np(i) );
    [FE.Pb, FE.Tb] = generate_Pb_Tb(mesh.P, mesh.T, basis_type);
    FE.boundarynodes = generate_boundarynodes(basis_type, FE.Pb);
    [solution, error] = possion_solver(pde, mesh, FE, basis_type, basis_type);
    fprintf('%e\n', error);
end