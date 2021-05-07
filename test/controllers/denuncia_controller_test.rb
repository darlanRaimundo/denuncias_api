require "test_helper"

class DenunciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @denuncium = denuncia(:one)
  end

  test "should get index" do
    get denuncia_url, as: :json
    assert_response :success
  end

  test "should create denuncium" do
    assert_difference('Denuncium.count') do
      post denuncia_url, params: { denuncium: { descricao: @denuncium.descricao, latitude: @denuncium.latitude, longitude: @denuncium.longitude, medida: @denuncium.medida, status: @denuncium.status, usuario_criador: @denuncium.usuario_criador } }, as: :json
    end

    assert_response 201
  end

  test "should show denuncium" do
    get denuncium_url(@denuncium), as: :json
    assert_response :success
  end

  test "should update denuncium" do
    patch denuncium_url(@denuncium), params: { denuncium: { descricao: @denuncium.descricao, latitude: @denuncium.latitude, longitude: @denuncium.longitude, medida: @denuncium.medida, status: @denuncium.status, usuario_criador: @denuncium.usuario_criador } }, as: :json
    assert_response 200
  end

  test "should destroy denuncium" do
    assert_difference('Denuncium.count', -1) do
      delete denuncium_url(@denuncium), as: :json
    end

    assert_response 204
  end
end
