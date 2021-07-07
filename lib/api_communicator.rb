require 'rest-client'
require 'json'
require 'pry'

def find_character(character_name)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  response_hash["results"].each do |character_hash|
    if character_hash["name"] == character_name
      return character_hash
    end
  end
end

def character_movies(character_hash)
  find_character(character_hash["name"])["films"].collect {|film| JSON.parse(RestClient.get(film))}
end


def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  puts ""
  puts "Nice!"
  puts "This character appeared in:"
  films.each do |film|
    puts "- " + film["title"]
  end
end

def show_character_movies(character)
  character_hash = find_character(character)
  films = character_movies(character_hash)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

def get_films_from_api(film_title)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/films/')
  response_hash = JSON.parse(response_string)
  puts ""
  puts "I found:"
  puts ""
  response_hash["results"].each do |films|
    if films["title"] == film_title
      puts "Title: #{films["title"]}"
      puts "Directed by #{films["director"]}"
      puts "-"*25
    end
  end
end
