require 'sinatra'
require 'sinatra/reloader'
require_relative './models/password_checker'


enable(:sessions)

new_user = PasswordChecker.new

get "/" do
	erb(:home)
end

post "/form" do
	if new_user.check_password(params[:email],params[:password]) == true
	session[:logged_in] = true
	redirect ("/congratulations")
	else
	redirect ("/")
	end
end

get "/congratulations" do
	if session[:logged_in] == true
		erb(:congrats)
	else
		redirect ("/")
	end
end
