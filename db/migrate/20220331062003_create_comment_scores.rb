class CreateCommentScores < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_scores do |t|
      t.integer :comment_id
      t.boolean :score_type
      t.float :score
    end

    add_index :comment_scores, [:comment_id, :score_type], unique: true
  end
end
