class Delivery < ActiveRecord::Base
  belongs_to :deliverable, polymorphic: true

  validates :deliverable_id, presence: true
  validates :deliverable_type, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :zip, presence: true
end