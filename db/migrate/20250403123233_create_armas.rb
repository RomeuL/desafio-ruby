class CreateArmas < ActiveRecord::Migration[8.0]
  def change
    create_table :armas do |t|
      t.string :modelo
      t.string :registro
      t.boolean :emprestada

      t.timestamps
    end
  end
end
