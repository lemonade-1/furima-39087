class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :user_id
    validates :name
    validates :description
    validates :category_id 
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  #ジャンルの選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 1 , message: "can't be blank" } do
    validates :category_id 
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end
