class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :charge
  belongs_to :condition
  belongs_to :day

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :area_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :charge_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one_attached :image
  validates_inclusion_of :price, in: 300..9_999_999
  validates_format_of :price, with: /\A-?[0-9]+(\.[0-9]+)?\z/
  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :area_id
    validates :day_id
    validates :price
    validates :image
  end
end
