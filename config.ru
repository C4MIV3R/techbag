# working version
require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter    => 'postgresql',
  :database   => 'tech_bags'
)

require './models/user'
require './models/product'

require './controllers/application_controller'
require './controllers/products_controller'
require './controllers/users_controller'

map('/') { run ApplicationController }
map('/account') { run UsersController }
map('/products') { run ProductsController }
