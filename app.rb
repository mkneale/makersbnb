# frozen_string_literal: true

require 'sinatra/base'

# This is my new class
class Makersbnb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do 
    redirect '/'
  end 

  post 'users' do
    User.create(email:params[:email], password: params[:password])
  redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
