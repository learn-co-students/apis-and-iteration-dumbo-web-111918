require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string.body)
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
    characters = response_hash["results"]
      my_character = characters.find do |character_hash|
        character_hash["name"] == character_name
      end
    movies = my_character["films"].collect do |movie|
        # I want to find the character that matches my character_name
#           character_hash["films"].collect do |movie|
# # collect those film API urls, make a web request to each URL to get the info
# #  for that film
      # new_arr = []
      site_string = RestClient.get("#{movie}")
      movie_title = JSON.parse(site_string.body)
      # new_arr.push(movie_title)
      # binding.pry
# #      binding.pry
#    # end
   end
end








# puts site_hash
#response_hash["results"].each do |character|
#  if character_name == character
#  puts "name: #{character[:films]}"


  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.




def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each do |movies|
    puts movies["title"] 
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
#  binding.pry
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
