class Order < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :products

  validates :status,  presence: true
  validates :price,   presence: true
end
