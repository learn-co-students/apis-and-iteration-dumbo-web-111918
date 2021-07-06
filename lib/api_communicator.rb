require 'rest-client'
require 'json'
require 'pry'

def next?(response_hash)
  if response_hash["next"]
    url = response_hash["next"]
  else
    url = nil
  end
  url
end

def character_list
  total_list =[]
  url = 'http://www.swapi.co/api/people/'
  while url
    response_string = RestClient.get(url)
    response_hash = JSON.parse(response_string)
    character_list = response_hash["results"]
    character_list.each do |list|
      total_list.push(list)
    end
    url = next?(response_hash)
  end
  total_list
end

def get_character_movies_from_api(character_name)
  character_list_array = character_list
  character_list_array.find do |list|
    if list["name"].include?(character_name)
      return (list["films"]).push(list["name"])
    else
      puts "That's not a character in Star Wars.."
      return nil
    end
  end
end
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.

def print_movies(films)
  list = films.map do |film|
    response_string = RestClient.get(film)
    response_hash = JSON.parse(response_string)
    response_hash["title"]
  end
  puts list
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  if films
    full_name = films.pop
    puts "#{full_name} is in:"
    print_movies(films)
  else
    puts "Try typing an actual name from Star Wars."
    name = gets.chomp
    name = name.capitalize!
    show_character_movies(name)
  end
end



## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
