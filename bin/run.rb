#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
user_input = get_user_input
if user_input[0] == "character"
  show_character_movies(user_input[1])
elsif user_input[0] == "film"
  get_films_from_api(user_input[1])
end
