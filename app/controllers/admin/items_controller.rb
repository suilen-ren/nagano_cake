class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "新しい商品を登録しました"
      redirect_to admin_items_path
    else
      flash[:alert] = "すべての情報を入力してください"
      redirect_to new_admin_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
    @price_with_tax = (@item.price * 1.1).to_i
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品の更新が成功しました"
      redirect_to admin_item_path(@item.id)
    else
      flash[:alert] = "すべての情報を入力してください"
      redirect_to edit_admin_item_path(@item.id)
    end
  end

  private
  def item_params
    params.require(:item).permit(:photo_item,:name,:introduction,:genre_id,:price,:is_active)
  end
end
