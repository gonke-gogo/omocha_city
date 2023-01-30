class PostAge < ApplicationRecord
  belongs_to :post
  belongs_to :target_age
end
