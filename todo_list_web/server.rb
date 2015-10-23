require 'sinatra'
require 'sinatra/reloader'

require_relative('./lib/task.rb')
require_relative('./lib/todolist.rb')

todo_list = TodoList.new("Josh")
todo_list.load_tasks

get "/tasks" do
	@title = "Welcome to the TodoList"
	@return_array = todo_list.tasks
	erb(:task_index)
end

get "/new_task" do
	@title = "Add New Task"
	erb(:new_task)
end

post "/create_task" do
	@new_task = Task.new(params[:content])
	todo_list.add_task(@new_task)
	todo_list.save
	todo_list.load_tasks
	redirect "/tasks"
end

post "/complete/:id" do
	task = todo_list.find_task_by_id(params[:id].to_i)
	task.complete!
	todo_list.save
	redirect "/tasks"
end
