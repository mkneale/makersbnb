# frozen_string_literal: true

require 'sinatra/base'

# This is my new class
class Makersbnb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/add_a_listing' do
    erb :'add_a_listing/index'
  end

  post '/add_a_listing' do
    #put in db
    redirect '/book_a_space'
  end

  get '/book_a_space' do
    'Book a space'
  end

  run! if app_file == $PROGRAM_NAME
end
