# /11_dictionary/dictionary.rb

class Dictionary
	attr_accessor :entries
	def initialize
		@entries = Hash.new
	end

	def add(entry = {})
		if entry.class != Hash
			@entries.merge!({entry => nil}) 
		else 
			@entries.merge!(entry)
		end
	end

	def entries
		@entries
	end

	def keywords
		@entries.keys.sort
	end

	def include?(key)
		true if @entries.keys.include?(key)
	end

	def find(str)
		match_key_value_pairs = []
		@entries.each do |key, val|
			if key =~ /#{str}/
				match_key_value_pairs << [key, val]
			end
		end
		Hash[match_key_value_pairs]
	end

	def printable
		defs = ""
		@entries.sort.each do |key, val|
			defs = defs + "[#{key}] \"#{val}\"\n"
		end
		defs.chomp
	end
end