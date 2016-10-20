class Category < ActiveRecord::Base
  has_ancestry
  has_many :products
  validates :name, presence: true, uniqueness: true
  validates :slug_en, presence: true, uniqueness: true


  extend FriendlyId
  friendly_id :name, :use => [:slugged, :simple_i18n]

  def to_s
    self.name
  end
end
