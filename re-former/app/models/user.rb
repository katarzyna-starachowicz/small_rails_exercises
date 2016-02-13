class User < ActiveRecord::Base
  validates :username, presence: true, length: { minimum: 4, maximum: 15 }, uniqueness: true
  validates :emails, uniqueness: true
  validates :password, presence: true, length: { minimum: 6, maximum: 20 }

end
