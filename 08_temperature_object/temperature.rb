# /08_temperature_object/temperature.rb
# fails when trying to call the methods from_celsius and from_fahrenheit because no object is initialized to access in_x
# from_x methods need to build the class, is that what 'Factory Method' means?

# why can't Celsius.new(50) call .from_celsius(50) and work?!

class Temperature
	attr_accessor :in_celsius, :in_fahrenheit
	def initialize(options = {})
		if options[:c]
			@in_celsius = options[:c]
			@in_fahrenheit = Temperature.ctof(options[:c])
		elsif options[:f]
			@in_celsius = Temperature.ftoc(options[:f])
			@in_fahrenheit = options[:f]
		end
	end

	def self.from_celsius(temp)
		Temperature.new(:c => temp)
	end

	def self.from_fahrenheit(temp)
	    Temperature.new(:f => temp)
	end

	def self.ctof(temp)
		temp.to_f * (9.0 / 5.0) + 32.0
	end

	def self.ftoc(temp)
		(temp.to_f - 32.0) * (5.0 / 9.0)
	end
end

# I had to look this up after struggling for a very long time
class Celsius < Temperature
	def initialize(temp)
		super(:c => temp)
	end
end

class Fahrenheit < Temperature
	def initialize(temp)
		super(:f => temp)
	end
end