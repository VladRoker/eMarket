require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "All new users are gueasts" do
    @user = build(:user)
    assert @user.guest?
  end
  test "User email must be uniq" do
    @user = create(:registred_user)
    @other_user = build(:registred_user, email:@user.email)
    assert_raise ActiveRecord::RecordInvalid do
      @other_user.save!
    end
  end
end
