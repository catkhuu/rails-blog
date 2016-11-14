class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments, through: :posts
  has_many :posted_comments, class_name: :Comment, foreign_key: :user_id

  validates :username, uniqueness: true, presence: true, length: { minimum: 8 }
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, presence: true
  validates :password, format: { with: /\A(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}\z/ , message: 'must include 1 uppercase, 1 lowercase, 1 number (0-9), and 1 symbol' }, length: { minimum: 8 }

end
