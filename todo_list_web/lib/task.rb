class Task

	attr_accessor :id, :content, :created_at
	@@current_id = 1
	
	def initialize(content, updated_at = nil, created_at = Time.now, complete = false)
		@updated_at = updated_at
		@created_at = created_at
		@complete = complete
		@content = content
		@id = @@current_id
		@@current_id += 1
	end

	def complete?
		@complete
	end

	def complete!
		@complete = true 
	end

	def make_incomplete!
		var = false
		var != complete!
		return var
	end

	def update_content!(new_content)
		@updated_at = Time.now
		@content = new_content
		@content
	end
end
