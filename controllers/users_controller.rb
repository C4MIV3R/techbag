class UsersController < ApplicationController

  get '/' do
    erb :login
  end

  post '/login' do
    
  end

  post '/register' do
    hashed_password = BCrypt::Password.create(params[:password_hash])
    @user = User.create({
        :username         => params[:username],
        :email            => params[:email],
        :password_hash    => hashed_password
      })
    # puts Rainbow(params).magenta
    # puts Rainbow(hashed_password).yellow
    redirect '/'
  end

end
