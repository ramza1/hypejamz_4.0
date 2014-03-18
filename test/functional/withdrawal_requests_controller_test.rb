require 'test_helper'

class WithdrawalRequestsControllerTest < ActionController::TestCase
  setup do
    @withdrawal_request = withdrawal_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:withdrawal_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create withdrawal_request" do
    assert_difference('WithdrawalRequest.count') do
      post :create, withdrawal_request: {  }
    end

    assert_redirected_to withdrawal_request_path(assigns(:withdrawal_request))
  end

  test "should show withdrawal_request" do
    get :show, id: @withdrawal_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @withdrawal_request
    assert_response :success
  end

  test "should update withdrawal_request" do
    put :update, id: @withdrawal_request, withdrawal_request: {  }
    assert_redirected_to withdrawal_request_path(assigns(:withdrawal_request))
  end

  test "should destroy withdrawal_request" do
    assert_difference('WithdrawalRequest.count', -1) do
      delete :destroy, id: @withdrawal_request
    end

    assert_redirected_to withdrawal_requests_path
  end
end
