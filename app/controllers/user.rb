post '/signup' do

  user = User.new(params[:user])
  
  if user.save
    session[:user_id] = user.id
    # redirect '/'
    redirect to("/")
  else
    # @errors = user.errors.messages
    # erb :"user_views/new"
    return 'error'
  end

end

post '/login' do
  user = User.find_by_email(params[:user][:email])

  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = {:Invalid=>["Incorrect Login"]}
    # erb :"user_views/sign_in"
    redirect '/'
  end
end

get '/logout' do 

 session[:user_id] = nil
  redirect to('/')
end