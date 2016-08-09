require 'test_helper'

class RawDataControllerTest < ActionController::TestCase
  setup do
    @hint = hints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hint" do
    assert_difference('RawDatum.count') do
      post :create, hint: { command: @hint.command, description: @hint.description, link: @hint.link, theme: @hint.theme }
    end

    assert_redirected_to hint_path(assigns(:hint))
  end

  test "should show hint" do
    get :show, id: @hint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hint
    assert_response :success
  end

  test "should update hint" do
    patch :update, id: @hint, hint: { command: @hint.command, description: @hint.description, link: @hint.link, theme: @hint.theme }
    assert_redirected_to hint_path(assigns(:hint))
  end

  test "should destroy hint" do
    assert_difference('RawDatum.count', -1) do
      delete :destroy, id: @hint
    end

    assert_redirected_to hints_path
  end
end
