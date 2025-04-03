require "application_system_test_case"

class ArmasTest < ApplicationSystemTestCase
  setup do
    @arma = armas(:one)
  end

  test "visiting the index" do
    visit armas_url
    assert_selector "h1", text: "Armas"
  end

  test "should create arma" do
    visit armas_url
    click_on "New arma"

    check "Emprestada" if @arma.emprestada
    fill_in "Modelo", with: @arma.modelo
    fill_in "Registro", with: @arma.registro
    click_on "Create Arma"

    assert_text "Arma was successfully created"
    click_on "Back"
  end

  test "should update Arma" do
    visit arma_url(@arma)
    click_on "Edit this arma", match: :first

    check "Emprestada" if @arma.emprestada
    fill_in "Modelo", with: @arma.modelo
    fill_in "Registro", with: @arma.registro
    click_on "Update Arma"

    assert_text "Arma was successfully updated"
    click_on "Back"
  end

  test "should destroy Arma" do
    visit arma_url(@arma)
    click_on "Destroy this arma", match: :first

    assert_text "Arma was successfully destroyed"
  end
end
