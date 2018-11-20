require 'rest-client'
require 'json'
require 'pry'

def url_stuff
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  #binding.pry
end
#-------------------------------------------------------------------------------
# GET CHARACTERS FROM API
#-------------------------------------------------------------------------------
def get_characters()
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
end
#-------------------------------------------------------------------------------
# GET MOVIES FROM by SEARCHING CHARACTER NAME API
#-------------------------------------------------------------------------------

# def get_characters(name)
#   response_string = RestClient.get("http://www.swapi.co/api/people/?search=#{name}")
#   response_hash = JSON.parse(response_string)
#   # binding.pry
# end

#-------------------------------------------------------------------------------
# GET MOVIES FROM CHARACTERS
#-------------------------------------------------------------------------------
def get_character_movies_from_api(character_name)

  characters = get_characters()['results']
  # binding.pry
  films = []
  characters.each do |character|
    if character['name'].upcase.include?(character_name.upcase)
      films = character["films"]
    end
  end

  film_hash = {}
  films.each do |film|
    film_resp = RestClient.get(film)
    film_hash[film] = JSON.parse(film_resp.body)
  end
  film_hash

end

# binding.pry

def print_movies(films)
  film_names = []
  films.each do |k, v|
    film_names << v["title"]
  end
  puts film_names
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)

  if films.size < 1
    puts "These aren't the droids you're looking for"
  else
    print_movies(films)
  end
end

# binding.pry
## BONUS ------------------------------------------------------------------------\

def show_movie_crawl
  puts "please enter a movie"
  ans = gets.chomp
  ans
end

def get_movies()
  response_string = RestClient.get('http://www.swapi.co/api/films/')
  response_hash = JSON.parse(response_string)
end

def get_movie_crawl_from_api(movie_name)

  movies = get_movies['results']
  starwars = nil
  movies.map do |movie|
    if movie['title'].upcase.include?(movie_name.upcase)
      starwars = movie['opening_crawl']
      # binding.pry
    end
    starwars
  end
  starwars
  # binding.pry
end

# binding.pry

def show_movie_crawl(movie)
  crawl = get_movie_crawl_from_api(movie)
  # binding.pry
  if crawl == nil
    puts "I bet you like sand"
  else
    puts crawl
  end
end



# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
