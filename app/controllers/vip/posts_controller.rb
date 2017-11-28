class Vip::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :vip_required
end
