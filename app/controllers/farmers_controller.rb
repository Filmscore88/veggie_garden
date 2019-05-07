class FarmersController < ApplicationController

  get '/farmers/:id' do
    login_confirmation
    @farmer=Farmer.find(params[:id])
  #  if @farmer.id == current_user.id
      erb :'/farmers/show'
    #end
  end

  get '/login' do
    if !session[:farmer_id]
      erb :'farmers/login'
    else
      redirect '/gardens'
    end
  end

  post '/login' do
    login(params[:username], params[:password])
      redirect'/gardens'
  end

  get '/signup' do
    if !session[:farmer_id]
      erb :'farmers/new'
    else
      redirect '/gardens'
    end
  end

  post '/farmers' do
    @farmer=Farmer.new(username: params[:username], password: params[:password])
    if @farmer.save
      redirect '/login'
    else
      redirect '/signup'
    end
  end

   get '/logout' do
       log_out
   end
end
