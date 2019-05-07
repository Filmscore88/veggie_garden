class VegetablesController < ApplicationController

  get '/vegetables' do
    @vegetables=Vegetable.all
    erb :'/vegetables/index'
  end

  get '/vegetables/new' do
    login_sequence
    erb :'/vegetables/new'
  end

  get '/vegetables/:id/edit' do
    login_sequence
    if vegetable= current_user.gardens.vegetables.find_by(params[:id])
      erb :'/vegetables/edit'
    else
      redirect '/vegetables'
    end
  end

  patch '/vegetables/:id' do
    login_sequence
    @vegetable=Vegetable.find(params[:id])
    if !@vegetable
      "Entry #{@vegetable.id} not found"
      redirect '/vegetables/:id/edit'
    else
      @vegetable.update(name: params[:name])
      redirect "/vegetables/#{@vegetable.id}"
    end
  end

  get '/vegetables/:id' do
    login_sequence
    @vegetable=Vegetable.find(params[:id])
    erb :'vegetables/show'
  end

  post '/vegetables' do
    @vegetable=Vegetable.new(name: params[:name])
    if @vegetable.save
      redirect '/vegetables/:id'
    else
      erb :'/vegetables/new'
    end
  end
end
