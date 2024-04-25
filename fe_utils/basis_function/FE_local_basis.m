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
elseif basis_type == 102
    if basis_index == 1
        if der == 0
            result = 2 .* ((x - vertices(1)) ./ h) .^ 2 - 3 .* (x - vertices(1)) ./ h + 1;
        elseif der == 1
            result = 4 .* (x - vertices(1)) ./ (h.^2) - 3 / h;
        end
    elseif basis_index == 3
        if der == 0
            result = 2 .* ((x - vertices(1)) / h) .^ 2 - (x - vertices(1)) / h;
        elseif der == 1
            result = 4 .* (x - vertices(1)) ./ (h .^ 2) - 1 / h;
        end
    elseif basis_index == 2
        if der == 0
            result = -4 .* ((x - vertices(1)) / h) .^ 2 + 4 .* (x - vertices(1)) / h;
        elseif der == 1
            result = -8 .* (x - vertices(1)) / (h .^ 2) + 4 / h;
        end
    end
elseif basis_type == 103
        
end
end