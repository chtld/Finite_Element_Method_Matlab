function boundarynodes = generate_boundarynodes(basis_type, Pb)
if basis_type == 101
    boundarynodes = zeros(2, 2);
    boundarynodes(:, 1) = [-1; 1];
    boundarynodes(:, 2) = [-1; size(Pb, 2)];
elseif basis_type == 102
    % yuantodo
end
end