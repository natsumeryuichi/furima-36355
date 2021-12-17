FactoryBot.define do
  factory :condition do
    conditions {Faker::Number.between(from: 1, to: 7)}
  end
end
