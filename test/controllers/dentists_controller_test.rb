require 'test_helper'

class DentistsControllerTest < ActionController::TestCase
  setup do
    @dentist = dentists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dentists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dentist" do
    assert_difference('Dentist.count') do
      post :create, dentist: { email: @dentist.email, isActive: @dentist.isActive, name: @dentist.name, phone_no: @dentist.phone_no, registered_dental_no: @dentist.registered_dental_no }
    end

    assert_redirected_to dentist_path(assigns(:dentist))
  end

  test "should show dentist" do
    get :show, id: @dentist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dentist
    assert_response :success
  end

  test "should update dentist" do
    patch :update, id: @dentist, dentist: { email: @dentist.email, isActive: @dentist.isActive, name: @dentist.name, phone_no: @dentist.phone_no, registered_dental_no: @dentist.registered_dental_no }
    assert_redirected_to dentist_path(assigns(:dentist))
  end

  test "should destroy dentist" do
    assert_difference('Dentist.count', -1) do
      delete :destroy, id: @dentist
    end

    assert_redirected_to dentists_path
  end
end
