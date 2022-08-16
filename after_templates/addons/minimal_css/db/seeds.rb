# scaffold('people', 'first_name', 'last_name', 'age:integer', 'address:text')

20.times do |i|
  Person.create(first_name: "First #{i}", last_name: "Last #{i}", age: i, address: Faker::Address.full_address)
end
