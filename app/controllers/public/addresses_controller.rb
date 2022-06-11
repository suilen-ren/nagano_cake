class Public::AddressesController < ApplicationController
  before_action :ensure_current_customer, {only: [:edit, :update,:destroy]}

  def ensure_current_customer
    @address = Address.find(params[:id])
    if @address.customer != current_customer
      redirect_to addresses_path
    end
  end



  def index
    @address = Address.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def edit
    @address =Address.find(params[:id])
  end

  def create
    @address = Address.new
    @createaddress = Address.new(address_params)
    @createaddress.customer_id = current_customer.id
    if @createaddress.save
      redirect_to addresses_path
    else
      render :index
    end

  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code,:address, :name)
  end
end
