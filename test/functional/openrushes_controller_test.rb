require 'test_helper'

class OpenrushesControllerTest < ActionController::TestCase
  setup do
    @openrush = openrushes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:openrushes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create openrush" do
    assert_difference('Openrush.count') do
      post :create, openrush: { class: @openrush.class, email: @openrush.email, name: @openrush.name, phone: @openrush.phone, photo: @openrush.photo, residence: @openrush.residence }
    end

    assert_redirected_to openrush_path(assigns(:openrush))
  end

  test "should show openrush" do
    get :show, id: @openrush
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @openrush
    assert_response :success
  end

  test "should update openrush" do
    put :update, id: @openrush, openrush: { class: @openrush.class, email: @openrush.email, name: @openrush.name, phone: @openrush.phone, photo: @openrush.photo, residence: @openrush.residence }
    assert_redirected_to openrush_path(assigns(:openrush))
  end

  test "should destroy openrush" do
    assert_difference('Openrush.count', -1) do
      delete :destroy, id: @openrush
    end

    assert_redirected_to openrushes_path
  end
end
