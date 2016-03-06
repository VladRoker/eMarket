class User < ActiveRecord::Base
  has_secure_password validations: false

  validates :email,     uniqueness: true

  has_many :coupons

  def guest?
    self.password_digest.nil?
  end

  def to_s
    name
  end

  def admin?
    admin_flag
  end
end
