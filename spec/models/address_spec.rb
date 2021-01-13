require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end
  describe 'addressの情報' do
    context '情報が保存できる場合' do
      it '全てが揃っていれば保存される' do
        expect(@address).to be_valid
      end
    end
    context '情報が保存できない場合' do
      it '住所なしでは保存できない' do
        @address.postal_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Postal cpde can't be blank"
      end
    end
  end
end
