function pde = possion_data()
% possion_data
% This is the example for possion equation, sunch as the coefficient,right-
% handside, the boundary condition, the equation like this 
% $-\frac{d}{dx}(c(x)\frac{du}{dx}) = f(x), a < x < b$.
% $u(a) = u(b) = Dirichlet(x)$
% $u'(a) = u'(b) = Neumann(x)$
% $u(a) = u(b) = Robin(x)$
% @author: chtld
% @date: 20191013
% @return: pde struct
pde.right_hand_side = @(x) -exp(x) .* (cos(x) - 2 * sin(x) - x .* cos(x) - x .* sin(x));
pde.coefficient = @(x) exp(x);
pde.Dirichlet = @(x) x .* cos(x);
pde.Nuemann = @(x) cos(x) - x .* sin(x);
pde.exact = @(x) x .* cos(x);
pde.exact_x = @(x) cos(x) - x .* sin(x);
pde.left = 0;
pde.right = 1;
end