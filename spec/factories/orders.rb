FactoryBot.define do
  factory :order do
    postal_code {"111-1111"}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city {"埼玉県"}
    address {"さいたま市緑区4-11-23"}
    phone_number {"09079025840"}
  end
end
