class ItemsController < ApplicationController
  def index
  end

  private
  #imageという名前で送られてきた画像ファイルの保存を許可
  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
