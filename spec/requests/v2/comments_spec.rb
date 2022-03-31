require 'rails_helper'

RSpec.describe "V2::Comments", type: :request do
  describe "GET /v2/comments/:id" do
    before do
      allow(Client::Moneywelfare).to receive(:get_response).and_return({ id: user_comment.user_id, name: '田中太郎' }.to_json)
    end
    let!(:user_comment) do
      create(
        :user_comment,
        user_id: 1,
        comment_date: '2015-01-01',
        comment: "左手には少しさがって博物の教室がある。\r"
      )
    end
    let!(:comment_score1) do
      create(
        :comment_score,
        comment_id: user_comment.comment_id,
        score_type: false,
        score: 1.5,
      )
    end
    let!(:comment_score2) do
      create(
        :comment_score,
        comment_id: user_comment.comment_id,
        score_type: true,
        score: 1.8,
      )
    end
    let!(:expect_json) do
      {
        "data": {
          "id": user_comment.comment_id,
          "user":{
            "id": user_comment.user_id, "name": "田中太郎"
          },
          "date": "2015-01-01",
          "text": "左手には少しさがって博物の教室がある。\r",
          "comment_scores": [
            {"comment_id": user_comment.comment_id,"type": false,"value": 1.5},
            {"comment_id": user_comment.comment_id,"type": true,"value": 1.8}
          ]
        }
      }.to_json
    end

    it 'コメントが正しい形式で返される' do
      get v2_comment_path(user_comment.comment_id)
      expect(response).to have_http_status(200)
      expect(response.body).to eq(expect_json)
    end
  end
end