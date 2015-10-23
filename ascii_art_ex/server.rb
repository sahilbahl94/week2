require "sinatra"
require "sinatra/reloader"

require_relative ("lib/make_art.rb")

get "/ascii/?:word?/?:font?" do
	@title = "ASCII Art"
	@display = make_cool(params[:word] || "Hello" ,params[:font])
	erb(:word)
end

get "/ascii/baboon/special/secret" do
	@title = "ASCII Art"
	erb(:secret)
end

