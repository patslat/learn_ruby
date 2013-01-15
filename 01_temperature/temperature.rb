# /01_temperature/temperature.rb

def ftoc(f)
	(f.to_f - 32) * (5.0 / 9.0) # convert to float and apply formula
end

def ctof(c)
	c.to_f * (9.0 / 5.0) + 32 # convert to float and apply formula
end