class Admin::ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            flash[:notice] = "Product was created succesfully"
            redirect_to admin_products_path
        else
            render 'new'
        end
    end

    def edit
        @product = Product.find(params[:id])

    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            flash[:notice] = "Product was updated succesfully"
            redirect_to admin_products_path
        else
            render 'edit'
        end

    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy

    end


    private

    def product_params
        params.require(:product).permit(:title, :description, :image_url, :price, :date_available)
    end

end
