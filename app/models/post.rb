class Post < ApplicationRecord
  mount_uploader :toy_image, ToyImageUploader
  mount_uploader :toy_movie, ToyMovieUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :toy_name, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: {maximum: 1000}
end
