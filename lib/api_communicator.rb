require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  characters = response_hash['results']

  films = []
  characters.each do |character|
    if character['name'] == character_name
      films = character["films"]
    end
  end

  film_hash = {}
  films.each do |film|
    film_resp = RestClient.get(film)
    film_hash[film] = JSON.parse(film_resp.body)
  end
  film_hash

end



def print_movies(films)
  film_names = []
  films.each do |k, v|
    film_names << v["title"]
  end
  puts film_names
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)

  if films.size < 1
    puts "These aren't the droids you're looking for"
  else
    print_movies(films)
  end
end

# binding.pry
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
