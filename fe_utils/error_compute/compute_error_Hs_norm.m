function error = compute_error_Hs_norm(exact_solution_fun, solution,P,T, Tb, basis_type, der, gauss_type)
error = 0.0;
number_of_elments = size(Tb,2);
for n = 1: number_of_elments
    vertices = P(:,T(:,n));
    uh_local = solution(Tb(:,n));
    [gauss_weights, gauss_points] = generate_gauss_formula_1d(vertices, gauss_type);
    local_error = guass_int_error_1d(exact_solution_fun, gauss_weights, gauss_points, uh_local, vertices, basis_type, der);
    error=error + local_error;
end
error=sqrt(error);
