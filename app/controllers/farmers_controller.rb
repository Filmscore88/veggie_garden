class FarmersController < ApplicationController

  get '/login' do
    erb :'farmers/login'
  end

  post '/login' do
  farmer = Farmer.find_by(:username => params[:username])
   if farmer && farmer.authenticate(params[:password])
     session[:user_id] = user.id
     redirect '/'
   else
     redirect to '/create_account'
   end
  end

  get '/create_account' do
    "Hello Wolrd"
    erb :'farmers/new'
  end

  post '/create_account' do
    puts params
  end


end
