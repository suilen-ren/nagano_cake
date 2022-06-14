class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_current_customer, {only: [:update,:destroy]}

  def ensure_current_customer
    @cart_item = CartItem.find(params[:id])
    if @cart_item.customer != current_customer
      redirect_to _path
    end
  end

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    flash[:notice] ="商品の個数を変更しました"
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:notice] = "#{@cart_item.item.name}を買い物かごから削除しました"
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.destroy_all
    flash[:notice] = "買い物かごからすべての商品を削除しました"
    redirect_to items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      flash[:notice] = "商品を買い物かごに追加しました"
      redirect_to items_path
    else
      flash[:alert] = "個数を選択してください"
      redirect_to item_path(@cart_item.item_id)
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:quantity)
  end
end
