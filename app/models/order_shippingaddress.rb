class OrderShippingaddress
  include ActiveModel::Model
  # ordersテーブルとshipping_addressesテーブルに保存したいカラム名
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # shipping_addressモデルのバリデーション
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
  end

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存
    # order_idには、変数orderのidと指定する
    ShippingAddress.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number)
  end
end