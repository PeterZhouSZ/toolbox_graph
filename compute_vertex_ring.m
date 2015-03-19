function vring = compute_vertex_ring(F)

% compute_vertex_ring - compute the 1 ring of each vertex in a triangulation.
%
%   vring = compute_vertex_ring(face);
%
%   vring{i} is the set of vertices that are adjacent
%   to vertex i.

i = [F(1,:) F(2,:) F(3,:)];
j = [F(2,:) F(3,:) F(1,:)] ;

n = length(i);
vring{n} = [];

for m = 1:n
    vring{i(m)}(end+1) = j(m);
end