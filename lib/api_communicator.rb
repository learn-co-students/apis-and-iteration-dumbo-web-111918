require 'rest-client'
require 'json'
require 'pry'

def next_page
  url = "http://www.swapi.co/api/people/"
  new_list = []
  response_hash = JSON.parse(RestClient.get(url))
  while !!response_hash["next"]
    new_list << response_hash["results"]
    response_hash = JSON.parse(RestClient.get(response_hash["next"]))
  end
  new_list << response_hash["results"]
  new_list.flatten
  new_list = new_list.flatten
end

def get_character_movies_from_api(character_name)
  character_info = next_page.find do |character|
    character["name"] == character_name
  end
  movie_list = character_info["films"]
  movie_list.map do |url|
    JSON.parse(RestClient.get(url))
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
