class Coupon < ActiveRecord::Base
  belongs_to :user
  has_one :order
  has_and_belongs_to_many :products

  validates :code,  presence: true
  validates :amount, presence: true, unless: ->(coupon){coupon.percent.present?}
  validates :percent, presence: true, unless: ->(coupon){coupon.amount.present?}

  default_scope { where(used_flag: false) }

  def to_s
    code
  end

  def used?
    used_flag
  end
end
