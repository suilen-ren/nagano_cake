class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = Order_item(params[:id])
    @order_item.update(order_item_params)
    

    if @order_item.order.order_items.all? {making_status == 4}
      @order_item.order.status = 4
      @order_status.update(order_params)
    elsif @order_item.making_status = 3
      @order_item.order.status = 3
      @order_status.update(order_params)
    end

    redirect_to admin_order_path(@order_item.order.id)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
