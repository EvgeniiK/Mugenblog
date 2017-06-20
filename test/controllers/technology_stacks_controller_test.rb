require 'test_helper'

class TechnologyStacksControllerTest < ActionController::TestCase
  setup do
    @technology_stack = technology_stacks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:technology_stacks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create technology_stack" do
    assert_difference('TechnologyStack.count') do
      post :create, technology_stack: {  }
    end

    assert_redirected_to technology_stack_path(assigns(:technology_stack))
  end

  test "should show technology_stack" do
    get :show, id: @technology_stack
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @technology_stack
    assert_response :success
  end

  test "should update technology_stack" do
    patch :update, id: @technology_stack, technology_stack: {  }
    assert_redirected_to technology_stack_path(assigns(:technology_stack))
  end

  test "should destroy technology_stack" do
    assert_difference('TechnologyStack.count', -1) do
      delete :destroy, id: @technology_stack
    end

    assert_redirected_to technology_stacks_path
  end
end
