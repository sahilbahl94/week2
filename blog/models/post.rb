require "pry"

class Post
	attr_accessor :title, :content, :date, :id, :category, :author

	@@current_id = 1

	def initialize(title,content,category = "general" ,author = "anonymous" ,date = Time.now)
		@title = title 
		@date = date
		@category = category
		@author = author
		@content = content
		@id = @@current_id
		@@current_id += 1
	end
end

class SponsoredPost < Post
	
	def initialize(title,content,category = "general" ,author = "anonymous" ,date = Time.now)
		@title = "***#{title}***" 
		@date = date
		@category = category
		@author = author
		@content = content
		@id = @@current_id
		@@current_id += 1
	end
end

