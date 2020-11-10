# frozen_string_literal: true

require 'sinatra/base'
require './db_connection_setup'
require './lib/space'

# This is my new class
class Makersbnb < Sinatra::Base
  enable :sessions
  # get '/' do
  #   erb :index
  # end

  get '/add_a_listing' do
    p "get add a listing"
    erb :'add_a_listing/index'
  end

  post '/add_a_listing' do
    @space = Space.add(name: params[:name], description: params[:description], ppn: params[:ppn], start_date: params[:start_date], end_date: params[:end_date])
    p "This is supposed to be a space#{@space}"
    p "post add a listing"
    redirect "/book_a_space"
  end

  get '/book_a_space' do
    @spaces = Space.all
    p "get book a space"
    erb :'book_a_space/index'
  end

  # get '/users/new' do
  #   erb :"users/new"
  # end
  #
  # post '/users' do
  #   redirect '/'
  # end
  #
  # post 'users' do
  #   User.create(email:params[:email], password: params[:password])
  #   redirect '/'
  #
  # end

  run! if app_file == $PROGRAM_NAME
end
