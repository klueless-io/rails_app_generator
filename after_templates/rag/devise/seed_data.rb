
david = User.create(email: 'david@site.com', name: 'david', password: 'password')
bob = User.create(email: 'bob@site.com', name: 'bob', password: 'password')
lisa = User.create(email: 'lisa@site.com', name: 'lisa', password: 'password')

10.times do |i|
  Post.create(title: "Post #{i}", body: "This is the body of post #{i}", user: User.all.sample)
end  