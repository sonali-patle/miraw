class ItemsController < ApplicationController
    before_action :authenticate_user!

    def create
        cart = current_user.cart
        item = cart.items.where(product_id: params[:product_id]).last
        product = Product.find(params[:product_id])

        if item.present?
            item.quantity += 1
            item.unit_price = product.price
        else
            item = cart.items.build({
                product_id: params[:product_id], 
                quantity: 1, 
                unit_price: product.price
            })
        end
        item.save
        cart.calculate_item_total!
        flash[:notice] = "Items has been added succesfully"
        redirect_to '/store'
    end

    def destroy
        cart = current_user.cart
        item = Item.find(params[:id])
        item.destroy
        cart.calculate_item_total!
        redirect_to "/orders/cart"
    end
end
