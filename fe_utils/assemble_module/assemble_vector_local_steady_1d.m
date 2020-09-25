function b=assemble_vector(right_hand_side,mesh,FE,basis_type_test,der_test,gauss_type)
b=zeros(size(FE.Pb,2),1);
number_of_elements=size(FE.Tb,2);
number_of_local_basis=size(FE.Tb,1);
for  n=1:number_of_elements
    vertices=mesh.P(:,mesh.T(:,n));
    for i=1:number_of_local_basis
        b(FE.Tb(i,n))=b(FE.Tb(i,n))+ gauss_int_test(right_hand_side, vertices, basis_type_test, i,...
            der_test,gauss_type);
        
    end
end
end