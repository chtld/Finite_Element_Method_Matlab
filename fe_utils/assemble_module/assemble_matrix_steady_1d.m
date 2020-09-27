function A = assemble_matrix_steady_1d(coef_fun,mesh,FE,basis_type_trial,basis_type_test,der_trial,der_test,gauss_type)
A=zeros(size(FE.Pb,2),size(FE.Pb,2));
number_of_elements=size(FE.Tb,2);
number_of_local_basis=size(FE.Tb,1);
for n=1:number_of_elements
    vertices=mesh.P(:,mesh.T(:,n));
    for j=1: number_of_local_basis
        for i=1:number_of_local_basis
            A(FE.Tb(i,n),FE.Tb(j,n))= A(FE.Tb(i,n),FE.Tb(j,n))...
                +gauss_int_trial_test_steady_1d(coef_fun, vertices, basis_type_trial,basis_type_test,...
                                        j, i,der_trial,der_test,gauss_type);            
        end        
    end
end
end
