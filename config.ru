require 'bundler'
Bundler.require

DB = Sequel.sqlite('development.sqlite')

require 'sinatra/base'

require './models/user'
require './models/product'

require './controllers/application_controller'
require './controllers/products_controller'
require './controllers/users_controller'

map('/') { run ApplicationController }
map('/users') { run UsersController }
map('/products') { run ProductsController }
