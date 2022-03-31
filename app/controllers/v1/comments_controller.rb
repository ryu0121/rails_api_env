class V1::CommentsController < ApplicationController
  def show
    user_comment = UserComment.find(params[:id])
    render json: build_json(user_comment), status: :ok
  end

  private

  def build_json(user_comment)
    {
      data: {
        id: user_comment.comment_id,
        user_id: user_comment.user_id,
        date: user_comment.comment_date,
        text: user_comment.comment,
      },
    }.to_json
  end
end
