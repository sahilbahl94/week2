require "sinatra"
require "sinatra/reloader"

get "/" do
	"My First Sinatra App"	
end

get "/about" do
	erb(:about)
end

get "/hi" do
	@greeting = "Hello World!"
	erb(:hi)
end

get "/time" do
	@current_time = Time.now
	@cats_list = ["cat1", "cat2", "cat3"]
	erb(:time)
end

get "/hoursago/:time_diff/:tense" do
	@hours = params[:time_diff]
	case params[:tense]
	when "ago"
		@time_past = (Time.now - @hours.to_i*60*60)
		erb(:hoursago)
	when "ahead"
		@time_future = (Time.now + @hours.to_i*60*60)
		erb(:hours_ahead)
	end
end