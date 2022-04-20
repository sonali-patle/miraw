class OrdersController < ApplicationController
    before_action :authenticate_user!

    def index
        @orders = current_user.orders.where(state: "Placed")
    end

    def cart
        @order = current_user.cart
    end

    def address
        @order = current_user.cart
        @addresses = current_user.addresses
    end

    def save_address
        @order = current_user.cart
        if @order.update(order_params)
            redirect_to payment_orders_path
        else
            render 'address'
        end
    end

    def payment
        @order = current_user.cart
    end

    def confirm
        @order = current_user.cart
        if @order.update(confirm_params)
            @order.state = 'Placed'
            @order.save
            redirect_to orders_path
        else
            flash[:error] = 'Something went wrong, please try after some time'
            render 'payment'
        end
    end

    private

    def order_params
        params.require(:order).permit(:address_id)
    end

    def confirm_params
        params.require(:order).permit(:payment_type)
    end
end
