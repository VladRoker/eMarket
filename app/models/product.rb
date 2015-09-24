class Product < ActiveRecord::Base
  before_validation :set_defaults
  belongs_to :category
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :quantity, presence: true

  def to_s
    name
  end

  private

  def set_defaults
    self.sale_flag  ||= 'false'
    self.quantity   ||= 0
  end
  
end
