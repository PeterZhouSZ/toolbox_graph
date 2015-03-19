function A = triangulation2adjacency(F)
% triangulation2adjacency - compute the adjacency matrix
%   of a given triangulation.
%   F : a [3, n] matrix

A = sparse( [F(1,:) F(2,:) F(3,:)] , ...
            [F(2,:) F(3,:) F(1,:)] , ...
            1 );
end 
