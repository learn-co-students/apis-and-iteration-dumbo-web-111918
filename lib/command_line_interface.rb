def welcome
  puts "Hello! Itching to know which movies you favorite StarWars characters is in? Give a name and find out!"
end

def get_character_from_user
  puts "Please enter a character name"
  character = gets.chomp
  character.capitalize!
  # use gets to capture the user's input. This method should return that input, downcased.
end


