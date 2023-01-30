class TargetAge < ApplicationRecord
  has_many :post_ages
  has_many :posts, through: :post_ages
end
