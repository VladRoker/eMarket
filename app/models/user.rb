class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true

  def guest?
    self.password_digest.nil?
  end
end
