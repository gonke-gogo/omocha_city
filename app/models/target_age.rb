class TargetAge < ApplicationRecord
  has_many :post_ages, dependent: :destroy
  has_many :posts, through: :post_ages
end
