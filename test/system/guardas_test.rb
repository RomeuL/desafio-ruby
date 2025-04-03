require "application_system_test_case"

class GuardasTest < ApplicationSystemTestCase
  setup do
    @guarda = guardas(:one)
  end

  test "visiting the index" do
    visit guardas_url
    assert_selector "h1", text: "Guardas"
  end

  test "should create guarda" do
    visit guardas_url
    click_on "New guarda"

    check "Armeiro" if @guarda.armeiro
    fill_in "Equipe", with: @guarda.equipe_id
    fill_in "Matricula", with: @guarda.matricula
    fill_in "Nome completo", with: @guarda.nome_completo
    fill_in "Porte arma", with: @guarda.porte_arma
    click_on "Create Guarda"

    assert_text "Guarda was successfully created"
    click_on "Back"
  end

  test "should update Guarda" do
    visit guarda_url(@guarda)
    click_on "Edit this guarda", match: :first

    check "Armeiro" if @guarda.armeiro
    fill_in "Equipe", with: @guarda.equipe_id
    fill_in "Matricula", with: @guarda.matricula
    fill_in "Nome completo", with: @guarda.nome_completo
    fill_in "Porte arma", with: @guarda.porte_arma
    click_on "Update Guarda"

    assert_text "Guarda was successfully updated"
    click_on "Back"
  end

  test "should destroy Guarda" do
    visit guarda_url(@guarda)
    click_on "Destroy this guarda", match: :first

    assert_text "Guarda was successfully destroyed"
  end
end
