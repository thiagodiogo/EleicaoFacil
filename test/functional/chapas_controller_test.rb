require 'test_helper'

class ChapasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chapas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chapa" do
    assert_difference('Chapa.count') do
      post :create, :chapa => { }
    end

    assert_redirected_to chapa_path(assigns(:chapa))
  end

  test "should show chapa" do
    get :show, :id => chapas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => chapas(:one).to_param
    assert_response :success
  end

  test "should update chapa" do
    put :update, :id => chapas(:one).to_param, :chapa => { }
    assert_redirected_to chapa_path(assigns(:chapa))
  end

  test "should destroy chapa" do
    assert_difference('Chapa.count', -1) do
      delete :destroy, :id => chapas(:one).to_param
    end

    assert_redirected_to chapas_path
  end
end
