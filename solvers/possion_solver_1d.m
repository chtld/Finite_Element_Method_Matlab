function [solution, error] = possion_solver_1d(pde, mesh, FE, basis_type_trial, basis_type_test)
% possion_solver
% 1-d possion_solver for possion equation
% @author: chtld
% @date: 20191013
% @param pde: the pde struct, include the coefficient function, exact
% solution, the right hand side and the boundary conditions of different
% kind.
A = assemble_matrix_steady_1d(pde.coefficient, mesh, FE, basis_type_trial, basis_type_test, 1, 1, 4);
b = assemble_vector_steady_1d(pde.right_hand_side, mesh, FE, basis_type_test, 0, 4);
[A, b] = treat_boundary_condition(A, b, FE, pde);
solution = A \ b;
error.l2_norm = compute_error_Hs_norm(pde.exact, solution, mesh.P, mesh.T, FE.Tb, basis_type_test, 0, 4);
error.h1_semi_norm = compute_error_Hs_norm(pde.exact_x, solution, mesh.P, mesh.T, FE.Tb, basis_type_test, 1, 4);
error.infinite_norm = compute_error_infinite_norm(pde.exact, solution, mesh.P, mesh.T, FE.Tb, basis_type_test, 0);
end