require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe 'アイテムの保存' do
    context 'アイテムが保存できる場合' do
      it '全てが揃っていれば保存される' do
        expect(@item).to be_valid
      end
    end
    context 'アイテムが保存できない場合' do
      it '商品名なしでは保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it '商品の説明なしでは保存できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'カテゴリーが空では登録できない' do
        @item.category_id = "\b1"
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category is not a number'
      end
      it '商品の状態なしでは登録できない' do
        @item.condition_id = "\b1"
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition is not a number'
      end
      it '配送料の負担なしでは登録できない' do
        @item.charge_id = "\b1"
        @item.valid?
        expect(@item.errors.full_messages).to include 'Charge is not a number'
      end
      it '発送元の地域なしでは登録できない' do
        @item.area_id = "\b1"
        @item.valid?
        expect(@item.errors.full_messages).to include 'Area is not a number'
      end
      it '発送までの日数なしでは登録できない' do
        @item.day_id = "\b1"
        @item.valid?
        expect(@item.errors.full_messages).to include 'Day is not a number'
      end
      it '価格なしでは登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid'
      end
      it '価格が300円以下だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it '価格が9999999円以上だと保存されない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it '価格が半角数字出なければ保存されない' do
        @item.price = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it 'imageが空では保存されない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
