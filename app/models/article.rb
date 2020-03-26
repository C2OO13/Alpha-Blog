class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {maximum: 500, minimum: 10}
  validates :user_id, presence: true
end