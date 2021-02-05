class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)   
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  
  def order_params
    params.require(:order_form).permit(
      :postal_code, 
      :city, 
      :address, 
      :building, 
      :phone_number, 
      :delivery_prefecture_id
    ).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
