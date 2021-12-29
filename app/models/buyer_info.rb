 class BuyerInfo

  include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :info_id

    validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: "はハイフンを含めた３桁、４桁の数字で入力してください"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :city, presence: true
    validates :address, presence: true
    validates :phone_number, presence: true, length: {minimum: 10, maximum: 11}, numericality: { only_integer: true}
    validates :user_id, presence: true  

    def save
      info = PurchaseManagement.create(user_id: user_id, item_id: item_id)
      Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_management_id: info.id)
    end
 end