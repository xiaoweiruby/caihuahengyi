class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  helper_method :current_cart

   def current_cart
     @current_cart ||= find_cart
   end



  def require_is_admin
    if !current_user.admin?
      flash[:alert] = '你还不是管理员'
      redirect_to root_path
    end
  end
  def vip_required
    if !current_user.vip?
      redirect_to "/", alert: "请充值会员"
    end
  end

  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end
end
