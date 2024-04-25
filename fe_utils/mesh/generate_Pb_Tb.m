function [Pb, Tb] = generate_Pb_Tb(P, T, basis_type)
if basis_type == 101
    Pb = P;
    Tb = T;
elseif basis_type == 102
    Pb = zeros(1, length(P) + length(T));
    Tb = zeros(3, length(T));
    PIndexToPbIndex = zeros(1, length(P));
    k = 1;
    for i = 1: length(T)
        index = T(:, i);
        if PIndexToPbIndex(index(1)) == 0
            PIndexToPbIndex(index(1)) = k;
            Pb(:, k) = P(:, index(1));
            k = k + 1;
        end
        vertices = P(:, index);
        Pb(:, k) = 0.5 * (vertices(1) + vertices(2)); k = k + 1; 
        mid = k - 1;
        if PIndexToPbIndex(index(2)) == 0
            PIndexToPbIndex(index(2)) = k;
            Pb(:, k) = P(:, index(2));
            k = k + 1;
        end
        Tb(:, i) = [PIndexToPbIndex(index(1)); mid; PIndexToPbIndex(index(2));];
    end
elseif basis_type == 103
    Pb = zeros(1, length(P) + length(T));
    Tb = zeros(4, length(T));
    PIndexToPbIndex = zeros(1, length(P));
    k = 1;
    for i = 1: length(T)
        index = T(:, i);
        if PIndexToPbIndex(index(1)) == 0
            PIndexToPbIndex(index(1)) = k;
            Pb(:, k) = P(:, index(1));
            k = k + 1;
        end
        vertices = P(:, index);
        Pb(:, k) = 1 / 3 * (vertices(1) + vertices(2)); k = k + 1; mid1 = k - 1;
        Pb(:, k) = 2 / 3 * (vertices(1) + vertices(2)); k = k + 1; mid2 = k - 1;
        if PIndexToPbIndex(index(2)) == 0
            PIndexToPbIndex(index(2)) = k;
            Pb(:, k) = P(:, index(2));
            k = k + 1;
        end
        Tb(:, i) = [PIndexToPbIndex(index(1)); mid1; mid2; PIndexToPbIndex(index(2))];
    end    
end 
end