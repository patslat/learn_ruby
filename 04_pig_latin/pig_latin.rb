# /04_pig_latin/pig_latin.rb

def translate(str)
	# check if capitalized
	def is_capitalized?
		return true if self == self.capitalize
	end

	# check if punctuated
	def is_punctuated?
		return true if self[self.length-1] =~ /[\.|,|?|!]/
	end

	# where the magic happens
	def pig(word)
		# check if original is capitalized, downcase! and remember for later
		if word.is_capitalized?
			word.downcase!
			was_capitalized = true
		end
		# check if original is punctuated, chop it off and save it for later
		if word.is_punctuated?
			punctuation = word.slice!(-1)
			was_punctuated = true
		end

		# check if there are non-vowel chars at the beginning
		if word.slice(/^[^aeiouy]+/) == nil
			first_consonants = Array.new
		elsif word.slice(/^[^aeiouy]+/)[-1] == "q" # special case, 'qu'
			first_consonants = word.slice(/^[^aeioy]+/)
		else first_consonants = word.slice(/^[^aeiouy]+/)
		end

		# if no consonants, add "ay ", else apply pig latin formula
		if first_consonants.empty?
			pigword = word + "ay "
		else
			pigword = word[/[^#{first_consonants}]+/] + first_consonants + "ay "
		end

		# re-capitalize
		if was_capitalized
			pigword.capitalize!
		end
		# re-punctuate
		if was_punctuated
			pigword.insert(-2, punctuation)
		end
		return pigword
	end

	# pigify each word in the input string, rstrip the last space
	str.split.inject("") do |translated, word|
			translated + pig(word)
	end.rstrip
end