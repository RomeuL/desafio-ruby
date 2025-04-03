class CreateDespachos < ActiveRecord::Migration[8.0]
  def change
    create_table :despachos do |t|
      t.references :guarda, null: false, foreign_key: true
      t.string :matricula_armeiro
      t.datetime :data
      t.string :tipo
      t.references :arma, null: false, foreign_key: true
      t.integer :quantidade_balas
      t.string :calibre
      t.integer :quantidade_carregadores
      t.string :porte_guarda
      t.string :matricula_guarda
      t.text :justificativa

      t.timestamps
    end
  end
end
