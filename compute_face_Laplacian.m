function L = compute_face_Laplacian(pos, fring)
% L must be normalized for filtering

nf = size(fring, 2);
i = zeros(1, 4*nf);
j = zeros(1, 4*nf);
s = zeros(1, 4*nf);

weight = zeros(3, 1);
for k = 1:nf	
	for h = 1:3
		k1 = fring{k}(h);
		dp = pos(:, k1) - pos(:, k);
		weight(h) = 1 / (dp'*dp)^0.5;
    end
    weight = weight / sum(weight);
    
    j(4*k-3 : 4*k) = k;
	i(4*k-3 : 4*k) = [fring{k}, k];
	s(4*k-3 : 4*k) = [-weight, 1];
end

L = sparse(i, j, s);
end
    