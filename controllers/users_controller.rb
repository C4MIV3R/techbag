class UsersController < ApplicationController

  @user_message = ""

  get '/' do
    if session[:logged_in] == true
      redirect '/my_account'
    else
      erb :login
    end
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
    session[:username]  = params[:username]
    puts session[:username]
    @user_message = "Welcome to the club #{session[:username]}"
    redirect '/'
  end

  # User Login
  post '/login' do
    user = User.find_by username: params[:username]
    compare_to = BCrypt::Password.new(user.password_hash)
    if user && compare_to == params[:password_hash]
      session[:logged_in] = true
      session[:current_user_id] = user[:id]
      @user_message = "Welcome Back #{session[:username]}"
      redirect '/account/my_account'
    else
      @user_message = "You have entered the wrong email & pasword combination"
      redirect '/account'
    end
  end

    # User Logout
    get '/logout' do
      session[:logged_in] = false
      @user_message = "You are now logged out. Come back soon."
      redirect '/'
    end

    get '/my_account' do
      if session[:logged_in] == true
        erb :my_account
      else
        redirect '/account'
      end
    end
    
end
