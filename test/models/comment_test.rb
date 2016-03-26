require 'test_helper'

class CommentTest < MiniTest::Spec
  it "Comment can not be saved without author" do
    comment = build(:comment, user: nil)
    lambda {comment.save!}.must_raise(ActiveRecord::RecordInvalid)
    comment = build(:comment, user: create(:user))
    expect(comment.save!).must_equal true
  end
  it "Comment can not be saved without product" do
    comment = build(:comment, product: nil)
    lambda {comment.save!}.must_raise(ActiveRecord::RecordInvalid)
    comment = build(:comment, product: create(:product))
    expect(comment.save!).must_equal true
  end
  it "Comment can not be saved without text" do
    comment = build(:comment, text: nil)
    lambda {comment.save!}.must_raise(ActiveRecord::RecordInvalid)
    comment = build(:comment, text: "Test comments text")
    expect(comment.save!).must_equal true
  end
end
