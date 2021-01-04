class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
       has_many :items
       has_many :buys
       
       validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
       validates :nickname,         presence: true
       validates :last_name,        presence: true, format: {with: /\A[ぁ-ん一-龥]+\z/} 
       validates :first_name,       presence: true, format: {with: /\A[ぁ-ん一-龥]+\z/}
       validates :last_name_kana,   presence: true, format: {with: /\p{katakana}/}
       validates :first_name_kana,  presence: true, format: {with: /\p{katakana}/}
       validates :birthday,         presence: true
       
end
