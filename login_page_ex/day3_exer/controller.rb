require "sinatra"
require "sinatra/reloader"
require "pry"


enable(:sessions)

users = { "sahil" => "hello", "bahl" => "world"}


get "/login" do
	erb(:login_page)
end

post "/check_password" do
	users.each do |user, pass|
		if  params[:user_name] == user && params[:password] == pass  
			session[:logged_in] = true
			redirect "/profile"
		else
			redirect "/login"
		end
	end
end

get "/profile" do
	erb(:profile)
end 

get "/logout" do
	session[:logged_in] = false
	redirect "/login"
end


