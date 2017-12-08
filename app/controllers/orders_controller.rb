class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

   def create
     @order = Order.new(order_params)
     @order.user = current_user
     @order.total = current_cart.total_price

     if @order.save
       current_cart.cart_items.each do |cart_item|
         post_list = PostList.new
         post_list.order = @order
         post_list.post_name = cart_item.post.title
         post_list.post_price = cart_item.post.price
         post_list.quantity = cart_item.quantity
         post_list.save
       end
       redirect_to order_path(@order)
     else
       render 'carts/checkout'
     end
   end

   def show
     @order = Order.find(params[:id])
     @post_lists = @order.post_lists
   end

   private

   def order_params
     params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
   end
end
