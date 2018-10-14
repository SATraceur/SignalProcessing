function d = odd(value)

d = (fix(value./2).*2) - value;
dix = find(d ~= 0);
d(dix) = ones(size(dix));