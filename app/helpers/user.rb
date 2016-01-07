helpers do

	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def current_user?
	  session[:user_id]
	end

	def authenticate
		if current_user
			true
		else 
			redirect '/'
		end
	end

	
end