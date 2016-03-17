require 'test_helper'

class ContactTest < MiniTest::Spec
  it "Contacts should have specific language" do
    info = build(:contact, language: nil)
    lambda {info.save!}.must_raise(ActiveRecord::RecordInvalid)
    info = build(:contact, language: 'en')
    expect(info.save!).must_equal true
  end
  it "Shop must have name" do
    info = build(:contact, name: nil)
    lambda {info.save!}.must_raise(ActiveRecord::RecordInvalid)
    info = build(:contact, name: 'Shop')
    expect(info.save!).must_equal true
  end
  it "Company must have name" do
    info = build(:contact, company_name: nil)
    lambda {info.save!}.must_raise(ActiveRecord::RecordInvalid)
    info = build(:contact, company_name: 'Jinteki')
    expect(info.save!).must_equal true
  end
  it "Company must have registration number" do
    info = build(:contact, company_reg_nr: nil)
    lambda {info.save!}.must_raise(ActiveRecord::RecordInvalid)
    info = build(:contact, company_reg_nr: '123456789')
    expect(info.save!).must_equal true
  end
  it "Company must have VAT number" do
    info = build(:contact, company_vat_nr: nil)
    lambda {info.save!}.must_raise(ActiveRecord::RecordInvalid)
    info = build(:contact, company_vat_nr: 'GB1002568879')
    expect(info.save!).must_equal true
  end
end
