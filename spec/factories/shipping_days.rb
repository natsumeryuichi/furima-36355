FactoryBot.define do
  factory :shipping_day do
    shipping_days {Faker::Number.between(from: 1, to: 4)}
  end
end
