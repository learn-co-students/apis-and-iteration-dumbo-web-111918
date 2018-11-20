require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name, type)
  #make the web request
  arr = []
  response_string = RestClient.get("http://www.swapi.co/api/#{type}/?search=#{character_name}")
  response_hash = JSON.parse(response_string)
  if response_hash["count"] != 0
    puts response_hash["results"][0]["name"]
    response_hash["results"][0]["films"].each do |url|
      response_url = RestClient.get(url)
      arr << JSON.parse(response_url)
    end
  else puts "woops! we couldn't find that."
  end
  arr
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
  films.each do |film|
    puts "Episode #{film["episode_id"]} #{film["title"]} released in #{film["release_date"]}"
    puts "------------------------------------"
  end
end

def show_character_movies(character, type)
  films = get_character_movies_from_api(character, type)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
