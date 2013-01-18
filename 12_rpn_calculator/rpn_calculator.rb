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

	def tokens(str)
		str.split.map do |chr|
			if chr =~ /[+\-*\/]/
				chr.to_sym
			else
				chr.to_i
			end
		end
	end

	def evaluate(str)
		operator_tokens = [:+, :-, :*, :/]
		eval = tokens(str)
		eval.each do |token|
			if operator_tokens.include?(token)
				case token
				when :+
					self.plus
				when :-
					self.minus
				when :*
					self.times
				when :/
					self.divide
				end
			else
				push(token)
			end
		end
		self.value
	end
end