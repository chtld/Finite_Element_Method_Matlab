function [A,b]=treat_boundary_condition(A,b,FE, pde)
number_of_boundarynodes=size(FE.boundarynodes,2);
for k=1:number_of_boundarynodes
    if FE.boundarynodes(1, k) == -1
        A(FE.boundarynodes(2,k),:) = 0;      
        A(FE.boundarynodes(2,k), FE.boundarynodes(2,k)) = 1;
        b(FE.boundarynodes(2,k))= pde.Dirichlet(FE.Pb(FE.boundarynodes(2,k)));
    elseif FE.boundarynodes(1, k) == -2
        x = FE.Pb(FE.boundarynodes(2, k));
        if pde.rightBoundaryType == "Neumann"
            b(FE.boundarynodes(2, k)) = b(FE.boundarynodes(2, k)) + pde.coefficient(x) .* pde.Neumann(x);
        end
        if pde.leftBoundaryType == "Neumann"
            b(FE.boundarynodes(2, k)) = b(FE.boundarynodes(2, k)) - pde.coefficient(x) .* pde.Neumann(x);
        end
    end
end