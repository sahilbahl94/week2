require "RSpec"
require "pry"

class Lexi 

	def eat_t(string)
		result = string.downcase.gsub("t", "")
		result
	end

	def shazam(string)
		array = string.split(" ")
		newarray = []
		array.each do |word|
			newarray << word.reverse
		end
		final_array = []
		final_array << newarray.first 
		final_array << newarray.last
		final_array.each do |word|
			eat_t(word)
		end
	end

	def oomp(string)
		array = string.downcase.split(" ")
		newarray = array.select  {|word| word.length <= 3}
		newarray.each do |word| 
			eat_t(word)
		end
	end
end


RSpec.describe "eat_t" do 
	
	before :each do 
		@lexi = Lexi.new
	end

    it "removes every letter t from the input" do
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end

    it "ends up returning only the first and last words without t's" do 
    	expect(@lexi.shazam("This is a boring test")).to eq(["sihT", "tset"])
    end

    it "selects an array containing words that are three characters or less" do 
    	expect(@lexi.oomp("tIf you wanna be ty lover")).to eq(["if", "you", "be", "y"])
    end

end
