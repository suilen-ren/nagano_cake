class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end


  def confirm
    @order = Order.new(confirm_params)
    @cart_items= CartItem.where(customer_id: current_customer.id)
    if params[:order][:select_address] == nil || params[:order][:payment] == nil
      redirect_to new_order_path
    elsif @order.select_address == 1
      @order.ship_address = current_customer.address
      @order.ship_postal_code = current_customer.postal_code
      @order.ship_name = current_customer.name
    elsif @order.select_address == 2
      if @order.address_id == nil
        redirect_to new_order_path
      elsif
        @address = Address.find(params[:order][:address_id])
        @order.ship_address = @address.address
        @order.ship_postal_code = @address.postal_code
        @order.ship_name = @address.name
      end
    elsif @order.select_address == 3
      if params[:order][:ship_address].blank?
        redirect_to new_order_path
      elsif params[:order][:ship_postal_code].blank?
        redirect_to new_order_path
      elsif params[:order][:ship_name].blank?
        redirect_to new_order_path
      end
    end
    @order.amount = 0
    @cart_items.each do |cart_item|
      @order.amount = @order.amount + cart_item.subtotal
    end
    @order.postage = 800

  end

  def create

    @order = Order.new(order_params)
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.item_id = Item.find(cart_item.item_id).id
      @order_item.order_id = @order.id
      @order_item.price_then = cart_item.item.price
      @order_item.quantity = cart_item.quantity
      binding.pry
      @order_item.save!
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path

  end

  def complete
  end


  def index
  end

  def show
  end

  private
  def confirm_params
    params.require(:order).permit(:payment,:select_address,:address_id,:ship_postal_code,:ship_address,:ship_name)
  end
  def order_params
    params.require(:order).permit(:payment,:ship_postal_code,:ship_address,:ship_name,:customer_id,:postage,:amount)
  end
end
