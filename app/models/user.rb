class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments, through: :posts
  has_many :posted_comments, class_name: :Comment, foreign_key: :user_id

end
