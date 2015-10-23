require "sinatra"
require "sinatra/reloader"

require_relative ("lib/online_calculator.rb")
new_calc = Calculator.new("number1","number2")

get "/" do
	@title = "Welcome to Online Calculator!"
	erb(:homepage)
end

get "/add" do
	erb(:add)
end

get "/subtract" do
	erb(:subtract)
end

get "/divide" do
	erb(:divide)
end

get "/multiply" do
	erb(:multiply)
end

post "/calculate_subtract" do
end

post "/calculate_multiply" do
end

post "/calculate_divide" do
end




#@add = new_calc.add() -- this should go in post

post "/calculate_add" do
	first = params[:first_number].to_f
	second = params[:second_number].to_f
	result = first + second
	"#{first} + #{second} = #{result}"
end
