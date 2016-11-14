class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, length: { minimum: 6 }, presence: true
  validates :content, length: { minimum: 12, maximum: 1000 }, presence: true
  validates :user_id, presence: true
end
