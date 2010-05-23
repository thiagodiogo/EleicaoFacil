require 'test_helper'

class RegistroDeVotosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registro_de_votos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registro_de_voto" do
    assert_difference('RegistroDeVoto.count') do
      post :create, :registro_de_voto => { }
    end

    assert_redirected_to registro_de_voto_path(assigns(:registro_de_voto))
  end

  test "should show registro_de_voto" do
    get :show, :id => registro_de_votos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => registro_de_votos(:one).to_param
    assert_response :success
  end

  test "should update registro_de_voto" do
    put :update, :id => registro_de_votos(:one).to_param, :registro_de_voto => { }
    assert_redirected_to registro_de_voto_path(assigns(:registro_de_voto))
  end

  test "should destroy registro_de_voto" do
    assert_difference('RegistroDeVoto.count', -1) do
      delete :destroy, :id => registro_de_votos(:one).to_param
    end

    assert_redirected_to registro_de_votos_path
  end
end
