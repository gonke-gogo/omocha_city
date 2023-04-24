FactoryBot.define do
  factory :category do
    sequence(:category_name) { |n| "category #{n}" }
  end
end