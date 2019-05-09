
class GardensController < ApplicationController

  get '/gardens' do
    login_confirmation
    @gardens=Garden.all
    erb :'gardens/index'
  end

  get '/gardens/new' do
    login_confirmation
    erb :'/gardens/new'
  end
#Make sure to include the list of radio buttons on the /gardens/edit form
  get '/gardens/:id/edit' do
    login_confirmation
    @garden= Garden.find(params[:id])
      erb :'/gardens/edit'
  end

  patch '/gardens/:id' do
    login_confirmation
    if !@garden=Garden.find(params[:id])
      "Entry #{@garden.id} not found"
      redirect '/gardens/:id/edit'
    else
      @garden.update(name: params[:name], planting_system: params[:planting_system])
      redirect "/gardens/#{@garden.id}"
    end
  end

  get '/gardens/:id' do
    login_confirmation
    @garden=Garden.find(params[:id])
    erb :'gardens/show'
  end

  post '/gardens' do
    login_confirmation
    @garden=Garden.create(params)
    if current_user.gardens << @garden
      redirect '/gardens'
    else
     erb :'/gardens/new'
    end
  end
end
