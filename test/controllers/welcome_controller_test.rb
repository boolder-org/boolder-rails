require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_localized_url(locale: "en")
    assert_response :success
  end
end
