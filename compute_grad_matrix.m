function [ G ] = construct_grad_matrix( V, F)

nv = size(V, 2);
nf = size(F, 2);

Gi = zeros(nf*9, 0);
Gj = zeros(nf*9, 0);
Gs = zeros(nf*9, 0);

for i = 1:nf
    face = F(:, i);
    % gradients of barycentric functions
    [g1, g2, g3] = triangle_grad( V(:, face(1)), V(:, face(2)),  V(:, face(3)));    
    Gs(9*i - 8 : 9*i ) = reshape([g1, g2, g3], 9, 1);
    
    for j = 0:2
        idx = 3*i + 3*j;
        Gi(idx - 2: idx) = ones(3, 1) * (3*i + j - 2);
        Gj(idx - 2: idx) = face;
    end
end
G = sparse(Gi, Gj, Gs);

end