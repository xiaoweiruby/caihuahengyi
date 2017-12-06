class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  def index
    @posts = Post.all

  end
  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if
      @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  def add_to_cart
     @post = Post.find(params[:id])
     if !current_cart.posts.include?(@post)
     current_cart.add_post_to_cart(@post)
     flash[:notice] = "你已成功将 #{@post.title} 加入购物车"
     else
        flash[:warning] = "你的购物车内已有此物品"
     end
     redirect_to :back

  end
  private
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

end
