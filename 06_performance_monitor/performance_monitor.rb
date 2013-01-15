# /06_performance_monitor/performance_monitor.rb

require "time"

# measure average time to execute block n times with a default n of 1
def measure(n = 1)
	run_times = Array.new
	n.times do
		start_time = Time.now
		yield
		run_times << (Time.now - start_time)
	end	
	run_times.inject(0.0) {|sum, num| sum + num } / run_times.length.to_f
end