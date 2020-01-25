class AddressesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def edit
    @profile = Profile.find(current_user.id)
    @address = Address.find(current_user.id)
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to root_path
    else
      render :edit
  end
    
  end
  
  private

  def address_params
    params.require(:address).permit(:zip_code, :prefectur,:city,:block,:building)
  
  end
end
