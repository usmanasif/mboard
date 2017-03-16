class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = post.comments.build(comment_params)

    if @comment.save
      redirect_to post, notice: 'Comment was successfully created.'

    else
      redirect_to post, flash: { error: "Comment: #{@comment.errors.full_messages.join(', ')}" }
    end
  end

private
  def post
    @p ||= Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment)
      .permit(:body)
      .merge(author_id: current_user.id)
  end
end
