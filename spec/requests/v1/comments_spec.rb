require 'rails_helper'

RSpec.describe "V1::Comments", type: :request do
  describe "GET /v1/comments/:id" do
    let!(:user_comment) { create(:user_comment) }
    let!(:expect_json) do
      {
        data: {
          id: user_comment.comment_id,
          user_id: user_comment.user_id,
          date: user_comment.comment_date,
          text: user_comment.comment,
        }
      }.to_json
    end

    it 'コメントが正しい形式で返される' do
      get v1_comment_path(user_comment.comment_id)
      expect(response).to have_http_status(200)
      expect(response.body).to eq(expect_json)
    end
  end
end
