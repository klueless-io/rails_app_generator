# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# User.find_or_create_by(email: "admin@admin.com") do |user|
#   user.name = 'Admin'
#   user.password = 'password'
#   user.admin = true
# end

# david = User.create(email: 'david@site.com', name: 'david', password: 'password')
# bob   = User.create(email: 'bob@site.com', name: 'bob', password: 'password')
# lisa  = User.create(email: 'lisa@site.com', name: 'lisa', password: 'password')

10.times do |i|
  Post.create(title: "Post #{i}", body: "This is the body of post #{i}")
end
