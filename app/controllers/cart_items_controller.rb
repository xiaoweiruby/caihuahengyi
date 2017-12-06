class CartItemsController < ApplicationController
  before_action :authenticate_user!

   def destroy
     @cart = current_cart
     @cart_item = @cart.cart_items.find_by(post_id: params[:id])
     @post = @cart_item.post
     @cart_item.destroy

     flash[:warning] = "成功将 #{@post.title} 从购物车删除!"
     redirect_to :back
   end
end
