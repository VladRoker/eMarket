class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :coupon
  has_and_belongs_to_many :products

  validates :status,  presence: true
  validates :price,   presence: true
  has_many :deliveries, :as => :deliverable

  def to_s
    'Order #' + id.to_s
  end

  def statuses
    %w(New Processing Paid Delivery Success Fail)
  end
end
