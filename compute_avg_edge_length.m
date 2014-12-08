function [ avgEdge ] = compute_avg_edge_length( vertex, faces )
%COMPUTE_AVG_EDGE_LENGHT compute the average edge length

avgEdge = 0; 
n = size(faces, 2);
for i = 1:n
    v1 = vertex(:, faces(1, i));
    v2 = vertex(:, faces(2, i));
    v3 = vertex(:, faces(3, i));
    avgEdge = avgEdge + norm(v1-v2) + norm(v1-v3) + norm(v2-v3);
end
avgEdge = avgEdge / (3*n);

end

