require 'test_helper'

class PledgesControllerTest < ActionController::TestCase
  setup do
    @pledge = pledges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pledges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pledge" do
    assert_difference('Pledge.count') do
      post :create, pledge: { email: @pledge.email, first_name: @pledge.first_name, last_name: @pledge.last_name, pledge_id: @pledge.pledge_id }
    end

    assert_redirected_to pledge_path(assigns(:pledge))
  end

  test "should show pledge" do
    get :show, id: @pledge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pledge
    assert_response :success
  end

  test "should update pledge" do
    patch :update, id: @pledge, pledge: { email: @pledge.email, first_name: @pledge.first_name, last_name: @pledge.last_name, pledge_id: @pledge.pledge_id }
    assert_redirected_to pledge_path(assigns(:pledge))
  end

  test "should destroy pledge" do
    assert_difference('Pledge.count', -1) do
      delete :destroy, id: @pledge
    end

    assert_redirected_to pledges_path
  end
end
