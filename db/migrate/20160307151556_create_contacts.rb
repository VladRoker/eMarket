class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :language,       :null => false, :uniqe => true
      t.string :name,           :null => false
      t.string :adress
      t.string :phone
      t.string :email
      t.string :company_name,   :null => false
      t.string :company_reg_nr, :null => false
      t.string :company_vat_nr, :null => false
      t.text   :bank
      t.text   :time_table
      t.text   :description
      t.timestamps              :null => false
    end
  end
end
