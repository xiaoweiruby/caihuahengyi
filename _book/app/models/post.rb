class Post < ApplicationRecord
  validates :title, presence: true
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
end
