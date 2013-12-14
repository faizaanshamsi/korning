class ProductNamesController < ApplicationController
    def index
    @product_names = ProductName.all
  end
end
