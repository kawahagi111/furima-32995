class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :genre

      #空の投稿を保存できないようにする
    #validates :title, :text, presence: true

      #ジャンルの選択が「--」の時は保存できないようにする
    #validates :genre_id, numericality: { other_than: 1 } 

    #belongs_to :user
    #has_one_attached :image

 #with_options presence: true do
    #validates :item_name
    #validates :explanation
    #validates :category_id
    #validates :condition_id
    #validates :charge_id
    #validates :area_id
    #validates :day_id
    #validates :price
 #end    

end
