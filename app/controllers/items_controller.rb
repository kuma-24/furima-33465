class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id && @item.order == nil
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if user_signed_in? && current_user.id == item.user_id
      if item.destroy
        redirect_to action: :index
      else
        render :edit
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :info,
      :price,
      :image,
      :category_id,
      :prefecture_id,
      :sales_status_id,
      :scheduled_delivery_id,
      :shipping_fee_status_id
    ).merge(user_id: current_user.id)
  end
end
