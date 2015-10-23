require 'rspec'

require_relative 'password_checker'


RSpec.describe "password" do
	let(:checker) {PasswordChecker.new}

	it "should have minimum 7 characters" do
		expect(checker.condition_length("ironhack")).to eq(true)
	end

	it "should have symbols, numbers and letters and at least one of each" do
		expect(checker.condition_type("ironHack%£43")).to be_truthy
	end

	it "should have at least one uppercase or lowercase letter" do
		expect(checker.condition_case("ironHack%£43")).to be_truthy
	end

	it "first: should not include the name or domain name of the user's email address" do 
		expect(checker.condition_match("sahil@gmail.com","ironHahil%£43")).to be_truthy
	end

	it "second: should fucking not include the name or domain name of the user's email address" do 
		expect(checker.condition_match("sahil@gmail.com","ironHsahil%£43")).to eq(false)
	end

	it "first: should match all conditions" do
		expect(checker.check_password("sahil@gmail.com","ironHahil%£43")).to eq(true)
	end

	it "first: should match all conditions" do
		expect(checker.check_password("sahil@gmail.com","ironHsahil%£43")).to eq(false)
	end
end