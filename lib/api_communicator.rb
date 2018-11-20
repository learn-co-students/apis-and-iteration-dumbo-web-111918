require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  # binding.pry
  film_array = Array.new
  response_hash["results"].each do |character_hash|
    if character_hash["name"] == character_name
      character_hash["films"].each {|film| film_array << JSON.parse(RestClient.get(film))}
    end
  end
  return film_array
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
  films = get_character_movies_from_api(character)
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
