require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  character_info = response_hash["results"]
    user_character = character_info.find do |element|
        character_name == element["name"]
    end
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  film_urls = user_character["films"]
    film_info = film_urls.map do |url|
      response_URL = RestClient.get(url)
      response_URLhash = JSON.parse(response_URL)
    end
  # return value of this method should be collection of info about each film.
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each.with_index(1) do |element, index|
    puts "#{index} #{element['title']}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
