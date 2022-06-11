class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status = 2
      @order.order_items.each do |order_item|
        order_item.making_status = 2
        order_item.update(order_item_params)
      end
    end
    redirect_to admin_order_path(@order.id)
  end
  
  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
  
  def order_params
    params.require(:order).permit(:status)
  end
end
