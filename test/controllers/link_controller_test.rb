require 'test_helper'

class LinkControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get link_name:string_url
    assert_response :success
  end

  test "should get url:text" do
    get link_url:text_url
    assert_response :success
  end

  test "should get token:string" do
    get link_token:string_url
    assert_response :success
  end

  test "should get user:references" do
    get link_user:references_url
    assert_response :success
  end

end
