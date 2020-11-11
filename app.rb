# frozen_string_literal: true

require 'sinatra/base'
require './db_connection_setup'
require './lib/space'
require './lib/user'
require 'uri'
require 'sinatra'
require 'sinatra/flash'


# This is my new class
class Makersbnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  get '/' do
    'Temporary test'
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
    if params['password'] ==params['password_confirmation']
      Customer.create(email:params[:email], password: params[:password])
      redirect '/'
    else
      flash[:notice] = "Passwords don't match"
      redirect '/users/new'
    end
  end

  run! if app_file == $PROGRAM_NAME
end
