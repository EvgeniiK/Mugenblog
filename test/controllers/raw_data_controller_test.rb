require 'test_helper'

class RawDataControllerTest < ActionController::TestCase
  setup do
    @raw_datum = raw_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:raw_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create raw_datum" do
    assert_difference('RawDatum.count') do
      post :create, raw_datum: { command: @raw_datum.command, description: @raw_datum.description, link: @raw_datum.link, theme: @raw_datum.theme }
    end

    assert_redirected_to raw_datum_path(assigns(:raw_datum))
  end

  test "should show raw_datum" do
    get :show, id: @raw_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @raw_datum
    assert_response :success
  end

  test "should update raw_datum" do
    patch :update, id: @raw_datum, raw_datum: { command: @raw_datum.command, description: @raw_datum.description, link: @raw_datum.link, theme: @raw_datum.theme }
    assert_redirected_to raw_datum_path(assigns(:raw_datum))
  end

  test "should destroy raw_datum" do
    assert_difference('RawDatum.count', -1) do
      delete :destroy, id: @raw_datum
    end

    assert_redirected_to raw_data_path
  end
end
