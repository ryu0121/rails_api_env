class V2::CommentsController < ApplicationController
  def show
    user_comment = UserComment.find(params[:id])
    user = Client::Moneywelfare.get_user(user_id: user_comment.user_id)
    comment_scores = CommentScore.where_by_comment_id(user_comment.comment_id)
    response = build_json(user_comment, user, comment_scores)
    render json: response, status: :ok
  end

  private

  def build_json(user_comment, user, comment_scores)
    comment_score_jsons = comment_scores.map do |comment_score|
      {
        comment_id: comment_score.comment_id,
        type: comment_score.score_type,
        value: comment_score.score,
      }
    end

    hash = {
              data: {
                "id": user_comment.comment_id,
                "user": {
                  "id": user['id'],
                  "name": user['name']
                },
                "date": user_comment.comment_date,
                "text": user_comment.comment,
              }
            }
    hash[:data][:comment_scores] = comment_score_jsons
    hash.to_json
  end
end
