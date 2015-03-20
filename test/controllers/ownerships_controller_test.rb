require 'test_helper'

class OwnershipsControllerTest < ActionController::TestCase
  setup do
    @ownership = ownerships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ownerships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ownership" do
    assert_difference('Ownership.count') do
      post :create, ownership: { : @ownership., group_id: @ownership.group_id, quantity: @ownership.quantity }
    end

    assert_redirected_to ownership_path(assigns(:ownership))
  end

  test "should show ownership" do
    get :show, id: @ownership
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ownership
    assert_response :success
  end

  test "should update ownership" do
    patch :update, id: @ownership, ownership: { : @ownership., group_id: @ownership.group_id, quantity: @ownership.quantity }
    assert_redirected_to ownership_path(assigns(:ownership))
  end

  test "should destroy ownership" do
    assert_difference('Ownership.count', -1) do
      delete :destroy, id: @ownership
    end

    assert_redirected_to ownerships_path
  end
end
