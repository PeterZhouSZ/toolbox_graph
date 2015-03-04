function [ face_center ] = compute_face_center( vertex, face )

face_center = ( vertex(:, face(1, :)) +  vertex(:, face(2, :)) + ...
    vertex(:, face(3, :)) ) / 3;

end
