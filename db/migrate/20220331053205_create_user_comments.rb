class CreateUserComments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_comments, primary_key: :comment_id do |t|
      t.integer :user_id
      t.date :comment_date
      t.string :comment, limit: 2000
    end
  end
end
