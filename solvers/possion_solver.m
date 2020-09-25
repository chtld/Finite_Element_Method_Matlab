function [solution, error] = possion_solver(pde, mesh, FE, basis_type_trial, basis_type_test)
% possion_solver
% 1-d possion_solver for possion equation
% @author: chtld
% @date: 20191013
% @param pde: the pde struct, include the coefficient function, exact
% solution, the right hand side and the boundary conditions of different
% kind.
A = assemble_matrix_1d(pde.coefficient, mesh, FE, basis_type_trial, basis_type_test, 1, 1, 4);
b = assemble_vector_1d(pde.right_hand_side, mesh, FE, basis_type_test, 0, 4);
[A, b] = treat_boundary_condition(A, b, FE, pde);
solution = A \ b;
u = pde.exact(FE.Pb)';
error = norm(solution - u, 2);
end