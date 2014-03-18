require 'test_helper'

class PaymentAddressesControllerTest < ActionController::TestCase
  setup do
    @payment_address = payment_addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_address" do
    assert_difference('PaymentAddress.count') do
      post :create, payment_address: { address: @payment_address.address, alternate_phone_number: @payment_address.alternate_phone_number, country: @payment_address.country, phone_number: @payment_address.phone_number, state: @payment_address.state, verified: @payment_address.verified, zip: @payment_address.zip }
    end

    assert_redirected_to payment_address_path(assigns(:payment_address))
  end

  test "should show payment_address" do
    get :show, id: @payment_address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_address
    assert_response :success
  end

  test "should update payment_address" do
    put :update, id: @payment_address, payment_address: { address: @payment_address.address, alternate_phone_number: @payment_address.alternate_phone_number, country: @payment_address.country, phone_number: @payment_address.phone_number, state: @payment_address.state, verified: @payment_address.verified, zip: @payment_address.zip }
    assert_redirected_to payment_address_path(assigns(:payment_address))
  end

  test "should destroy payment_address" do
    assert_difference('PaymentAddress.count', -1) do
      delete :destroy, id: @payment_address
    end

    assert_redirected_to payment_addresses_path
  end
end
