class WelcomeController < ApplicationController
  def index
    @post = Post.find(3)
    

  end
end
