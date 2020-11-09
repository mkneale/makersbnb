# frozen_string_literal: true

require 'sinatra/base'

# This is my new class
class Makersbnb < Sinatra::Base
  get '/' do
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
