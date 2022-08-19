105.times do |i|
  Post.create(title: "Post #{i}", body: Faker::Lorem.words(number: 5).join(' '), order: i)
end
