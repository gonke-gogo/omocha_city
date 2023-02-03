class Post < ApplicationRecord
  mount_uploader :toy_image, ToyImageUploader
  mount_uploader :toy_movie, ToyMovieUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories
  has_many :post_ages, dependent: :destroy
  has_many :target_ages, through: :post_ages

  validates :toy_name, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: {maximum: 1000}

  enum shop_link: { toyzarasu: 1, nisimatsuya: 2, akachanhonpo: 3, birthday: 4, yodobashicamera: 5, bigcamera: 6, toyplanet: 7, hakuhinkantoypark: 8, net: 90, others: 100 }
end
