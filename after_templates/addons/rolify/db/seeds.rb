david = User.create(email: 'david@site.com', name: 'david', password: 'password', password_confirmation: 'password')
james = User.create(email: 'james@site.com', name: 'james', password: 'password', password_confirmation: 'password')
sally = User.create(email: 'sally@site.com', name: 'sally', password: 'password', password_confirmation: 'password')
chloe = User.create(email: 'chloe@site.com', name: 'chloe', password: 'password', password_confirmation: 'password')

david.add_role(:super_user)
james.add_role(:admin)
sally.add_role(:moderator)
chloe.add_role(:admin)
chloe.add_role(:moderator)

10.times do
  user = User.all.sample
  post = Post.create(
    title: "Post #{Faker::Lorem.words(number: rand(1..3)).join(' ')}",
    body: "#{Faker::Lorem.sentences(number: 8).join("<br />")}"
  )
  user.add_role(:author, post)
end
