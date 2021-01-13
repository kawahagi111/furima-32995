require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  describe 'order_addressの情報' do
    context '情報が保存できる場合' do
      it '全てが揃っていれば保存される' do
        expect(@order_address).to be_valid
      end
      it '建物名がなくても保存できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '情報が保存できない場合' do
      it '郵便番号なしでは保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it '都道府県指定なしでは保存できない' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Area can't be blank"
      end
      it '市区町村なしでは保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it '番地なしでは保存できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "House number can't be blank"
      end
      it '電話番号なしでは保存できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone can't be blank"
      end
      it 'トークンなしでは保存できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'user_idなしでは保存できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idなしでは保存できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
      it '郵便番号にハイフンなしでは保存できない' do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it '電話番号が12桁以上では保存できない' do
        @order_address.phone = '111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone is invalid.'
      end
      it 'ハイフンが入っている場合は購入できない' do
        @order_address.phone = '11111-11'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone is invalid.'
      end
      it '9桁以下の場合は購入できない' do
        @order_address.phone = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone is invalid.'
      end
      it '半角文字が入っている場合は購入できない' do
        @order_address.phone = '11111111a1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone is invalid.'
      end
    end
  end
end
