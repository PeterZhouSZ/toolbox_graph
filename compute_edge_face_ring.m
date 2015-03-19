function e2f = compute_edge_face_ring(F)

% compute_edge_face_ring - compute faces adjacent to each edge
%
%   e2f = compute_edge_face_ring(face);
%
%   e2f(i,j) and e2f(j,i) are the number of the two faces adjacent to
%   edge (i,j).

nf = size(F, 2);
i = [F(1,:) F(2,:) F(3,:)];
j = [F(2,:) F(3,:) F(1,:)];
s = [1:nf 1:nf 1:nf];
e2f = sparse(i,j,s); 

end