FactoryBot.define do
  factory :prefecture do
    prefectures {Faker::Number.between(from: 1, to: 48)}
  end
end
