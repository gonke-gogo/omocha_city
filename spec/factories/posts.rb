FactoryBot.define do
  factory :post do
    sequence(:toy_name) { |n| "Test toy name #{n}" }
    content { "test content" }
    association :user
  end
end