class PostlistsController < ApplicationController
  def index
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
    @postlist = @post.postlist
  end



  private
  def postlist_params
    params.require(:postlist).permit(:title, :body)


  end
end
