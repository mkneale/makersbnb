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
  set :session_secret, 'why am I needed'
  register Sinatra::Flash

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

  get '/' do
    erb :index
  end

  post '/users' do
    if params['password'] == params['password_confirmation']
      customer = Customer.create(email:params[:email], password: params[:password])
      session[:customer_id] = customer.customer_id
      redirect '/book_a_space'
    else
      flash[:notice] = "Passwords don't match"
      redirect '/'
    end
  end

  get '/login' do
    erb :'login/index'
  end

  post '/login' do
    # do something in the db
    redirect '/book_a_space'
  end

  post '/book_a_space' do
    redirect "/book_a_space?start_date=#{params[:start_date]}&end_date=#{params[:end_date]}"
  end

  get '/requests' do
    erb :'requests/index'
  end

  post '/sign_out' do
    # do something in the db
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
