require 'pry'
def welcome
  # puts out a welcome message here!
  puts "Welcome, what would you like to know, young Padawan?"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  character = gets.chomp
end
