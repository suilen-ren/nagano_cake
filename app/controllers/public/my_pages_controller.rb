class Public::MyPagesController < ApplicationController
  before_action :authenticate_customer!
  def show
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to my_pages_path
    else
      render :edit
    end
  end

  def confirm
  end

  def leave
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:email,:last_name,:last_name_kana,:first_name,:first_name_kana,:postal_code,:telephone_number,:address,:is_active)
  end

end
