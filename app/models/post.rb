class Post < ApplicationRecord
  mount_uploader :toy_image, ToyImageUploader
  belongs_to :user

  validates :toy_name, presence: true
  validates :content, presence: true
end
