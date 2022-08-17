User.create(email: 'david@site.com', name: 'david', password: 'password', password_confirmation: 'password', role: :admin)
User.create(email: 'james@site.com', name: 'james', password: 'password', password_confirmation: 'password')
User.create(email: 'sally@site.com', name: 'sally', password: 'password', password_confirmation: 'password', role: :moderator)

10.times do
  Post.create(
    title: "Post #{Faker::Lorem.words(number: rand(1..3)).join(' ')}",
    body: "#{Faker::Lorem.sentences(number: 8).join("<br />")}",
    views: 0,
    user: User.all.sample)
end
