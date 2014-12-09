function [ areas ] = compute_face_area(V, F)
%COMPUTE_FACE_AREA compute the face area of triangles

nF = size(F, 2);
areas = zeros(1, nF);
for i = 1:nF
    face = F(:, i);
    areas(i) = norm(cross( V(:, face(2)) - V(:, face(1)), ...
                           V(:, face(3)) - V(:, face(1)))) * 0.5;
end

end

