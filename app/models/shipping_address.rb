class ShippingAddress < ApplicationRecord
  # アソシエーション
  belongs_to :order
end
