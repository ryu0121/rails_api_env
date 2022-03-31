FactoryBot.define do
  factory :user_comment do
    user_id { 1 }
    comment_date { '2022-04-01'.to_date }
    comment { 'comment' }
  end
end
