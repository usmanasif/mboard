class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    collection = PostsCollection.new(params)
    @posts = collection.results
  end

  def show
    @post = post
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: I18n.t('posts.create_success')

    else
      render :new
    end
  end

private
  def post
    @p ||= Post.includes(:author).find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
