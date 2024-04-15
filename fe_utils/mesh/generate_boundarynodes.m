function boundarynodes = generate_boundarynodes(pde, Pb)
boundarynodes = zeros(2, 2);
if pde.leftBoundaryType == "Dirichlet"
    boundarynodes(:, 1) = [-1; 1];
elseif pde.leftBoundaryType == "Neumann"
    boundarynodes(:, 1) = [-2; 1];
end
if pde.rightBoundaryType == "Dirichlet"
    boundarynodes(:, 2) = [-1; size(Pb, 2)];
elseif pde.rightBoundaryType == "Neumann"
    boundarynodes(:, 2) = [-1; size(Pb, 2)];
end
end