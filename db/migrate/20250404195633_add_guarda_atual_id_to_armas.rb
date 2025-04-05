class AddGuardaAtualIdToArmas < ActiveRecord::Migration[7.0]
  def change
    add_reference :armas, :guarda_atual, foreign_key: { to_table: :guardas }, null: true
  end
end
