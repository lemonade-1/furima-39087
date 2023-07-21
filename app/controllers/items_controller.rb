class ItemsController < ApplicationController
  # 未ログイン時、ログイン画面へ遷移
  before_action :authenticate_user!, except: [:index]

# 商品一覧表示機能で実装予定のためコメントアウト
=begin
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end
=end

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

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_cost_id, :prefecture_id,
                                 :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
