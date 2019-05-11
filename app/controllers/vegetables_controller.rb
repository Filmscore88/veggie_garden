class VegetablesController < ApplicationController

  get '/vegetables' do
    login_confirmation
    @vegetables=Vegetable.all
    erb :'/vegetables/index'
  end

  get '/vegetables/new' do
    login_confirmation
    if @gardens=current_user.gardens
      erb :'/vegetables/new'
    else
      redirect '/gardens/new'
    end
  end

  get '/vegetables/:id/edit' do
    login_confirmation
    @vegetable= Vegetable.find(params[:id])

    if current_user.vegetable_ids.include?(@vegetable.id)
      erb :'/vegetables/edit'
    else
      redirect '/vegetables'
    end
  end

  patch '/vegetables/:id' do
    login_confirmation
    @vegetable=Vegetable.find(params[:id])
    @garden=Garden.find(params[:garden_id])

    if !@vegetable
      "Entry #{@vegetable.id} not found"
      redirect '/vegetables/:id/edit'
    else
      @vegetable.update(name: params[:name], quantity: params[:quantity], garden_id: params[:garden_id])

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
