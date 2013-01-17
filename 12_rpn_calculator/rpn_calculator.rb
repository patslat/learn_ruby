# /12_rpn_calculator/rpn_calculator.rb

# RPNCalculator will implement a stack data structure
# the user will push numbers onto the stack
# when the user calls an operation, it performs it on the preceding numbers
# should be able to tokenize a str, and evaluate it

class RPNCalculator

	def initialize
		@stack = []
	end

	def push(val)
		@stack << val
	end

	def plus
		if @stack.empty? 
			raise "calculator is empty"
		else
			@stack << @stack.pop + @stack.pop
		end
	end

	def minus
		if @stack.empty? 
			raise "calculator is empty"
		else
			@stack << @stack.pop - @stack.pop
		end
	end

	def times
		if @stack.empty? 
			raise "calculator is empty"
		else
			@stack << @stack.pop * @stack.pop
		end
	end

	def divide
		if @stack.empty? 
			raise "calculator is empty"
		else
			@stack << @stack.pop.to_f / @stack.pop.to_f
		end
	end

	def value
		@stack[-1]
	end
end

calculator = RPNCalculator.new
p calculator.push(2)
p calculator.push(3)
p calculator.push(4)
p calculator.plus
p calculator.plus

p calculator.value