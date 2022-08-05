# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# User.find_or_create_by(email: "admin@admin.com") do |user|
#   user.name = 'Admin'
#   user.password = 'password'
#   user.admin = true
# end

flavours = %w[Blueberry Strawberry Banana Raspberry Apple Grape]
50.times do
  Yogurt.create(flavour: flavours.sample)
end
50.times do
  person = Person.create(name: Faker::Name.name)
  person.update!(updated_at: Faker::Date.between(from: 20.days.ago, to: Date.today))
end
