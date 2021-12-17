FactoryBot.define do
  factory :item do
    title {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    explanation {Faker::Lorem.characters(number: 100, min_alpha: 1, min_numeric: 1)}
    category_id {Faker::Number.between(from: 2, to: 12)}
    condition_id {Faker::Number.between(from: 2, to: 7)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    shipping_charge_id {Faker::Number.between(from: 2, to: 3)}
    shipping_day_id {Faker::Number.between(from: 2, to: 4)}
    price {Faker::Number.between(from: 300, to: 9_999_999)}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
