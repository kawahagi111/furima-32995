class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :building_name, :phone, :user_id, :item_id, :order_id, :token

  # addressesテーブルとordersテーブルのカラム名を書いておく
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'is invalid.' }
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    # 後々、user.id, item.idのところを少し変更する必要がある
    Address.create(order_id: order.id, postal_code: postal_code, area_id: area_id, city: city, house_number: house_number,
                   building_name: building_name, phone: phone)
  end
end
