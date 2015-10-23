require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require 'rspec'


require_relative './spec/blog_spec'
require_relative './models/blog'
require_relative './models/post'

blog =Blog.new
blog.add_post(Post.new("Ironhack", "WebDev Bootcamp" ))
blog.add_post(Post.new("High Dive", "Cliff-jumping" ))
blog.add_post(Post.new("Surfboard", "Randomtext1" ))
blog.add_post(Post.new("Circles", "Machine heart" ))
blog.add_post(Post.new("That's what she said", "Ahem ahem" ))
blog.add_post(Post.new("Acoustic Melody", "Chill" ))

get "/" do
	@posts = blog.order_posts
	@title = "Welcome to your blog page!"
	erb(:home)
end

get "/post/:id" do
	@id = params[:id].to_i
	@newpost = blog.find_post_by_id(@id)
	erb(:post_details)
end

get "/create_post" do 
	erb(:new_post)
end

post "/new_post" do 
	@new_stuff = Post.new(params[:title],params[:content],params[:category],params[:author])
	blog.add_post(@new_stuff)
	redirect "/"
end