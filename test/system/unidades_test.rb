require "application_system_test_case"

class UnidadesTest < ApplicationSystemTestCase
  setup do
    @unidade = unidades(:one)
  end

  test "visiting the index" do
    visit unidades_url
    assert_selector "h1", text: "Unidades"
  end

  test "should create unidade" do
    visit unidades_url
    click_on "New unidade"

    fill_in "Nome", with: @unidade.nome
    click_on "Create Unidade"

    assert_text "Unidade was successfully created"
    click_on "Back"
  end

  test "should update Unidade" do
    visit unidade_url(@unidade)
    click_on "Edit this unidade", match: :first

    fill_in "Nome", with: @unidade.nome
    click_on "Update Unidade"

    assert_text "Unidade was successfully updated"
    click_on "Back"
  end

  test "should destroy Unidade" do
    visit unidade_url(@unidade)
    click_on "Destroy this unidade", match: :first

    assert_text "Unidade was successfully destroyed"
  end
end
