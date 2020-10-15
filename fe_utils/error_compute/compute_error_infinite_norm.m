function error = compute_error_infinite_norm(exact_solution_fun, solution, P, T, Tb, basis_type, der)
%º∆À„Œﬁ«Ó∑∂ ˝ŒÛ≤Ó
number_of_elements = size(T,2);
error = [];
for n = 1: number_of_elements
    vertices = P(:, T(:, n));
    uh_local = solution(Tb(:, n));
    evaluation_points = select_evalution_points(vertices);
    error_local = abs(feval(exact_solution_fun, evaluation_points)...
                      - FE_function_1d(evaluation_points, uh_local, vertices, basis_type, der)); 
    error = [error error_local];
end
error = max(error);
end