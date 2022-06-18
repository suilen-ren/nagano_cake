class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    @order = Order.find(@order_item.order_id)
    status_check = []
    @order.order_items.each do |order_item|
      status_check << order_item.making_status
    end

    if status_check.all? {|n| n== 4}
      @order.update(status: 4)
    elsif @order_item.making_status == 3
      @order.update(status: 3)
    end

    redirect_to admin_order_path(@order_item.order.id)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

end
