function [ kring ] = compute_k_ring( ring, k )
%COMPUTE_K_RING compute kring

if k<1, return; end

n = size(ring, 2);
s = zeros(n, 1);
kring = ring;
for r = 2:k
    for i = 1:n
        % set flag
        flag = ones(n, 1);
        flag(kring{i}) = 0;
        
        % set loop range
        s1 = s(i)+1;
        s2 = size(kring{i}, 2);
        s(i) = s2;
        
        % get r ring
        for j = kring{i}(s1:s2)
            for m = ring{j}
                if flag(m) && m ~= i
                    flag(m) = 0;
                    kring{i} = [kring{i} m];
                end
            end
        end
        
    end
end
    
end

