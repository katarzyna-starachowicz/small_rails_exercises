class User < ActiveRecord::Base
  has_secure_password


  before_create { self.remember_token = new_token }

  def new_token
    token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
  end


  def remember
    update_attribute(:remember_token, new_token)
  end
end
