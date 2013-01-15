# /05_silly_blocks/silly_blocks.rb

# returns the input block with each word reversed
def reverser 
	words = yield
	words.split.map {|word| word.reverse}.join(" ") # figured out that map yield  the result as an array.
end

# default of 1, adds n to input block
def adder(n = 1)
	num = yield
	num += n
end

# default argument of 1, repeats the bock n times
def repeater(n = 1)
	n.times do
		yield
	end
end