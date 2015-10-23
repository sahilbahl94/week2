require 'rspec'
require 'pry'
require_relative '../models/blog.rb'
require_relative '../models/post.rb'



RSpec.describe "Blog" do

	let(:blog) {blog = Blog.new}
	

	it "should add the post to an array" do
		@post = Post.new("Title1","Content2")
		@post2 = Post.new("Title2", "Content3")
		expect(blog.add_post(@post)).to eq([@post])
		expect(blog.add_post(@post2)).to eq([@post,@post2])
	end

	it "should order posts by time created" do
		@post = Post.new("Title1","Content2")
		@post2 = Post.new("Title2", "Content3")
		blog.add_post(@post)
		blog.add_post(@post2)
		expect(blog.order_posts).to eq([@post2,@post])
	end

	it "should find post by id" do 
		@post = Post.new("Title1","Content2")
		@post2 = Post.new("Title2", "Content3")
		blog.add_post(@post)
		blog.add_post(@post2)
		expect(blog.find_post_by_id(5)).to match(@post)
	end

	it "should give the length of posts" do
		@post = Post.new("Title1","Content2")
		@post2 = Post.new("Title2", "Content3")
		blog.add_post(@post)
		blog.add_post(@post2)
		expect(blog.number_of_posts).to eq(2)
	end

	it "should delete the post by its id" do
		@post = Post.new("Title1","Content2")
		@post2 = Post.new("Title2", "Content3")
		blog.add_post(@post)
		blog.add_post(@post2)
		expect(blog.delete_post(9)).to match([@post2])
	end

end
