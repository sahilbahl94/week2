require "artii"

def make_cool(word, font = 'slant')
		case font 
		when nil 
			font = 'slant'
		end
		
		str = Artii::Base.new :font => font
		str.asciify(word)
end

