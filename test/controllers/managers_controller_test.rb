require 'test_helper'

class ManagersControllerTest < ActionController::TestCase
  setup do
    @manager = managers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:managers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manager" do
    assert_difference('Manager.count') do
      post :create, manager: {  }
    end

    assert_redirected_to manager_path(assigns(:manager))
  end

  test "should show manager" do
    get :show, id: @manager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manager
    assert_response :success
  end

  test "should update manager" do
    patch :update, id: @manager, manager: {  }
    assert_redirected_to manager_path(assigns(:manager))
  end

  test "should destroy manager" do
    assert_difference('Manager.count', -1) do
      delete :destroy, id: @manager
    end

    assert_redirected_to managers_path
  end
end
