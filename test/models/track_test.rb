require 'test_helper'

class TrackTest < ActiveSupport::TestCase

  test "should grab the most recent tracks" do 
    assert_equal Track.first, tracks(:most_recent)
  end
end
