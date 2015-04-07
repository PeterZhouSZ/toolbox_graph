function [ kring ] = compute_k_ring( A, k )
%COMPUTE_K_RING compute kring

if k<1, return; end
Ak = (A^4 > 0) - speye(size(A, 1));
kring = adjmat2list(Ak);
    
end

