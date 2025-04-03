require "application_system_test_case"

class DespachosTest < ApplicationSystemTestCase
  setup do
    @despacho = despachos(:one)
  end

  test "visiting the index" do
    visit despachos_url
    assert_selector "h1", text: "Despachos"
  end

  test "should create despacho" do
    visit despachos_url
    click_on "New despacho"

    fill_in "Arma", with: @despacho.arma_id
    fill_in "Armeiro", with: @despacho.armeiro_id
    fill_in "Calibre", with: @despacho.calibre
    fill_in "Data", with: @despacho.data
    fill_in "Guarda", with: @despacho.guarda_id
    fill_in "Justificativa", with: @despacho.justificativa
    fill_in "Matricula armeiro", with: @despacho.matricula_armeiro
    fill_in "Matricula guarda", with: @despacho.matricula_guarda
    fill_in "Porte guarda", with: @despacho.porte_guarda
    fill_in "Quantidade balas", with: @despacho.quantidade_balas
    fill_in "Quantidade carregadores", with: @despacho.quantidade_carregadores
    fill_in "Tipo", with: @despacho.tipo
    click_on "Create Despacho"

    assert_text "Despacho was successfully created"
    click_on "Back"
  end

  test "should update Despacho" do
    visit despacho_url(@despacho)
    click_on "Edit this despacho", match: :first

    fill_in "Arma", with: @despacho.arma_id
    fill_in "Armeiro", with: @despacho.armeiro_id
    fill_in "Calibre", with: @despacho.calibre
    fill_in "Data", with: @despacho.data.to_s
    fill_in "Guarda", with: @despacho.guarda_id
    fill_in "Justificativa", with: @despacho.justificativa
    fill_in "Matricula armeiro", with: @despacho.matricula_armeiro
    fill_in "Matricula guarda", with: @despacho.matricula_guarda
    fill_in "Porte guarda", with: @despacho.porte_guarda
    fill_in "Quantidade balas", with: @despacho.quantidade_balas
    fill_in "Quantidade carregadores", with: @despacho.quantidade_carregadores
    fill_in "Tipo", with: @despacho.tipo
    click_on "Update Despacho"

    assert_text "Despacho was successfully updated"
    click_on "Back"
  end

  test "should destroy Despacho" do
    visit despacho_url(@despacho)
    click_on "Destroy this despacho", match: :first

    assert_text "Despacho was successfully destroyed"
  end
end
