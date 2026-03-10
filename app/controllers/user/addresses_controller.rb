class User::AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_user.id
    if @address.save 
      redirect_to user_events_path
    else
      render :new , status: :unprocessable_entity
    end
  end

  def edit
    @address = current_user.address
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to user_events_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private 
  def check_user
    redirect_to new_user_session_path unless current_user.type == "Customer"
  end

  def address_params
    params.require(:address).permit(:street, :city, :state)
  end
end


