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
    @spaces = Space.all(params[:start_date], params[:end_date])
    erb :'book_a_space/index'

  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    if params['password'] == params['password_confirmation']
      customer = Customer.create(email:params[:email], password: params[:password])
      session[:customer_id] = customer.customer_id
      redirect '/'
    else
      flash[:notice] = "Passwords don't match"
      redirect '/users/new'
    end
    
  end

  post '/book_a_space' do
    #start_date end_date
    redirect "/book_a_space?start_date=#{params[:start_date]}&end_date=#{params[:end_date]}"

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
