class Comment < ActiveRecord::Base
  validates :content, presence: true, length: { maximum: 150 }
  validates :user_id, presence: true
  validates :post_id, presence: true
  belongs_to :user
  belongs_to :post
end
