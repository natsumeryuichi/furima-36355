class Order < ApplicationRecord
  belongs_to :purchase_management
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
