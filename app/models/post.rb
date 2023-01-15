class Post < ApplicationRecord
  mount_uploader :toy_image, ToyImageUploader
  belongs_to :user

  validates :toy_name, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: {maximum: 1000}
end
