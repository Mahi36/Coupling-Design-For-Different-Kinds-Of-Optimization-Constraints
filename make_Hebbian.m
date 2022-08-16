function s_hebbian = make_Hebbian(keys, n)

size_keys = size(keys);
m = size_keys(2);

s_hebbian = zeros(n);
for i = 1:n
    for j = 1:n
        sum = 0;
        for k = 1:m
            prod = keys(i,k)*keys(j,k);
            sum = sum + prod;
        end
        s_hebbian(i,j) = sum;
    end
end

s_hebbian = s_hebbian/n;