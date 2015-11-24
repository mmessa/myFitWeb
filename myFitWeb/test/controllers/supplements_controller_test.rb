require 'test_helper'

class SupplementsControllerTest < ActionController::TestCase
  setup do
    @supplement = supplements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supplements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supplement" do
    assert_difference('Supplement.count') do
      post :create, supplement: { name: @supplement.name, profile_id: @supplement.profile_id }
    end

    assert_redirected_to supplement_path(assigns(:supplement))
  end

  test "should show supplement" do
    get :show, id: @supplement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supplement
    assert_response :success
  end

  test "should update supplement" do
    patch :update, id: @supplement, supplement: { name: @supplement.name, profile_id: @supplement.profile_id }
    assert_redirected_to supplement_path(assigns(:supplement))
  end

  test "should destroy supplement" do
    assert_difference('Supplement.count', -1) do
      delete :destroy, id: @supplement
    end

    assert_redirected_to supplements_path
  end
end
