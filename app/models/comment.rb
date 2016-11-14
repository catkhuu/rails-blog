class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: :User, foreign_key: :user_id

  validates :body, length: { minimum: 1, maximum: 1000 }, presence: true
  validates :post_id, :user_id, presence: true  
end
