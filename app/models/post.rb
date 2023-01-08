class Post < ApplicationRecord
  belongs_to :user

  validates :toy_name, presence: true
  validates :content, presence: true
end
