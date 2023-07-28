class OrdersController < ApplicationController
  def index
    @order_shippingaddress = OrderShippingAddress.new
  end
end
