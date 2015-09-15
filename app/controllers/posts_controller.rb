class PostsController < ApplicationController

  before_filter :logged_in_user , only: [:create,:destroy]

  def new
    @post = Post.new
  end

  def create
    @post = @current_user.posts.build(post_params)
    if !@post.save
      flash[:notice] = "SUCCESS"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
  end


  private
  def post_params
    params.require(:post).permit(:body,:title,:user_id)
  end



end
