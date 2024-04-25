% possion_test_example
% This is the example for possion equation, sunch as the coefficient,right-
% handside, the boundary condition, the equation like this
% $-\frac{d}{dx}(c(x)\frac{du}{dx}) = f(x), a < x < b$.
% $u(a) = u(b) = Dirichlet(x)$
% $u'(a) = u'(b) = Neumann(x)$
% $u(a) = u(b) = Robin(x)$
% @author: chtld
% @date: 20191013
pde.right_hand_side = @(x) -exp(x) .* (cos(x) - 2 * sin(x) - x .* cos(x) - x .* sin(x));
pde.coefficient = @(x) exp(x);
pde.Dirichlet = @(x) x .* cos(x);
pde.Neumann = @(x) cos(x) - x .* sin(x);
pde.exact = @(x) x .* cos(x);
pde.exact_x = @(x) cos(x) - x .* sin(x);
pde.left = 0;
pde.right = 1;

% pde.leftBoundaryType = 'Dirichlet';
pde.leftBoundaryType = 'Neumann';
pde.rightBoundaryType = 'Dirichlet';
% pde.rightBoundaryType = "Neumann";

basis_type = 102;
np = [8, 16, 32, 64, 128, 256, 512, 1024];
grid_size = zeros(length(np), 1);
l2_error = zeros(length(np), 1);
infinite_error = zeros(length(np), 1);
h1_semi_error = zeros(length(np), 1);
fprintf('error.l2_norm\t error.infinite_norm\t error.h1_semi_norm\t\n');
for i = 1: length(np)
    [mesh.P, mesh.T] = generate_P_T(pde.left, pde.right, np(i) );
    [FE.Pb, FE.Tb] = generate_Pb_Tb(mesh.P, mesh.T, basis_type);
    FE.boundarynodes = generate_boundarynodes(pde, FE.Pb);
    [solution, error] = possion_solver_1d(pde, mesh, FE, basis_type, basis_type);
    fprintf('%e\t %e\t %e\t\n', error.l2_norm, error.infinite_norm, error.h1_semi_norm);
    grid_size(i) = 1 / np(i);
    l2_error(i) = error.l2_norm;
    infinite_error(i) = error.infinite_norm;
    h1_semi_error(i) = error.h1_semi_norm;
end
figure;
plotConvergenceRate(grid_size, l2_error); hold on;
plotConvergenceRate(grid_size, infinite_error); hold on;
plotConvergenceRate(grid_size, h1_semi_error); hold on;
lgd = legend({'$L_{2}$','$L_{\infty}$','$H_{1}$'}, 'Interpreter', 'latex', 'FontSize', 12, 'TextColor', 'blue');