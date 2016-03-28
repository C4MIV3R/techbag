class ProductsController < ApplicationController

  get '/products' do
    erb :products
  end

end
