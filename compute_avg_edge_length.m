function [ avgEdge ] = compute_avg_edge_length( vertex, face )
%COMPUTE_AVG_EDGE_LENGHT compute the average edge length

n = size(face, 2);

v1 = vertex(:, face(1, :));
v2 = vertex(:, face(2, :));
v3 = vertex(:, face(3, :));

avgEdge = sum( sqrt( sum((v1-v2).^2)) ) + ...
          sum( sqrt( sum((v1-v3).^2)) ) + ...
          sum( sqrt( sum((v3-v2).^2)) ) ;
      
avgEdge = avgEdge / (3*n);

end

