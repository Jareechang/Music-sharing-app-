require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup 
    @user = User.new()
  end

  test "should delete the tracks if user is deleted" do
    @user.save
    @user.tracks.create!(url: "http://thisisaurl")
      assert_difference 'Track.count', -1 do
        @user.destroy 
      end
  end
end
