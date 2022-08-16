function s_in = make_c (m, n)

s_in = zeros(n);

for i=1:n
    for j=1:n
        s_in(i,j) = m(i)*m(j);
    end
end