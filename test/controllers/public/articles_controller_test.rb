require 'test_helper'

class Public::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_articles_index_url
    assert_response :success
  end

  test "should get show" do
    get public_articles_show_url
    assert_response :success
  end

  test "should get new" do
    get public_articles_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_articles_edit_url
    assert_response :success
  end
end
