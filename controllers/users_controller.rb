class UsersController < ApplicationController

  get '/' do
    erb :login
  end

end
