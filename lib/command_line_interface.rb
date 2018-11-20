def welcome
  # puts out a welcome message here!
  puts "In a galaxy far far away......" + ("*     " * 1000)
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  ans = gets.chomp
  ans
end

def get_movie_from_user
  puts "please enter a movie"
  ans = gets.chomp.to_s
  ans
  # binding.pry
end

def ask_user_for_mov_or_char
  puts "Movie Crawl or Character?"
  ans = gets.chomp

  if ans.upcase == "MOVIE CRAWL"
    movie = get_movie_from_user
    # binding.pry
    show_movie_crawl(movie)
    # binding.pry
  elsif ans.upcase == "CHARACTER"
    character = get_character_from_user
    show_character_movies(character)
  else
    puts "INVALID COMMAND, TRY AGAIN"
  end

end
