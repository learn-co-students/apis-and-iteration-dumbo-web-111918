def welcome
  # puts out a welcome message here!
  puts "In a galaxy far far away......" + ("." * 100)
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  ans = gets.chomp
  ans
end
