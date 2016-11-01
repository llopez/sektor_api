require 'test_helper'

class TracksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_tracks_url(q: "we are the champions"), headers: { authorization: %{Token token="1234"} }
    assert_response :success
  end

  test "should require param q" do
    get api_v1_tracks_url, headers: { authorization: %{Token token="1234"} }
    assert_response :bad_request
  end

  test "should return unauthorized" do
    get api_v1_tracks_url(q: "term")
    assert_response :unauthorized
  end
end
