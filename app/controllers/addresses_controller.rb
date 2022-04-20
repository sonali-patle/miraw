class AddressesController < ApplicationController
  def index
    @addresses = current_user.addresses
  end

  def new
    @address = current_user.addresses.build
  end

  def create
    @address = current_user.addresses.build(address_params)
    if @address.save
      flash[:notice] = "address has been created."
      redirect_to addresses_path
    else
      flash[:error] = @address.errors.full_messages.join(", ")
      render 'new'
    end
  end

  def edit
    @address = current_user.addresses.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "Address updated."
      redirect_to addresses_path
    else
      render 'edit'
    end

  end

  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      flash[:notice] = "Address deleted."
      redirect_to addresses_path
    end
  end
  
  private

  def address_params
    params.require(:address).permit(:address_line_1, :address_line_2, :city, :country, :state, :pincode, :phone_number)
  end
end
