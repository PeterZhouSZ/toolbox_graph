function e2f = compute_edge_face_ring(F)

% compute_edge_face_ring - compute faces adjacent to each edge
%
%   e2f = compute_edge_face_ring(face);
%
%   e2f(i,j) and e2f(j,i) are the number of the two faces adjacent to
%   edge (i,j).

 
nf = size(F, 2);
si = reshape(F, 3*nf, 1);
sj = reshape([F(2:3, :); F(1, :)], 3*nf, 1);
s = reshape( repmat(1:nf, 3, 1), 3*nf, 1);
e2f = sparse(si, sj, s);

end