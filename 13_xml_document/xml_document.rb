# /13_xml_document/xml_document.rb

class XmlDocument
	def initialize(indent = false)
		if indent
			@indent = true
			@level = 0
		end
	end

	def method_missing(method_name, arg = {})
		doc = ''
		if block_given?

			if @indent
				@level.times {doc = doc + "  "}
			end

			doc = doc + "<#{method_name}>"

			if @indent
				@level += 1
				doc = doc + "\n"
			end

			doc = doc + yield

			if @indent
				@level -= 1
				print "\n"
				@level.times {doc = doc + "  "}
			end

			doc = doc + "</#{method_name}>"

			if @indent
				doc = doc + "\n"
			end

		elsif !arg.empty?

			if @indent
				@level.times {doc = doc + "  "}
				@level += 1
			end

			doc = doc + "<#{method_name} #{arg.keys[0]}='#{arg.values[0]}'/>"

			if @indent
				doc = doc + "\n"
				@level -= 1
			end
		else
			if @indent
				@level.times {print "  "}
			end
			doc = doc + "<#{method_name}/>"
		end

		doc
	end
end