require "test_helper"

class ArmasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @arma = armas(:one)
  end

  test "should get index" do
    get armas_url
    assert_response :success
  end

  test "should get new" do
    get new_arma_url
    assert_response :success
  end

  test "should create arma" do
    assert_difference("Arma.count") do
      post armas_url, params: { arma: { emprestada: @arma.emprestada, modelo: @arma.modelo, registro: @arma.registro } }
    end

    assert_redirected_to arma_url(Arma.last)
  end

  test "should show arma" do
    get arma_url(@arma)
    assert_response :success
  end

  test "should get edit" do
    get edit_arma_url(@arma)
    assert_response :success
  end

  test "should update arma" do
    patch arma_url(@arma), params: { arma: { emprestada: @arma.emprestada, modelo: @arma.modelo, registro: @arma.registro } }
    assert_redirected_to arma_url(@arma)
  end

  test "should destroy arma" do
    assert_difference("Arma.count", -1) do
      delete arma_url(@arma)
    end

    assert_redirected_to armas_url
  end
end
