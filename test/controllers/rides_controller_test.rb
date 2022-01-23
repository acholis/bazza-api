require "test_helper"

class RidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ride = rides(:one)
  end

  test "should get index" do
    get rides_url, as: :json
    assert_response :success
  end

  test "should create ride" do
    assert_difference('Ride.count') do
      post rides_url, params: { ride: { amount: @ride.amount, customer_id: @ride.customer_id, driver_id: @ride.driver_id, drop_to: @ride.drop_to, pick_up_from: @ride.pick_up_from, pick_up_time: @ride.pick_up_time } }, as: :json
    end

    assert_response 201
  end

  test "should show ride" do
    get ride_url(@ride), as: :json
    assert_response :success
  end

  test "should update ride" do
    patch ride_url(@ride), params: { ride: { amount: @ride.amount, customer_id: @ride.customer_id, driver_id: @ride.driver_id, drop_to: @ride.drop_to, pick_up_from: @ride.pick_up_from, pick_up_time: @ride.pick_up_time } }, as: :json
    assert_response 200
  end

  test "should destroy ride" do
    assert_difference('Ride.count', -1) do
      delete ride_url(@ride), as: :json
    end

    assert_response 204
  end
end
