class GardensController < ApplicationController

  get '/gardens' do
    @gardens=Garden.all
  end

  get '/gardens/new' do
    login_sequence
    erb :'/gardens/new'
  end

  get '/gardens/:id/edit' do
    login_sequence
    @garden=Garden.find(params[:id])

    if @garden.user_id == current_user.id
      erb :'/gardens/edit'
    else
      redirect '/gardens'
    end
  end

  patch '/gardens/:id' do
  end

  get '/gardens/:id' do

  end

  post '/gardens' do
  end
end
