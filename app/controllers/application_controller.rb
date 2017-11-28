class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
end
