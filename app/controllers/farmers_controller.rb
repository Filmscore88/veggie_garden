
class FarmersController < ApplicationController

  get '/signup' do
    if !session[:farmer_id]
      erb :'farmers/new'
    else
      redirect '/gardens'
    end
  end

  post '/farmers' do
    @farmer=Farmer.create(username: params[:username], password: params[:password])
    session[:farmer_id]= @farmer.id
    redirect '/gardens'
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
    redirect '/gardens'
  end

  get '/farmers/:id' do
    if !logged_in?
      redirect '/gardens'
    end

    @farmer = Farmer.find(params[:id])

    if !@farmer.nil? && @farmer == current_user
      erb :'farmers/show'
    else
      redirect '/gardens'
    end
  end

   get '/logout' do
     log_out
   end
end
