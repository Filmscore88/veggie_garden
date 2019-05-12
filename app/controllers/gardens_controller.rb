
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

  get '/gardens/:id/edit' do
    login_confirmation
    @garden= Garden.find(params[:id])

    if @garden.farmer_id == current_user.id
      erb :'/gardens/edit'
      else
        redirect '/gardens'
    end
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

  delete '/gardens/:id/delete' do
    login_confirmation
    @garden=Garden.find(params[:id])
    @garden.delete
    redirect '/gardens'
  end

  post '/gardens' do
    login_confirmation
    @garden=Garden.create(params)
    current_user.gardens << @garden
    redirect '/gardens'
   end
end
