function [ areas ] = compute_face_area(V, F)
%COMPUTE_FACE_AREA compute the face area of triangles

nF = size(F, 2);
areas = zeros(1, nF);
for i = 1:nF
    face = F(:, i);
    e1 = V(:, face(2)) - V(:, face(1));
    e2 =  V(:, face(3)) - V(:, face(1));
    a = [ e1(2).*e2(3)-e1(3).*e2(2);
          e1(3).*e2(1)-e1(1).*e2(3);
          e1(1).*e2(2)-e1(2).*e2(1)];
    areas(i) = 0.5 * (a'*a)^0.5;
end

end

