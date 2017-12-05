class Cart < ApplicationRecord
  has_many :posts
  has_many :cart_items
   has_many :posts, through: :cart_items, source: :post

  def add_post_to_cart(post)
     ci = cart_items.build
     ci.post = post
     ci.quantity = 1
     ci.save
  end
end
