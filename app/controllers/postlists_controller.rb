class PostlistsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @postlists = @post.postlists

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
      redirect_to post_postlists_path
    else
      render :new
    end

  end
  def show
    @post = Post.find(params[:post_id])
    @postlists = @post.postlists
    @postlist = Postlist.find(params[:id])
  end
  def edit
    @post = Post.find(params[:post_id])
    @postlist = Postlist.find(params[:id]) #找到当前[:id]的postlist,localhost:3000/posts/4/postlists，在这个地址下，通过[:id]就可以找到当前的对象。看new action。
  end
  def update
    @post = Post.find(params[:post_id])
    @postlist = Postlist.find(params[:id])

    if @postlist.update(postlist_params)
      redirect_to post_postlists_path(@post)
    else
      render :edit
    end


  end
  def destroy
    @post = Post.find(params[:post_id])
    @postlists = @post.postlists
    @postlist = @post.postlists.find(params[:id])
    @postlist.destroy
    redirect_to post_path(@post)
  end

  private
  def postlist_params
    params.require(:postlist).permit(:title, :body)
  end
end
