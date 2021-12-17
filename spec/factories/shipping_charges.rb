FactoryBot.define do
  factory :shipping_charge do
    shipping_chage {Faker::Number.between(from: 1, to: 3)}
  end
end
