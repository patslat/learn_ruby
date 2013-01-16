# /10_timer/timer.rb

class Timer
	attr_accessor :seconds
	def initialize
		@hours = 00
		@mins = 00
		@seconds = 00
	end

	def seconds=(seconds)
		@hours = seconds / 3600
		@mins = (seconds % 3600) / 60
		@seconds = (seconds % 3600) % 60
	end

	def time_string
		padded(@hours) + ":" + padded(@mins) + ":" + padded(@seconds)
	end

	def padded(num)
		num.to_s.rjust(2, "0")
	end
end