require "test_helper"

class GuardasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guarda = guardas(:one)
  end

  test "should get index" do
    get guardas_url
    assert_response :success
  end

  test "should get new" do
    get new_guarda_url
    assert_response :success
  end

  test "should create guarda" do
    assert_difference("Guarda.count") do
      post guardas_url, params: { guarda: { armeiro: @guarda.armeiro, equipe_id: @guarda.equipe_id, matricula: @guarda.matricula, nome_completo: @guarda.nome_completo, porte_arma: @guarda.porte_arma } }
    end

    assert_redirected_to guarda_url(Guarda.last)
  end

  test "should show guarda" do
    get guarda_url(@guarda)
    assert_response :success
  end

  test "should get edit" do
    get edit_guarda_url(@guarda)
    assert_response :success
  end

  test "should update guarda" do
    patch guarda_url(@guarda), params: { guarda: { armeiro: @guarda.armeiro, equipe_id: @guarda.equipe_id, matricula: @guarda.matricula, nome_completo: @guarda.nome_completo, porte_arma: @guarda.porte_arma } }
    assert_redirected_to guarda_url(@guarda)
  end

  test "should destroy guarda" do
    assert_difference("Guarda.count", -1) do
      delete guarda_url(@guarda)
    end

    assert_redirected_to guardas_url
  end
end
