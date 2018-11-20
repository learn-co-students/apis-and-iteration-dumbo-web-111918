def welcome
  "Hey there! welcome to the StarWars Film lookup"
end

def get_character_from_user
  puts "Please enter your search"
  gets.chomp
  # use gets to capture the user's input. This method should return that input, downcased.
end

def get_type
  puts "What would you like to search? You can type people, species, planets."
  gets.chomp
  # use gets to capture the user's input. This method should return that input, downcased.
end
