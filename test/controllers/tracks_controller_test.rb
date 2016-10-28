require 'test_helper'

class TracksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_tracks_url(q: "we are the champions")
    assert_response :success
  end

  test "should require param q" do
    get api_v1_tracks_url
    assert_response :bad_request
  end
end
