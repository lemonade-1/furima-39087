require 'rails_helper'

RSpec.describe OrderShippingaddress, type: :model do
  before do
    @order_shippingaddress = FactoryBot.build(:order_shippingaddress)
  end

  describe '配送先住所保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shippingaddress).to be_valid
      end

      it '建物名が空でも保存できる' do
        @order_shippingaddress.building = nil
        expect(@order_shippingaddress).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_shippingaddress.user_id = nil
        @order_shippingaddress.valid?
        expect(@order_shippingaddress.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できない' do
        @order_shippingaddress.item_id = nil
        @order_shippingaddress.valid?
        expect(@order_shippingaddress.errors.full_messages).to include("Item can't be blank")
      end

      it 'postcodeが空だと保存できない' do
        @order_shippingaddress.postcode = nil
        @order_shippingaddress.valid?
        expect(@order_shippingaddress.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postcodeは「3桁ハイフン4桁」でないと保存できない' do
        @order_shippingaddress.postcode = 1_234_567
        @order_shippingaddress.valid?
        expect(@order_shippingaddress.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      it '都道府県が空だと保存できない' do
        @order_shippingaddress.prefecture_id = nil
        @order_shippingaddress.valid?
        expect(@order_shippingaddress.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県が「---」だと保存できない' do
        @order_shippingaddress.prefecture_id = 1
        @order_shippingaddress.valid?
        expect(@order_shippingaddress.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空だと保存できない' do
        @order_shippingaddress.city = nil
        @order_shippingaddress.valid?
        expect(@order_shippingaddress.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できない' do
        @order_shippingaddress.block = nil
        @order_shippingaddress.valid?
        expect(@order_shippingaddress.errors.full_messages).to include("Block can't be blank")
      end

      it '電話番号が空だと保存できない' do
        @order_shippingaddress.phone_number = nil
        @order_shippingaddress.valid?
        expect(@order_shippingaddress.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が9桁以下だと保存できない' do
        @order_shippingaddress.phone_number = 123_456_789
        @order_shippingaddress.valid?
        expect(@order_shippingaddress.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が12桁以上だと保存できない' do
        @order_shippingaddress.phone_number = 123_456_789_012
        @order_shippingaddress.valid?
        expect(@order_shippingaddress.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が半角数値のみしか保存できない' do
        @order_shippingaddress.phone_number = '１２３４５６７８９０'
        @order_shippingaddress.valid?
        expect(@order_shippingaddress.errors.full_messages).to include('Phone number is invalid')
      end

      it 'トークンが空だと保存できない' do
        @order_shippingaddress.token = nil
        @order_shippingaddress.valid?
        expect(@order_shippingaddress.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
