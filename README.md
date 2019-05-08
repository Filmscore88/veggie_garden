
helpers do
    def logged_in?
      !!current_user
    end

    def current_user
     @current_user ||= Farmer.find_by(:id => session[:farmer_id]) if session[:farmer_id]
    end


    def login(username, password)
      farmer= Farmer.find_by(:username => username)

      if  farmer && farmer.authenticate(password)
    	   session[:farmer_id] = farmer.id
      end
    end

    def login_confirmation
      if !logged_in?
        redirect '/login'
      end
    end

    def log_out
      if session[:farmer_id] !=nil
        session.destroy
        redirect '/login'
      else
        redirect '/'
      end
    end
  end
end
