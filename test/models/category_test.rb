require 'test_helper'

class CategoryTest < MiniTest::Spec
  it "Category can not be saved without name" do
    cat = build(:category, name: nil)
    lambda {cat.save!}.must_raise(ActiveRecord::RecordInvalid)
    cat = build(:category, name: 'Dog food')
    expect(cat.save!).must_equal true
  end
  it "Category has no ancestry if it is root" do
    cat = create(:category)
    Category.roots.must_include cat
  end
end