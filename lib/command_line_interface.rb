def welcome
  # puts out a welcome message here!
  system "Clear"
  puts "YO! You Star Wars fan too? Nice!"
  puts "I am Joel, you know... like Siri or Alexa and I am the legit Start Wars bible... Yo!"
  puts "Come on! try me! Ask me anything"
  puts ""
end

def get_user_input
  response_array = Array.new
  puts "Do you want know about a Start Wars film, or character?"
  # use gets to capture the user's input. This method should return that input, downcased.
  user_selection = gets.chomp
  case user_selection
  when "film"
    puts "Which film?"
    film = gets.chomp
    response_array = ["film", film]
    return response_array
    # return gets.chomp
  when "character"
    puts "Which character?"
    character = gets.chomp
    response_array = ["character", character]
    return response_array
    # return gets.chomp
  else
    puts "What!? hmmm Let's try again."
  end
end
