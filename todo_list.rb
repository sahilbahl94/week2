require "RSpec"
require "pry"

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

class TodoList
	attr_accessor :tasks
		
	def initialize(user = "Josh")
		@tasks = []
		@user = user
	end

	def add_task(task)
		@tasks.push(task)
	end

	def delete_task(id)
		@tasks.delete_if {|task| task.id == id}
	end

	def find_task_by_id(id)
		chosen_task = []
		@tasks.each do |task| 
			if task.id == id
				chosen_task.push(task)
			else 
				chosen_task = nil
			end
		end
		chosen_task
	end

	def sort_by_created
		sorted_tasks = @tasks.sort { |task1,task2| task2.created_at <=> task1.created_at}
	end
	
end

RSpec.describe "Task" do 
	
	before :each do 
		@task = Task.new("Buy the milk")
	end

    it "returns the default value for every task" do
      	expect(@task.complete?).to eq(false)
    end

    it "returns the complete attribute to be true" do 
    	expect(@task.complete!).to eq(true)
    end

    it "makes a completed task incomplete" do 
    	expect(@task.make_incomplete!).to eq(false)
    end

    it "updates the old content with the new one" do
    	expect(@task.update_content!("Buy the dog")).to eq("Buy the dog")
    end
end

RSpec.describe "TodoList" do 
	before :each do 
		@task1 = Task.new("Buy the milk")
		@task2 = Task.new("Wash the car")
		@task3 = Task.new("Buy headphones")
		@task4 = Task.new("Get a haircut")
		@newlist = TodoList.new
	
	end

	it "should add each task to an array of tasks" do
		expect(@newlist.add_task(@task1)).to match_array([@task1])
		expect(@newlist.add_task(@task2)).to match_array([@task1,@task2])
	end

	it "should delete a task by its id number" do 
		@newlist.add_task(@task1)
		@newlist.add_task(@task2)
		@newlist.add_task(@task3)
		@newlist.add_task(@task4)
		expect(@newlist.delete_task(9)).to match_array([@task2,@task3,@task4])
	end

	it "finds a task by id and returns it in a new array" do 
		expect(@newlist.find_task_by_id(9)).to match_array([@task1])
	end

end



