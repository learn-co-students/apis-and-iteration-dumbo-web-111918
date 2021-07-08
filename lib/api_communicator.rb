require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
#binding.pry

film_array = []

response_hash["results"].collect do |character|
    if character_name == character["name"].downcase
      film_array << character["films"]
    end
  end
  # binding.pry


  film_array.flatten
end

def print_movies(films)

  film_array = films.map do |movie|
    response = RestClient.get(movie)
    JSON.parse(response)
  end

  film_array.each_with_index do |movies, x|
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
