# /03_simon_says/simon_says.rb

def echo(words) # should return the input
	words
end

def shout(words) # should return the input in all caps
	words.upcase
end

def repeat(words, n = 2) # 1 arg should repeat input twice, else repeat n times
	x = (words + " ") * n
	x.rstrip # return the string with the last space stripped
end

def start_of_word(word, n) # should return the first n letters of word
	word[0..(n-1)]
end

def first_word(str) # should return the first word in a string
	str.slice(/^\w+/)
end

def titleize(str) # should return string with the first word and all subsequent non-little words capitalized
	title = str.split
	title[0].capitalize!
	little_words = [ "a", "an", "and", "at", "but", "by", "for", "in", "nor", "of", "on", "or", "so", "the", "to", "up", "yet", "over"] # according to Associated Press style. I added 'over' because it is in the test - but in this case not-so-little words like 'between' should also remain lowercase 
	title.each do |word|
		word.capitalize! unless little_words.include?(word)
	end
	title.join(" ")
end
