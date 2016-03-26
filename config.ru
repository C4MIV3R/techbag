require 'bundler'
Bundler.require

require './models/product'
require './models/user'

require './controllers/application_controller'
require './controllers/products_controller'
require './controllers/users_controller'

map('/') { run ApplicationController }
