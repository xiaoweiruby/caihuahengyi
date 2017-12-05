class Cart < ApplicationRecord
  has_many :posts

  def add_post_to_cart(post)
     ci.post = post
     ci.save
  end
end
