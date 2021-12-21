class PurchaseManagement < ApplicationRecord
  belongs_to :user
  belomgs_to :item
  has_one :order
end
