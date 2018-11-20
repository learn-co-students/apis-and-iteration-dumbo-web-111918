require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #user input for character is now being passed in for character_name
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  #response_hash["results"][0]["films"]--this gives us an array of films for one character
   
    character_info = response_hash["results"]
    user_character = character_info.find do |element|
      character_name == element["name"]
    end 
    film_urls = user_character["films"]
    
    film_info = film_urls.map do |url|
       response_URL = RestClient.get(url)
       response_URLhash = JSON.parse(response_URL)  
    end
    #this is an array with film urls
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
  # some iteration magic and puts out the movies in a nice list
  films.each.with_index(1) do |element, index|
    puts "#{index} #{element["title"]}"    
   end  
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  # this is calling this other method, passing in the user input for character
  print_movies(films)
end

## BONUS
#getting the film name. means I ask for user for film name
#response_string = RestClient.get('http://www.swapi.co/api/films/') changing the
#GET to all the films
#series of hashes
#get into results films[:results] return an array for each film
#iterated over each one , call element["release_date"]

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

#for han solo
#All resources support a search parameter that filters the set of resources returned. 
#This allows you to make queries like:
#https://swapi.co/api/p(eople/?search=r2
#response_string = RestClient.get(https://swapi.co/api/people/?search=Solo)
#https://swapi.co/api/people/?search=#{answer}
#so if the user typed in Han Solo: answer = get.chomps