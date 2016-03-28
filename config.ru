require 'bundler'
Bundler.require


ActiveRecord::Base.establish_connection(
  :adapter  => 'postgresql',
  :database => 'omg_wtfbbq_app_sinatra'
  )

require 'sinatra/base'

require './models/user'
require './models/product'

require './controllers/application_controller'
require './controllers/products_controller'
require './controllers/users_controller'

map('/') { run ApplicationController }
map('/users') { run UsersController }
map('/products') { run ProductsController }
