require "./task.rb"
require "./todolist.rb"

todo_list = TodoList.new("Josh")
todo_list.add_task(Task.new("Walk the dog"))
todo_list.add_task(Task.new("Buy the milk"))
todo_list.add_task(Task.new("Save the cows"))

todo_list.save

todo_list = TodoList.new("Josh")
todo_list.load_tasks
todo_list.tasks.length
