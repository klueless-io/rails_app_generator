# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# User.find_or_create_by(email: "admin@admin.com") do |user|
#   user.name = 'Admin'
#   user.password = 'password'
#   user.admin = true
# end

people = TodoList.create(name: 'people')
jobs   = TodoList.create(name: 'jobs')
# lisa  = User.create(email: 'lisa@site.com', name: 'lisa', password: 'password')

5.times do |i|
  TodoItem.create(todo_list: people, task: "Person Name #{i}", position: i)
  TodoItem.create(todo_list: jobs  , task: "Profession #{i}", position: i)
end
