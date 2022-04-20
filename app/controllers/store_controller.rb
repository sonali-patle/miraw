class StoreController < ApplicationController
    def index
        @products = Product.salable_products
    end
end
