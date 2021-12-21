class Order < ApplicationRecord
  validates :postal_code, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :city, presence: true
  validates :adress, presence: true
  validates :bulding_name
  validates :phone_number, presence: true
  
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
