class FarmersController < ApplicationController


  get '/login' do
    if !session[params :id]
    erb :'/login'
    end
  end

  post '/login' do
    login(params[:username], params[:password])
    redirect '/gardens'
  end

  get '/create_account' do

    erb :'farmers/new'
  end

  post '/farmers' do
     @farmer=Farmer.new
     @farmer.username= params[:username]
     @farmer.password= params[:password]
     if @farmer.save
      redirect '/login'
     else
      erb :"farmers/new"
     end
   end
end
