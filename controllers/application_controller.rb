class ApplicationController < Sinatra::Base

  enable :sessions

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  not_found do
    erb :notfound
  end

  get '/' do
    erb :index
  end

end
