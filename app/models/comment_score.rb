class CommentScore < ApplicationRecord
  scope :where_by_comment_id, -> comment_id { where(comment_id: comment_id) }
end
