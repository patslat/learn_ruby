# 02_calculator/calculator.rb

def add(x, y)
	x + y
end

def subtract(x, y)
	x - y
end

def sum(arr)
	arr.inject(0) { |sum, num| sum + num }
end

def multiply(*nums)
	nums.inject(1) { |product, num| product * num }
end

def power(base, exp)
	base ** exp
end

def factorial(n)
	if n == 0
		1
	else 
		n * factorial(n-1)
	end
end