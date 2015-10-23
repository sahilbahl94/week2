require "RSpec"

class StringCalculator

def add(string)
#	string.split("\n").map(&:to_i).reduce(0,:+)
#end

	split_numbers = string.split("\n")
	number_array = split_numbers.map do |string_number|
		string_number.to_i
	end
	reduced = number_array.reduce(0,:+)
	reduced
end

# def test(condition,result)
# 	if condition == expected_result
# 		puts "YAY!"
# 	else
# 		puts "oh :("
# 	end
# end

end


str = StringCalculator.new
str_add = str.add("1\n2\n3")

RSpec.describe "StringCalculator" do 
	it "returns 6 for a list of 3 numbers 1,2,3, separated by a new line" do
		expect(StringCalculator.new.add("1\n2\n3")).to eq(6)
	end
end
