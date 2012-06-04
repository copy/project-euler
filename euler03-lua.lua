#!/usr/bin/lua

n = 600851475143
i = 2

while true do
	while n % i == 0 do
		n = n / i
	end
	if n == 1 then
		break
	end
	i = i + 1
end

print(i)
