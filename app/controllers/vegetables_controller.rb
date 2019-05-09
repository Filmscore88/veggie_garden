class VegetablesController < ApplicationController

  get '/vegetables' do
    login_confirmation
    @vegetables=Vegetable.all
    erb :'/vegetables/index'
  end

  get '/vegetables/new' do
    login_confirmation
    erb :'/vegetables/new'
  end

  get '/vegetables/:id/edit' do
    login_confirmation
    @vegetable= Vegetable.find(params[:id])
    erb :'/vegetables/edit'
  end

  patch '/vegetables/:id' do

    login_confirmation
    @vegetable=Vegetable.find(params[:id])

    if !@vegetable
      "Entry #{@vegetable.id} not found"
      redirect '/vegetables/:id/edit'
    else
      @vegetable.update(name: params[:name], quantity: params[:quantity], garden_id: params[:garden_id])
      #@club.update(params.select{|k|k=="name" || k=="manufacturer" || k=="golf_bag_id"})
      redirect "/vegetables/#{@vegetable.id}"
    end
  end

  get '/vegetables/:id' do
    login_confirmation
    @vegetable=Vegetable.find(params[:id])
    erb :'vegetables/show'
  end

  post '/vegetables' do
    if @vegetable=Vegetable.create(params)
      redirect '/vegetables'
    else
      erb :'/vegetables/new'
    end
  end
end
