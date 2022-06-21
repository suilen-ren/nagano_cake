class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
  end

  def update

    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.transfered?
      @order.order_items.each do |order_item|
        order_item.update(making_status: 2)
      end
    end
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
