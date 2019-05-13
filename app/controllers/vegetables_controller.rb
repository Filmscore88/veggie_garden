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

  delete '/vegetables/:id/delete' do
    login_confirmation
    @vegetable=Vegetable.find(params[:id])
    @vegetable.delete
    redirect '/vegetables'
  end


  post '/vegetables' do
    unless params[:quantity].to_i > 0
      redirect '/vegetables/new? error=invalid number'
     else
       @vegetable=Vegetable.create(params)
       redirect '/vegetables'
     end
   end
end
