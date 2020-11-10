# frozen_string_literal: true

require 'sinatra/base'
require './db_connection_setup'
require './lib/space'
require './lib/user'

# This is my new class
class Makersbnb < Sinatra::Base
  enable :sessions
  get '/' do
    'Temporary test'
    # erb :index
  end

  get '/add_a_listing' do
    erb :'add_a_listing/index'
  end

  post '/add_a_listing' do
    session[:space] = Space.add(name: params[:name])
    redirect '/book_a_space'
  end

  get '/book_a_space' do
    @space = session[:space]
    erb :'book_a_space/index'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    Customer.create(email:params[:email], password: params[:password])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
