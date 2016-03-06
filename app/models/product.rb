class Product < ActiveRecord::Base
  before_validation :set_defaults
  belongs_to :category
  has_and_belongs_to_many :orders
  has_and_belongs_to_many :coupons
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :quantity, presence: true

  def to_s
    name
  end

  def available?
    self.quantity > 0 && self.price > 0
  end

  def full_price
    self.sale_flag ? self.discount : self.price
  end

  private

  def set_defaults
    self.sale_flag  ||= 'false'
    self.quantity   ||= 0
  end
  
end
