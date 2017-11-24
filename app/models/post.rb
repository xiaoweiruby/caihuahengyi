class Post < ApplicationRecord
  validates :title, presence: true
  has_many :comments
  mount_uploader :image, ImageUploader
end
