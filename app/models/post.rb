class Post < ApplicationRecord
  validates :information, presence: true
  has_many :comments, dependent: :destroy
  has_many :postlists, dependent: :destroy
  mount_uploader :image, ImageUploader
end
