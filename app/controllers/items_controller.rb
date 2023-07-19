class ItemsController < ApplicationController
  #未ログイン時、ログイン画面へ遷移
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  private
  #imageという名前で送られてきた画像ファイルの保存を許可
  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
