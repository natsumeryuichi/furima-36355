FactoryBot.define do
  factory :category_id do
    category_id {Faker::Number.between(from: 1, to: 12)}
  end
end
