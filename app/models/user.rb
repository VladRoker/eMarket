class User < ActiveRecord::Base
  has_secure_password validations: false

  validates :email,     uniqueness: true

  def guest?
    self.password_digest.nil?
  end

  def admin?
  	false
  end
end
