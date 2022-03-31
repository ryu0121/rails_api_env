FactoryBot.define do
  factory :comment_score do
    comment_id { 1 }
    score_type { false }
    score { 1.5 }
  end
end
