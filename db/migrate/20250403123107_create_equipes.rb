class CreateEquipes < ActiveRecord::Migration[8.0]
  def change
    create_table :equipes do |t|
      t.string :nome
      t.references :unidade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
