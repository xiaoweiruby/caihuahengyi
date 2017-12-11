class PostlistsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @postlists = Postlist.all

  end
  def new
    @post = Post.find(params[:post_id])
    @postlist = Postlist.new

  end
  def create
    @post = Post.find(params[:post_id])
    @postlist = Postlist.new(postlist_params)
    @postlist.post = @post
    @postlist.user = current_user
    if @postlist.save
      redirect_to post_postlists_path(@post)
    else
      render :new
    end

  end
  def show
    @post = Post.find(params[:post_id])
    @postlists = @post.postlists
  end




  private
  def postlist_params
    params.require(:postlist).permit(:title, :body)


  end
end
