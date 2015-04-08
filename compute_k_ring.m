function [ kring ] = compute_k_ring( ring, k )
%COMPUTE_K_RING compute kring

if k<1, kring = ring; return; end
A = adjlist2mat(ring);
Ak = (A^k > 0) - speye(size(A, 1));
kring = adjmat2list(Ak);
    
end