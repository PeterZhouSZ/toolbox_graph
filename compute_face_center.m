function [ face_center ] = compute_face_center( face, vertex )

nf = size(face, 2);
d = size(vertex, 1);
face_center = zeros(d, nf);
for i = 1:nf
    f = face(:, i);
    face_center(:, i) = sum(vertex(:, f), 2)/3;
end

