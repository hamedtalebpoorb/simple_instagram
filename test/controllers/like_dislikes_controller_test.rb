require 'test_helper'

class LikeDislikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like_dislike = like_dislikes(:one)
  end

  test "should get index" do
    get like_dislikes_url
    assert_response :success
  end

  test "should get new" do
    get new_like_dislike_url
    assert_response :success
  end

  test "should create like_dislike" do
    assert_difference('LikeDislike.count') do
      post like_dislikes_url, params: { like_dislike: {  } }
    end

    assert_redirected_to like_dislike_url(LikeDislike.last)
  end

  test "should show like_dislike" do
    get like_dislike_url(@like_dislike)
    assert_response :success
  end

  test "should get edit" do
    get edit_like_dislike_url(@like_dislike)
    assert_response :success
  end

  test "should update like_dislike" do
    patch like_dislike_url(@like_dislike), params: { like_dislike: {  } }
    assert_redirected_to like_dislike_url(@like_dislike)
  end

  test "should destroy like_dislike" do
    assert_difference('LikeDislike.count', -1) do
      delete like_dislike_url(@like_dislike)
    end

    assert_redirected_to like_dislikes_url
  end
end
