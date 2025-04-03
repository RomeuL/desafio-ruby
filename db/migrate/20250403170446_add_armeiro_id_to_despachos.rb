class AddArmeiroIdToDespachos < ActiveRecord::Migration[6.1]
  def change
    add_column :despachos, :armeiro_id, :bigint
    add_foreign_key :despachos, :guardas, column: :armeiro_id
    add_index :despachos, :armeiro_id
  end
end
