require "pry"

class StringCalculator

def add(string)
	string.split("\n").map(&:to_i).reduce(0,:+)
end

# 	split_numbers = string.split(",")
# 	number_array = split_numbers.map do |string_number|
# 		string_number.to_i
# 	end
# 	returned = number_array.reduce(0,:+).to_s
# 	puts returned
# end
def test(condition,result)
	if condition == expected_result
		puts "YAY!"
	else
		puts "oh :("

	end
end

str = StringCalculator.new
str_add = str.add("1\n2\n3")
test(StringCalculator.new)

Rspec.describe "StringCalculator" do 