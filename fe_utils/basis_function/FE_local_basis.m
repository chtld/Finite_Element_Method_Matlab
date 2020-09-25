function result=FE_local_basis(x,vertices,basis_type,basis_index,der)
h=(vertices(2)-vertices(1));
if basis_type==101
    if basis_index==1
        if der==0
            result=(vertices(2)-x)/h;
        elseif der==1
            result=-1/h;
        end
    elseif basis_index==2
        if der==0
            result=(x-vertices(1))/h;
        elseif der==1
            result=1/h;
        end
    end
end
end