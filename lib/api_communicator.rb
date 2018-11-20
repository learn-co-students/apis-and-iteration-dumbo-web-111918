require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  character_info = response_hash["results"].find do |character|
    character["name"] == character_name
    end
  movie_list = character_info["films"]
  movie_list.map do |url|
    url_response = RestClient.get(url)
    url_hash = JSON.parse(url_response)
  end
end

def print_movies(films)
  puts "This character appears in:"
  films.each_with_index do |movie, index|
    puts "#{index + 1}. #{movie["title"]}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end


# show_character_movies("Luke Skywalker")

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
