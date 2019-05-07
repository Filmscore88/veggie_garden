class GardensController < ApplicationController

  get '/gardens' do
    @gardens=Garden.all
    erb :'/gardens/index'
  end

  get '/gardens/new' do
    login_sequence
    erb :'/gardens/new'
  end

  get '/gardens/:id/edit' do
    login_sequence

    if garden= current_user.gardens.find_by(params[:id])
      erb :'/gardens/edit'
    else
      redirect '/gardens'
    end
  end

  patch '/gardens/:id' do
    login_sequence
    if !@garden=Garden.find(params[:id])
      "Entry #{@garden.id} not found"
      redirect '/gardens/:id/edit'
    else
      @garden.update(name: params[:name], planting_system: [params[:planting_system])
      redirect "/gardens/#{@garden.id}"
    end
  end

  get '/gardens/:id' do
    login_sequence
    @garden=Garden.find(params[:id])
    erb :'gardens/show'
  end

  post '/gardens' do
    @garden=Garden.new(name: params[:name], planting_system: params[:planting_system])
    if @garden.save
      redirect '/gardens/:id'
    else
      erb :'/gardens/new'
    end
  end
end
