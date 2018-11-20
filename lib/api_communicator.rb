require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # response_hash returns a Hash
  # response_hash["results"] returns an array
film_array=[]

response_hash["results"].each do |character|
    if character["name"].downcase == character_name
      film_array << character["films"]
    end
  end

film_array = film_array.flatten
  # character name is found in that array ([0] = "Luke Skywalker")
  # if that array value name == character_name
  # return results_hash["results"][0]["films"]
  # That will return an array along the lines of "https://www.swapi.co/api/films/7/"
  # i.e. a value on swapi for a Star Wars movie
  # Take that array and use RestClient.get('array_value[1..x]' to return movie titles.]

  print_movies(film_array)



  # movie_string = RestClient.get("https://www.swapi.co/api/films/7/")
  # movie_hash = JSON.parse(movie_string)

  #binding.pry

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end


def print_movies(films)
  binding.pry
  film_strings = []
  film_hashes = []

  films.each do |movie|
    film_strings << RestClient.get(movie)
  end

   film_strings.each do |strings|
     film_hashes << JSON.parse(strings)
   end

  film_hashes

  film_hashes.each_with_index do |movies, x|
    puts "#{x+1}. " + movies["title"]
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
