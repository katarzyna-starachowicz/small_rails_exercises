class User < ActiveRecord::Base
  has_secure_password
  has_many :posts


  before_create { self.remember_token = new_token }

  def new_token
    token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
  end


  def remember
    update_attribute(:remember_token, new_token)
  end

  def forget
    update_attribute(:remember_token, nil)
  end
end
