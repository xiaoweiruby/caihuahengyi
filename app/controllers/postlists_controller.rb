class PostlistsController < ApplicationController
  def index
    @postlists = Postlist.all
  end
  def new
    @postlist = Postlist.new

  end
  def create
    @post = Post.find(params[:post_id])
    @postlist = Post.postlist.create(postlist_params)
    redirect_to post_postlists_path(@post)
  end

  private
  def postlist_params
    params.require(:postlist).permit(:title, :body)


  end
end
