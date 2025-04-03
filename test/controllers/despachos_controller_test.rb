require "test_helper"

class DespachosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @despacho = despachos(:one)
  end

  test "should get index" do
    get despachos_url
    assert_response :success
  end

  test "should get new" do
    get new_despacho_url
    assert_response :success
  end

  test "should create despacho" do
    assert_difference("Despacho.count") do
      post despachos_url, params: { despacho: { arma_id: @despacho.arma_id, armeiro_id: @despacho.armeiro_id, calibre: @despacho.calibre, data: @despacho.data, guarda_id: @despacho.guarda_id, justificativa: @despacho.justificativa, matricula_armeiro: @despacho.matricula_armeiro, matricula_guarda: @despacho.matricula_guarda, porte_guarda: @despacho.porte_guarda, quantidade_balas: @despacho.quantidade_balas, quantidade_carregadores: @despacho.quantidade_carregadores, tipo: @despacho.tipo } }
    end

    assert_redirected_to despacho_url(Despacho.last)
  end

  test "should show despacho" do
    get despacho_url(@despacho)
    assert_response :success
  end

  test "should get edit" do
    get edit_despacho_url(@despacho)
    assert_response :success
  end

  test "should update despacho" do
    patch despacho_url(@despacho), params: { despacho: { arma_id: @despacho.arma_id, armeiro_id: @despacho.armeiro_id, calibre: @despacho.calibre, data: @despacho.data, guarda_id: @despacho.guarda_id, justificativa: @despacho.justificativa, matricula_armeiro: @despacho.matricula_armeiro, matricula_guarda: @despacho.matricula_guarda, porte_guarda: @despacho.porte_guarda, quantidade_balas: @despacho.quantidade_balas, quantidade_carregadores: @despacho.quantidade_carregadores, tipo: @despacho.tipo } }
    assert_redirected_to despacho_url(@despacho)
  end

  test "should destroy despacho" do
    assert_difference("Despacho.count", -1) do
      delete despacho_url(@despacho)
    end

    assert_redirected_to despachos_url
  end
end
