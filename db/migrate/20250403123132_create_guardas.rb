class CreateGuardas < ActiveRecord::Migration[8.0]
  def change
    create_table :guardas do |t|
      t.string :nome_completo
      t.string :matricula
      t.string :porte_arma
      t.references :equipe, null: false, foreign_key: true
      t.boolean :armeiro

      t.timestamps
    end
  end
end
