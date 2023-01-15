class Post < ApplicationRecord
  mount_uploader :toy_image, ToyImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :toy_name, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: {maximum: 1000}
end
