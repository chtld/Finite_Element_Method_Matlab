function [A,b]=treat_boundary_condition(A,b,FE, pde)
number_of_boundarynodes=size(FE.boundarynodes,2);
for k=1:number_of_boundarynodes
    if FE.boundarynodes(1,k) == -1
        A(FE.boundarynodes(2,k),:) = 0;      
        A(FE.boundarynodes(2,k), FE.boundarynodes(2,k)) = 1;
        b(FE.boundarynodes(2,k))= pde.Dirichlet(FE.Pb(FE.boundarynodes(2,k)));
    end
end