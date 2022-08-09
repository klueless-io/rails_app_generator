class HomeController < ApplicationController
  def index
     # badly formatted code that will be picked up by RuboCop

    # rubocop -A --config .rubocop.yml
    # will not resolve this issue, you need to manually fix it
    a = 1

   person1 = 'John'
   person2 = 'Jane'
   person3 = 'Jack'
   person4 = 'Jill'

   people = [person1, person2, person3, person4]

   puts people if people.length > 0
 end

 def some_action
 end
end
