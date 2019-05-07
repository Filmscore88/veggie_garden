require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "secret"
  end
#helper methods go in this file
  get "/" do
    erb :index
  end
  helpers do

    def logged_in?
      !!current_user
    end

    def login(username, password)
      farmer= Farmer.find_by(:username => username)
      if  farmer && farmer.authenticate(password)
    	session[:farmer_id] = farmer.id
      else
    	 redirect "/login"
      end
    end

    def current_user
     @current_user ||= Farmer.find_by(:username => session[:username]) if session[:username]
    end

    def login_confirmation
      if !logged_in?
        redirect '/login'
      end
    end

    def log_out
      session.destroy
      redirect '/'
    end
  end
end
