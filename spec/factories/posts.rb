FactoryBot.define do
  factory :post do
    sequence(:toy_name) { |n| "Test toy name #{n}" }
    content { "test content" }
    toy_image {File.open("#{Rails.root}/app/assets/images/default.jpg")}
    association :user
  end
end