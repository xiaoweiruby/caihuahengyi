class Post < ApplicationRecord
  validates :information, presence: true
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
end
