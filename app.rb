# frozen_string_literal: true

require 'sinatra/base'
require './db_connection_setup'
require './lib/space'

# This is my new class
class Makersbnb < Sinatra::Base
  enable :sessions

  get '/add_a_listing' do
    erb :'add_a_listing/index'
  end

  post '/add_a_listing' do
    @space = Space.add(
      name: params[:name],
      description: params[:description],
      ppn: params[:ppn],
      start_date: params[:start_date],
      end_date: params[:end_date]
    )
    redirect "/book_a_space"
  end

  get '/book_a_space' do
    @spaces = Space.all
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
