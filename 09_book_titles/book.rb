# /09_book_titles/book.rb

class Book
	attr_accessor :title
	def title=(title)
		@title = titleize(title)
	end

# titleize should capitalize the first word no matter what
# titleize should capitalize all words except
# 	articles (the, a, an), conjunctions < four letters (and, but, or), prepositions (at, of, on, in, to, with)
	def titleize(title)
		leave_lower = ["the", "a", "an", "and", "but", "or", "at", "of", "on", "in", "to", "with"]

		title.capitalize!

		title.split.each do |word|
			word.capitalize! unless leave_lower.include?(word)
		end.join(" ")
	end
end