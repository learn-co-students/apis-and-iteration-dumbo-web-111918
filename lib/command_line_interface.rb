def welcome
  # puts out a welcome message here!
  puts "Hey wanna learn whos in what movie?"
end

def get_character_from_user
  puts "Please enter a character name"
character = gets.chomp
character.capitalize!
  # use gets to capture the user's input. This method should return that input, downcased.
end
