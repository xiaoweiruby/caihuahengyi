module CartsHelper
  def render_cart_total_price(cart)
    sum = 0
        current_cart.cart_items.each do |cart_item|
        if cart_item.post.price.present?
        sum = sum + cart_item.quantity * cart_item.post.price
        end
    end
      sum
  end
end
