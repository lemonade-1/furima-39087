class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_2, only: [:index, :create] # ルーティングのネストによりpramsの中のidが変化したため
  before_action :move_to_index_2, only: [:index, :create]

  def index
    @order_shippingaddress = OrderShippingaddress.new
  end

  def create
    @order_shippingaddress = OrderShippingaddress.new(order_params)
    if @order_shippingaddress.valid?
      @order_shippingaddress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shippingaddress).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item_2
    @item = Item.find(params[:item_id]) 
  end

  def move_to_index_2
    return if current_user.id != @item.user.id && @item.order == nil

    redirect_to root_path
  end

end
