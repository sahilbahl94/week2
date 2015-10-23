require_relative './post'

class Blog

	attr_reader :posts
	def initialize
		@posts = []
	end

	def add_post(post)
		@posts << post
	end

	def order_posts
		@posts.sort!{|post1,post2| post2.date <=> post1.date}
	end

	def find_post_by_id(id)
		@posts.find do |post|
			post.id == id
		end
	end

	def number_of_posts
		@posts.length
	end

	def delete_post(id)
		@posts.delete_if { |post| post.id == id}
	end

end


