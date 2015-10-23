require "rspec"
require "./task.rb"
require "./todolist.rb"

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



