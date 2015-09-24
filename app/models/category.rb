class Category < ActiveRecord::Base
  has_ancestry
  has_many :products
  validates :name, presence: true, uniqueness: true

  def to_s
    self.name
  end
end
