FactoryBot.define do
  factory :target_age do
    sequence(:name) { |n| "Target Age #{n}" }
  end
end