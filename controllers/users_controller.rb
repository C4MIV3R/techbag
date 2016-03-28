class UsersController < ApplicationController

  get '/' do
    erb :login
  end

  # user registration
  post '/register' do
    hashed_password = BCrypt::Password.create(params[:password_hash])
    user = User.create({
        :username         => params[:username],
        :email            => params[:email],
        :password_hash    => hashed_password
      })
    session[:logged_in] = true
    session[:username] = params[:username]
    redirect '/'
  end

  # User Login
  post '/login' do
    user = User[username: params[:username]]
    compare_to = BCrypt::Password.new
    if user && compare_to == params[:password_hash]
      session[:logged_in] = true
      session[:current_user_id] = user[:id]
      "Welcome Back #{params[:username]}"
    else
      "You have entered the wrong email & pasword combination"
    end
  end
  # user login
  # post '/login' do
  #   user = User
  #   compare_to =
  #   if user && compare_to == params[:password_hash]
  #     session[:logged_in] = true
  #     session[:username] = params[:username]
  #     "Welcome back #{params[:username]}"
  #     redirect '/'
  #   else
  #     "You have entered an incorrect username & password combination"
  #     redirect '/users'
  #   end
  # end


    # User Logout
    get '/logout' do
      session[:logged_in] = false
      "You are logged out now"
    end
end
