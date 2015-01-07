function [g1, g2, g3] = compute_triangle_grad( p1, p2, p3 )
% [g1, g2, g3] = trigrad( p1, p2, p3 )
%   g1/g2/g3 are barycentric basis function gradients


e12 = p2 - p1;
e23 = p3 - p2;
e31 = p1 - p3;

l12 = norm(e12);
l23 = norm(e23);
l31 = norm(e31);

if l12 < 1.0e-20 || l23 < 1.0e-20 || l31 < 1.0e-20
	g1 = zeros(size(p1));
	g2 = zeros(size(p1));
	g3 = zeros(size(p1));
else
	en12 = e12 / l12;
	en23 = e23 / l23;
	en31 = e31 / l31;

	p1 = e31 - dot(e31, en23) * en23;
	p2 = e12 - dot(e12, en31) * en31;
	p3 = e23 - dot(e23, en12) * en12;

	g1 = p1 / dot(p1, p1);
	g2 = p2 / dot(p2, p2);
	g3 = p3 / dot(p3, p3);
end


end
