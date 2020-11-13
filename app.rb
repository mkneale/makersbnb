# frozen_string_literal: true

require 'sinatra/base'
require './db_connection_setup'
require './lib/space'
require './lib/user'
require './lib/booking'
require 'uri'
require 'sinatra'
require 'sinatra/flash'

# This is my new class
class Makersbnb < Sinatra::Base
  enable :sessions
  set :session_secret, 'why am I needed'
  register Sinatra::Flash

  get '/' do
    @customer = session[:customer]
    erb :index
  end

  get '/spaces/new' do
    erb :'add_a_listing/index'
  end

  post '/spaces/new' do
    @space = Space.add(
      name: params[:name],
      description: params[:description],
      ppn: params[:ppn],
      start_date: params[:start_date],
      end_date: params[:end_date],
      customer_id: session[:customer].customer_id
    )
    redirect "/spaces"
  end

  get '/spaces' do
    @spaces = Space.all(params[:start_date], params[:end_date])
    @customer = session[:customer]
    erb :'book_a_space/index'
  end

  post '/spaces' do
    redirect "/spaces?start_date=#{params[:start_date]}&end_date=#{params[:end_date]}"
  end

  get '/spaces/:id' do
    @customer = session[:customer]
    @space = Space.find(id: params[:id])
    erb :'spaces/id'
  end

  post '/spaces/:id/request' do
    Booking.add(
      customer_id: session[:customer].customer_id,
      space_id: params[:id],
      booking_date: params[:booking_date]
    )
    redirect '/requests'
  end

  post '/users' do
    if params['password'] == params['password_confirmation']
      customer = Customer.create(email:params[:email], password: params[:password])
      session[:customer] = customer # fake login
      redirect '/spaces'
    else
      flash[:notice] = "Passwords don't match"
      redirect '/'
    end
  end

  get '/login' do
    erb :'login/index'
  end

  post '/login' do
    session[:customer] = Customer.find(email: params[:email])# do something in the db
    redirect '/spaces'
  end

  get '/requests' do
    @customer = session[:customer]
    redirect('/login') if @customer.nil?
    @requests = Booking.all(customer_id: session[:customer].customer_id, confirmation: false)
#    @my_requests = Booking.all(host_id: [host_id])
    erb :'requests/index'
  end

  post '/sign_out' do
    session[:customer] = nil# do something in the db
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
