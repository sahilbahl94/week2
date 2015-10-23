require "RSpec"

class Fizzbuzz
	attr_accessor :numbers
	def initialize
		@numbers = []
	end

	def play
		@numbers = (1..100).to_a
		@numbers.each do |number|
		 	if number % 3 == 0
		 		 @numbers[number -1] = "Fizz"
		 	else
		 		number
		 	end
		 end
	end

	# def play_one_number(number)
	#  	if number % 3 == 0
	#  		 numbers[number -1] = "Fizz"
	#  	else
	#  		number.to_s
	#  	end
	# end
end

# newgame = Fizzbuzz.new
# newgame.play

RSpec.describe "Fizzbuzz" do 
	before :each do 
		@fizzbuzz = Fizzbuzz.new 
		@fizzbuzz.play
	end

	# it "returns 1 (first number of array)" do 
	# 	expect(@fizzbuzz.play).to eq(numbers[0])
	# end

	it "returns Fizz for every number within the array that is divisible by 3" do
		expect(@fizzbuzz.numbers[2]).to eq("Fizz")
	end
end