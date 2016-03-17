class Contact < ActiveRecord::Base
  validates :language, presence: true, uniqueness: true
  validates :name, presence: true
  validates :company_name, presence: true
  validates :company_reg_nr, presence: true
  validates :company_vat_nr, presence: true
end