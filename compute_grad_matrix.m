function [ G ] = compute_grad_matrix( V, F)

nf = size(F, 2);

Gi = zeros(nf*9, 1);
Gj = zeros(nf*9, 1);
Gs = zeros(nf*9, 1);

for i = 1:nf
    face = F(:, i);
    % gradients of barycentric functions
    [g1, g2, g3] = triangle_grad( V(:, face(1)), V(:, face(2)),  V(:, face(3)));    
    Gs(9*i - 8 : 9*i ) = [g1; g2; g3];
    Gi(9*i - 8 : 9*i ) = repmat( [3*i-2:3*i]', 3, 1);
    Gj(9*i - 8 : 9*i ) = [ones(3, 1)*face(1); ones(3, 1)*face(2); ones(3, 1)*face(3)];
end
G = sparse(Gi, Gj, Gs);

end